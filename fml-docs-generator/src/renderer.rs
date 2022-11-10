
use std::fs::{File};
use std::error::Error;
use std::io::prelude::*;

use handlebars;
use handlebars::{to_json, Handlebars};
use serde_json;
use serde_json::value::{Map, Value};
use serde_json::{json};

use regex;

use crate::parser;
use parser::{Function, Constructor};
use crate::pages;
use pages::{Page};

fn map_from_function(function: &Function) -> Map<String, Value> {

    let mut map = Map::new();

    let ret = function.return_type_name.as_deref().unwrap_or("void");
    map.insert("return_type".to_string(), to_json(ret));
    map.insert("name".to_string(), to_json(&function.name));
    let params = function.parameters.iter().map(|p| json!({
        "name": p.name,
        "type": p.type_name,
        "description": p.description,
        "default_value": p.default_value,
    })).collect();
    map.insert("parameters".to_string(), params);
    map.insert("fmod_docs_link".to_string(), to_json(&function.fmod_docs_link));

    map
}

fn map_from_constructor(constructor: &Constructor) -> Map<String, Value> {

    let mut map = Map::new();

    map.insert("constructor_name".to_string(), to_json(&constructor.name));
    let params = constructor.parameters.iter().map(|p| json!({
        "name": p.name,
        "type": p.type_name,
        "description": p.description,
        "default_value": p.default_value,
    })).collect();
    map.insert("constructor_parameters".to_string(), params);
    let methods = constructor.functions.iter().map(|f| json!({
        "return_type": f.return_type_name.as_deref().unwrap_or("void"),
        "name": f.name,
        "parameters": f.parameters.iter().map(|p| json!({
            "name": p.name,
            "type": p.type_name,
            "description": p.description,
            "default_value": p.default_value,
        })).collect::<handlebars::JsonValue>(),
        "fmod_docs_link": f.fmod_docs_link,
    })).collect();
    map.insert("constructor_methods".to_string(), methods);
    map.insert("constructor_fmod_docs_link".to_string(), to_json(&constructor.fmod_docs_link));

    map
}

fn map_from_page(page: &Page) -> Map<String, Value> {

    let mut map = Map::new();

    map.insert("title".to_string(), to_json(&page.title));
    map.insert("doc_filename".to_string(), to_json(&page.doc_filename));
    let constructor_maps: Vec<Map<String, Value>> = page.parse_result.constructors.iter().map(map_from_constructor).collect();
    map.insert("constructors".to_string(), to_json(&constructor_maps));
    let function_maps: Vec<Map<String, Value>> = page.parse_result.functions.iter().map(map_from_function).collect();
    map.insert("functions".to_string(), to_json(&function_maps));

    map
}

fn inject_links(markdown_string: &str, pages: &Vec<Page>) -> Result<String, Box<dyn Error>>
{
    let mut string = markdown_string.to_string();
    for page in pages {
        let reg = regex::Regex::new(&format!(" {}", page.title))?;
        let replacement = format!(" <a href=\"/#/ref/{}\">{}</a>", page.title, page.title);
        string = reg.replace_all(&string, replacement).to_string();
    }
    Ok(string)
}

pub fn render_function(function: &Function, out: &mut dyn std::io::Write) -> Result<(), Box<dyn Error>> {

    let mut template = String::new();
    File::open("templates/function.hbs")?.read_to_string(&mut template)?;

    let data = map_from_function(function);
    let hbs = Handlebars::new();
    let rendered = hbs.render_template(&template, &data)?;
    write!(out, "{}", &rendered)?;

    Ok(())
}

pub fn render_constructor(constructor: &Constructor, out: &mut dyn std::io::Write) -> Result<(), Box<dyn Error>> {

    let mut template = String::new();
    File::open("templates/constructor.hbs")?.read_to_string(&mut template)?;

    let data = map_from_constructor(constructor);
    let hbs = Handlebars::new();
    let rendered = hbs.render_template(&template, &data)?;
    write!(out, "{}", &rendered)?;

    Ok(())
}

pub fn render_page_quickref(page: &Page, all_pages: &Vec<Page>, out: &mut dyn std::io::Write) -> Result<(), Box<dyn Error>> {

    let mut template = String::new();
    File::open("templates/page_quickref.hbs")?.read_to_string(&mut template)?;

    let data = map_from_page(page);
    let hbs = Handlebars::new();
    let mut rendered = hbs.render_template(&template, &data)?;

    rendered = inject_links(&rendered, all_pages)?;

    write!(out, "{}", &rendered)?;

    Ok(())
}

pub fn render_sidebar(ref_pages: &Vec<Page>, out: &mut dyn std::io::Write) -> Result<(), Box<dyn Error>> {

    let mut template = String::new();
    File::open("templates/sidebar.hbs")?.read_to_string(&mut template)?;

    let mut data = Map::new();
    data.insert("ref_pages".to_string(), to_json(ref_pages));

    let hbs = Handlebars::new();
    let rendered = hbs.render_template(&template, &data)?;
    write!(out, "{}", &rendered)?;

    Ok(())
}

pub fn render_ref(all_pages: &Vec<Page>, out: &mut dyn std::io::Write) -> Result<(), Box<dyn Error>> {

    let mut ref_intro_md = String::new();
    File::open("templates/ref_intro.md")?.read_to_string(&mut ref_intro_md)?;
    write!(out, "{}", ref_intro_md)?;

    for page in all_pages {
        write!(out, "\n---\n")?;
        render_page_quickref(page, all_pages, out)?;
    }

    Ok(())
}

pub fn render_page(page: &Page, all_pages: &Vec<Page>, out: &mut dyn std::io::Write) -> Result<(), Box<dyn Error>> {

    write!(out, "# {}\n\n", page.title)?;

    render_page_quickref(page, all_pages, out)?;

    for c in &page.parse_result.constructors {
        render_constructor(c, out)?;
    }
    for f in &page.parse_result.functions {
        render_function(f, out)?;
    }

    Ok(())
}
