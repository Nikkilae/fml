
use std::fs::{File};
use std::error::Error;
use std::io::prelude::*;

use handlebars;
use handlebars::{to_json, Handlebars};
use serde_json;
use serde_json::value::{Map};
use serde_json::{json};

use crate::parser;
use parser::{Function, Constructor};
use crate::pages;
use pages::{Page};

pub fn render_function(function: &Function, out: &mut dyn std::io::Write) -> Result<(), Box<dyn Error>> {

    let mut template = String::new();
    File::open("templates/function.hbs")?.read_to_string(&mut template)?;

    let mut data = Map::new();
    let ret = function.return_type_name.as_deref().unwrap_or("void");
    data.insert("return_type".to_string(), to_json(ret));
    data.insert("name".to_string(), to_json(&function.name));
    let params = function.parameters.iter().map(|p| json!({
        "name": p.name,
        "type": p.type_name,
        "description": p.description,
        "default_value": p.default_value,
    })).collect();
    data.insert("parameters".to_string(), params);
    data.insert("fmod_docs_link".to_string(), to_json(&function.fmod_docs_link));

    let hbs = Handlebars::new();
    let rendered = hbs.render_template(&template, &data)?;
    write!(out, "{}", &rendered)?;

    Ok(())
}

pub fn render_constructor(constructor: &Constructor, out: &mut dyn std::io::Write) -> Result<(), Box<dyn Error>> {

    let mut template = String::new();
    File::open("templates/constructor.hbs")?.read_to_string(&mut template)?;

    let mut data = Map::new();
    data.insert("constructor_name".to_string(), to_json(&constructor.name));
    let params = constructor.parameters.iter().map(|p| json!({
        "name": p.name,
        "type": p.type_name,
        "description": p.description,
        "default_value": p.default_value,
    })).collect();
    data.insert("constructor_parameters".to_string(), params);
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
    data.insert("constructor_methods".to_string(), methods);
    data.insert("constructor_fmod_docs_link".to_string(), to_json(&constructor.fmod_docs_link));

    let hbs = Handlebars::new();
    let rendered = hbs.render_template(&template, &data)?;
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
