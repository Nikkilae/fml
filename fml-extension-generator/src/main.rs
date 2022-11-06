
use std::env;
use std::fs;

use chrono;
use std::fs::File;
use std::io::{self, BufRead};
use std::path::{Path, PathBuf};

use glob::glob;

use serde_jsonrc;
use serde::{Serialize, Deserialize};

const TYPE_STRING: i32 = 1;
const TYPE_DOUBLE: i32 = 2;

struct ExtFunction {
    name: String,
    return_type: i32,
    arguments: Vec<(String, i32)>,
}

fn convert_function(function: &ExtFunction, ext_info: &ExtensionInfo) -> (YyExtFunction, YyOrderEntry) {

    let arg_types: Vec<i32> = function.arguments.iter().map(|(_arg_name, arg_type)| *arg_type).collect();
    let arg_names: Vec<String> = function.arguments.iter().map(|(arg_name, _arg_type)| arg_name.to_string()).collect();

    let func = YyExtFunction {
        externalName: function.name.to_string(),
        kind: 1, // Don't know what this is but it seems to be 1 on all functions.
        help: "__".to_string() + &function.name.to_string() + "(" + &arg_names.join(", ") + ")",
        hidden: false,
        returnType: function.return_type,
        argCount: 0, // For whatever reason this variable seems to be 0 even on functions that have one or more arguments.
        args: arg_types,
        resourceVersion: "1.0".to_string(),
        name: "__".to_string() + &function.name,
        tags: Vec::new(),
        resourceType: "GMExtensionFunction".to_string(),
    };

    let extension_name = ext_info.extension_yy.file_stem().unwrap().to_str().unwrap();
    let order = YyOrderEntry {
        name: "__".to_string() + &function.name,
        path: format!("extensions/{}/{}.yy", extension_name, extension_name).to_string(),
    };

    (func, order)
}

#[derive(Serialize, Deserialize)]
#[allow(non_snake_case)]
struct YyExtFunction {
    externalName: String,
    kind: i32,
    help: String,
    hidden: bool,
    returnType: i32,
    argCount: i32,
    args: Vec<i32>,
    resourceVersion: String,
    name: String,
    tags: Vec<String>,
    resourceType: String,
}

#[derive(Serialize, Deserialize)]
#[allow(non_snake_case)]
struct YyOrderEntry {
    name: String,
    path: String,
}

struct EnvArgs {
    repo_directory: String,
}

fn get_env_args() -> Option<EnvArgs> {
    let args: Vec<String> = env::args().collect();
    match args.len() {
        2 => Some(EnvArgs{ repo_directory: args[1].clone() }),
        _ => None,
    }
}

fn read_lines<P>(filename: P) -> io::Result<io::Lines<io::BufReader<File>>>
where P: AsRef<Path>, {
    let file = File::open(filename)?;
    Ok(io::BufReader::new(file).lines())
}

const EXT_PREFIX: &str = "EXT";

fn parse_functions_from_header_file(filename: &str) -> Vec<ExtFunction> {
    
    let mut functions = Vec::new();
    
    let lines = read_lines(filename).unwrap();
    for line in lines {
        if let Ok(line) = line {
            if line.len() >= 4 && line[0..EXT_PREFIX.len()] == *EXT_PREFIX {
                let major_split: Vec<&str> = line.split('(').collect();
                let first_split: Vec<&str> = major_split[0].split(' ').collect();
                let return_type = if first_split[1] == "double" { TYPE_DOUBLE } else { TYPE_STRING };
                let name_str = first_split[first_split.len() - 1].to_string();
                let second_split: Vec<&str> = (major_split[1][0..major_split[1].len() - 2]).split(", ").collect();
                let mut args = Vec::new();
                if second_split.len() >= 1 && second_split[0] != "" {
                    for arg in second_split {
                        let arg_split: Vec<&str> = arg.split(' ').collect();
                        let arg_name = arg_split[arg_split.len() - 1].to_string();

                        if arg.contains('*') {
                            args.push((arg_name, TYPE_STRING));
                        }
                        else {
                            args.push((arg_name, TYPE_DOUBLE));
                        }
                    }

                }
                functions.push(ExtFunction {
                    name: name_str,
                    return_type: return_type,
                    arguments: args,
                });
            }
        }
    }

    functions
}

fn get_source_headers(repo_dir: &str) -> Vec<PathBuf> {
    let mut result = vec![];
    let pattern = Path::new(repo_dir).join("FmlLib\\src\\fml_*.hpp").display().to_string();
    for entry in glob(&pattern).unwrap() {
        result.push(entry.unwrap());
    }
    result
}

struct ExtensionInfo {
    source_headers: Vec<PathBuf>,
    destination_dll: PathBuf,
    extension_yy: PathBuf,
}

impl ExtensionInfo {
    fn new(repo_dir: &str, extension_directory: &str, destination_dll: &str, extension_yy: &str) -> Self {
        ExtensionInfo {
            source_headers:         get_source_headers(repo_dir),
            destination_dll:        Path::new(repo_dir).join(extension_directory).join(destination_dll),
            extension_yy:           Path::new(repo_dir).join(extension_directory).join(extension_yy),
        }
    }
}

fn get_extension_infos(repo_dir: &str) -> Vec<ExtensionInfo> {
    vec![
        ExtensionInfo::new(
            repo_dir,
            "FmlYy\\extensions\\__ext_fml",
            "fml_x64.dll",
            "__ext_fml.yy",
        ),
    ]
}

fn generate_extension_yy(ext_info: &ExtensionInfo) {

    println!("Generating extension function definitions into the GM extension .yy-file...");

    let header_filenames: Vec<String> = ext_info.source_headers.iter().map(|path| path.display().to_string()).collect();
    let mut functions = Vec::new();
    for filename in header_filenames {
        let mut funcs = parse_functions_from_header_file(&filename);
        functions.append(&mut funcs);
    }
    functions.sort_by_key(|f| f.name.to_string());
    let mut function_values = Vec::new();
    let mut order_values = Vec::new();
    for function in functions {
        let (yy_func, yy_order) = convert_function(&function, ext_info);
        function_values.push(serde_jsonrc::to_value(&yy_func).unwrap());
        order_values.push(serde_jsonrc::to_value(&yy_order).unwrap());
    }
    
    let yy_ext_string = fs::read_to_string(&ext_info.extension_yy).unwrap();
    let mut v: serde_jsonrc::Value = serde_jsonrc::from_str(&yy_ext_string).unwrap();
    let dll_filename = ext_info.destination_dll.file_name().unwrap().to_str().unwrap();
    if let serde_jsonrc::Value::Array(files) = &mut v["files"] {
        for file in files {
            if file["filename"] == dll_filename {
                file["functions"] = serde_jsonrc::Value::Array(function_values);
                file["order"] = serde_jsonrc::Value::Array(order_values);
                break;
            }
        }
    }
    
    fs::write(&ext_info.extension_yy, serde_jsonrc::to_string(&v).unwrap()).unwrap();
}

fn update(ext_info: &ExtensionInfo) {
    generate_extension_yy(ext_info);
    println!("All done {}", chrono::offset::Local::now().format("%Y-%m-%d %H:%M:%S"));
}

fn main() {

    let env_args = get_env_args().expect("Invalid command line arguments.");
    let repo_dir = &env_args.repo_directory;
    println!("{}", repo_dir);

    let ext_infos = get_extension_infos(repo_dir);

    for ext_info in &ext_infos {
        update(ext_info);
    }
    
}
