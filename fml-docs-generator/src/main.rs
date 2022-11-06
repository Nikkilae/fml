
use std::path::Path;
use std::env;
use std::error::Error;
use std::fs;
use std::fs::{File};
use std::io::{BufWriter};

mod pages;
mod parser;
mod renderer;

struct Args {
    yy_directory: String,
    docs_directory: String,
}

fn get_args() -> Option<Args> {
    let args: Vec<String> = env::args().collect();
    match args.len() {
        3 => Some(Args {
            yy_directory: args[1].clone(),
            docs_directory: args[2].clone(),
        }),
        _ => None,
    }
}

fn main() -> Result<(), Box<dyn Error>> {

    let args = get_args().unwrap();

    println!("Yy directory: {}", &args.yy_directory);
    println!("Docs directory: {}", &args.docs_directory);

    let pages = pages::make_pages();

    for page in &pages {
        let full_source_filename = Path::new(&args.yy_directory).join(page.source_filename);
        let full_doc_filename = Path::new(&args.docs_directory).join("ref").join(page.doc_filename);
        let res = parser::parse_from_file(&full_source_filename.display().to_string())?;
        fs::create_dir_all(full_doc_filename.parent().unwrap())?;
        let mut bw = BufWriter::new(File::create(&full_doc_filename)?);
        for c in &res.constructors {
            renderer::render_constructor(c, &mut bw)?;
        }
        for f in &res.global_functions {
            renderer::render_function(f, &mut bw)?;
        }
    }

    let sidebar_filename = Path::new(&args.docs_directory).join("_sidebar.md");
    let mut bw = BufWriter::new(File::create(&sidebar_filename)?);
    renderer::render_sidebar(&pages, &mut bw)?;

    println!("Done.");

    Ok(())
}
