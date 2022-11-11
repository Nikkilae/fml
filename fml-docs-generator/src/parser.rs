
use std::io::{BufReader};
use std::fs::{File};
use std::io::prelude::*;
use std::error::Error;

use serde::{Serialize};

use regex::{Regex};
use lazy_static::lazy_static;

struct JSDocParameterLine {
    type_name: String,
    name: String,
    description: String,
    default_value_name: String,
}
impl JSDocParameterLine {
    fn parse_from(line: &str) -> Option<JSDocParameterLine> {
        lazy_static! {
            static ref REGEX: Regex = Regex::new(r"\s*///\s*@param\s*\{\s*(.+)\s*\}\s*([[[:alpha:]]_[0-9]]+)\s*(=\s(\S*))?\s?(.*)?").unwrap();
        }
        match REGEX.captures(&line) {
            Some(caps) => Some(JSDocParameterLine {
                type_name: caps.get(1).unwrap().as_str().to_string(),
                name: caps.get(2).unwrap().as_str().to_string(),
                default_value_name: caps.get(4).and_then(|c| Some(c.as_str().to_string())).as_deref().unwrap_or("").to_string(),
                description: caps.get(5).and_then(|c| Some(c.as_str().to_string())).as_deref().unwrap_or("").to_string(),
            }),
            None => None,
        }
    }
}

struct JSDOcReturnLine {
    type_name: String,
}
impl JSDOcReturnLine {
    fn parse_from(line: &str) -> Option<JSDOcReturnLine> {
        lazy_static! {
            static ref REGEX: Regex = Regex::new(r"\s*///\s*@(return|returns)\s*\{\s*(.+)\s*\}").unwrap();
        }
        match REGEX.captures(line) {
            Some(caps) => Some(JSDOcReturnLine {
                type_name: caps.get(2).unwrap().as_str().to_string(),
            }),
            None => None,
        }
    }
}

struct JSDocNoTagLine {
    text: String,
}
impl JSDocNoTagLine {
    fn parse_from(line: &str) -> Option<JSDocNoTagLine> {
        lazy_static! {
            static ref REGEX: Regex = Regex::new(r"\s*///\s*(.*)").unwrap();
        }
        match REGEX.captures(line) {
            Some(caps) => Some(JSDocNoTagLine {
                text: caps.get(1).unwrap().as_str().to_string(),
            }),
            None => None,
        }
    }
}

struct FunctionLine {
    name: String,
    is_static: bool,
}
impl FunctionLine {
    fn parse_from(ilne: &str) -> Option<FunctionLine> {
        lazy_static! {
            static ref REGEX_STATIC: Regex = Regex::new(r"\s*static\s*([[[:alpha:]]_[0-9]]+)\s*=\s*function").unwrap();
            static ref REGEX_NON_STATIC: Regex = Regex::new(r"\s*function\s*([[[:alpha:]]_[0-9]]+)\s*\(.*\)").unwrap();
        }
        if let Some(caps) = REGEX_STATIC.captures(&ilne) {
            Some(FunctionLine {
                name: caps.get(1).unwrap().as_str().to_string(),
                is_static: true,
            })
        }
        else if let Some(caps) = REGEX_NON_STATIC.captures(&ilne) {
            Some(FunctionLine {
                name: caps.get(1).unwrap().as_str().to_string(),
                is_static: false,
            })
        }
        else {
            None
        }
    }
}

#[derive(Serialize, Debug)]
struct ConstructorLine {
    name: String,
}
impl ConstructorLine {
    fn parse_from(line: &str) -> Option<ConstructorLine> {
        lazy_static! {
            static ref REGEX: Regex = Regex::new(r"\s*function\s([[[:alpha:]]_[0-9]]+)\s*\(.*\)\s*constructor*").unwrap();
        }
        match REGEX.captures(line) {
            Some(caps) => Some(ConstructorLine {
                name: caps.get(1).unwrap().as_str().to_string(),
            }),
            None => None,
        }
    }
}

#[derive(Serialize, Debug)]
struct EnumLine {
    name: String,
}
impl EnumLine {
    fn parse_from(line: &str) -> Option<EnumLine> {
        lazy_static! {
            static ref REGEX: Regex = Regex::new(r"^\s*enum\s([[[:alpha:]]_[0-9]]+)").unwrap();
        }
        match REGEX.captures(line) {
            Some(caps) => Some(EnumLine {
                name: caps.get(1).unwrap().as_str().to_string(),
            }),
            None => None,
        }
    }
}

#[derive(Clone, Serialize, Debug)]
pub struct Constructor {
    pub name: String,
    pub parameters: Vec<Parameter>,
    pub functions: Vec<Function>,
    pub description: String,
    pub fmod_docs_link: String,
}

#[derive(Clone, Serialize, Debug)]
pub struct Parameter {
    pub type_name: String,
    pub name: String,
    pub description: String,
    pub default_value: String,
}

#[derive(Clone, Serialize, Debug)]
pub struct Function {
    pub name: String,
    pub parameters: Vec<Parameter>,
    pub return_type_name: Option<String>,
    pub is_static: bool,
    pub description: String,
    pub fmod_docs_link: String,
    pub implemented: bool,
}

#[derive(Clone, Serialize, Debug)]
pub struct Enum {
    pub name: String,
    pub fmod_docs_link: String,
    pub description: String,
}

#[derive(Clone, Serialize, Debug)]
pub struct ParseResult {
    pub constructors: Vec<Constructor>,
    pub functions: Vec<Function>,
    pub enums: Vec<Enum>,
}
impl ParseResult {
    pub fn empty() -> Self {
        Self {
            constructors: Vec::new(),
            functions: Vec::new(),
            enums: Vec::new(),
        }
    }
    pub fn merge(result1: ParseResult, result2: ParseResult) -> ParseResult {
        ParseResult {
            constructors: [ result1.constructors, result2.constructors ].concat().into(),
            functions: [ result1.functions, result2.functions ].concat().into(),
            enums: [ result1.enums, result2.enums ].concat().into(),
        }
    }
}

const FMOD_DOCS_LINK_PREFIX: &'static str = "https://www.fmod.com";

pub fn parse_from_file(filename: &str) -> Result<ParseResult, Box<dyn Error>> {
    
    let file = File::open(filename)?;
    let br = BufReader::new(file);

    let mut parameters = Vec::new();
    let mut return_type_name = None;
    let mut description_lines: Vec<String> = Vec::new();

    let mut constructors = Vec::new();
    let mut functions = Vec::new();
    let mut enums = Vec::new();

    for line in br.lines() {
        let line = line?;
        
        if let Some(constructor_line) = ConstructorLine::parse_from(&line) {

            let mut fmod_docs_link = String::new();
            let mut i = 0;
            while i < description_lines.len() {
                let trimmed = description_lines[i].trim();
                if trimmed.starts_with(FMOD_DOCS_LINK_PREFIX) {
                    fmod_docs_link = trimmed.to_string();
                    break;
                }
                i += 1;
            }
            if i < description_lines.len() {
                description_lines.remove(i);
            }
            let description = description_lines.join("\n").to_string();

            constructors.push(Constructor {
                name: constructor_line.name,
                parameters,
                functions: Vec::new(),
                description,
                fmod_docs_link,
            });
            parameters = Vec::new();
            description_lines = Vec::new();
        }
        else if let Some(enum_line) = EnumLine::parse_from(&line) {
            let mut fmod_docs_link = String::new();
            let mut i = 0;
            while i < description_lines.len() {
                let trimmed = description_lines[i].trim();
                if trimmed.starts_with(FMOD_DOCS_LINK_PREFIX) {
                    fmod_docs_link = trimmed.to_string();
                    break;
                }
                i += 1;
            }
            if i < description_lines.len() {
                description_lines.remove(i);
            }
            let description = description_lines.join("\n").to_string();

            enums.push(Enum {
                name: enum_line.name,
                fmod_docs_link,
                description,
            });

            description_lines = Vec::new();
        }
        else if let Some(param_line) = JSDocParameterLine::parse_from(&line) {
            parameters.push(Parameter {
                type_name: param_line.type_name,
                name: param_line.name,
                description: param_line.description,
                default_value: param_line.default_value_name,
            })
        }
        else if let Some(return_line) = JSDOcReturnLine::parse_from(&line) {
            return_type_name = Some(return_line.type_name);
        }
        else if let Some(function_line) = FunctionLine::parse_from(&line) {

            let mut fmod_docs_link = String::new();
            let mut i = 0;
            while i < description_lines.len() {
                let trimmed = description_lines[i].trim();
                if trimmed.starts_with(FMOD_DOCS_LINK_PREFIX) {
                    fmod_docs_link = trimmed.to_string();
                    break;
                }
                i += 1;
            }
            if i < description_lines.len() {
                description_lines.remove(i);
            }
            let description = description_lines.join("\n").to_string();

            let implemented = !function_line.name.starts_with("_");
            let function = Function {
                name: function_line.name,
                parameters,
                return_type_name,
                is_static: function_line.is_static,
                description,
                fmod_docs_link,
                implemented,
            };
            if implemented { // TODO: When no implemented, still produce it but annotate it differently in the docs.
                if function.is_static {
                    match constructors.last_mut() {
                        Some(c) => c.functions.push(function),
                        None => functions.push(function),
                    };
                }
                else {
                    functions.push(function);
                }
            }
            parameters = Vec::new();
            return_type_name = None;
            description_lines = Vec::new();
        }
        else if let Some(no_tag_line) = JSDocNoTagLine::parse_from(&line) {
            description_lines.push(no_tag_line.text);
        }
    }

    Ok(ParseResult { constructors, functions, enums })
}
