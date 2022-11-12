
use crate::parser;
use crate::parser::{ParseResult};

#[derive(serde::Serialize, Debug)]
pub struct Page {
    pub title: &'static str,
    pub doc_filename_stem: &'static str,
    pub doc_filename: std::path::PathBuf,
    pub parse_result: ParseResult,
}

pub fn parse_pages(yy_directory: &str, docs_directory: &str) -> Vec<Page> {

    get_page_definitions().iter().map(|(title, doc_filename_stem, source_filenames)| {
        let parse_result = source_filenames.iter().fold(ParseResult::empty(), |accum, filename| {
            let full_filename = std::path::Path::new(yy_directory).join(filename);
            let result = parser::parse_from_file(&full_filename.display().to_string()).unwrap();
            ParseResult::merge(accum, result)
        });
        let doc_filename = std::path::Path::new(docs_directory).join("ref").join(doc_filename_stem);
        Page { title, doc_filename_stem, doc_filename, parse_result, }
    }).collect()

}

pub fn find_macro_in_pages<'a>(pages: &'a [Page], name: &str) -> Option<&'a parser::Macro> {
    for page in pages {
        for m in &page.parse_result.macros {
            if m.name == name {
                return Some(&m);
            }
        }
    }
    None
}

fn get_page_definitions<'a>() -> Vec<(&'a str, &'a str, Vec<&'a str>)> {
    vec![(
            "FmodBank",
            "FmodBank.md",
            vec![
                "scripts\\__scr_fml_FmodBank\\__scr_fml_FmodBank.gml",
            ],
        ), (
            "FmodBus",
            "FmodBus.md",
            vec![
                "scripts\\__scr_fml_FmodBus\\__scr_fml_FmodBus.gml",
            ],
        ), (
            "FmodEventDescription",
            "FmodEventDescription.md",
            vec![
                "scripts\\__scr_fml_FmodEventDescription\\__scr_fml_FmodEventDescription.gml",
            ],
        ), (
            "FmodEventInstance",
            "FmodEventInstance.md",
            vec![
                "scripts\\__scr_fml_FmodEventInstance\\__scr_fml_FmodEventInstance.gml",
            ],
        ), (
            "FmodStudioSystem",
            "FmodStudioSystem.md",
            vec![
                "scripts\\__scr_fml_FmodStudioSystem\\__scr_fml_FmodStudioSystem.gml",
            ],
        ), (
            "FmodSystem",
            "FmodSystem.md",
            vec![
                "scripts\\__scr_fml_FmodSystem\\__scr_fml_FmodSystem.gml",
            ],
        ), (
            "FmodVca",
            "FmodVca.md",
            vec![
                "scripts\\__scr_fml_FmodVca\\__scr_fml_FmodVca.gml",
            ],
        ), (
            "FmlError",
            "FmlError.md",
            vec![
                "scripts\\__scr_fml_FmlError\\__scr_fml_FmlError.gml",
            ],
        ), (
            "Miscellaneous structs",
            "Struct.md",
            vec![
                "scripts\\__scr_fml_FMOD_3D_ATTRIBUTES\\__scr_fml_FMOD_3D_ATTRIBUTES.gml",
                "scripts\\__scr_fml_FMOD_CPU_USAGE\\__scr_fml_FMOD_CPU_USAGE.gml",
                "scripts\\__scr_fml_FMOD_GUID\\__scr_fml_FMOD_GUID.gml",
                "scripts\\__scr_fml_FMOD_STUDIO_ADVANCEDSETTINGS\\__scr_fml_FMOD_STUDIO_ADVANCEDSETTINGS.gml",
                "scripts\\__scr_fml_FMOD_STUDIO_BUFFER_INFO\\__scr_fml_FMOD_STUDIO_BUFFER_INFO.gml",
                "scripts\\__scr_fml_FMOD_STUDIO_BUFFER_USAGE\\__scr_fml_FMOD_STUDIO_BUFFER_USAGE.gml",
                "scripts\\__scr_fml_FMOD_STUDIO_CPU_USAGE\\__scr_fml_FMOD_STUDIO_CPU_USAGE.gml",
                "scripts\\__scr_fml_FMOD_STUDIO_MEMORY_USAGE\\__scr_fml_FMOD_STUDIO_MEMORY_USAGE.gml",
                "scripts\\__scr_fml_FMOD_STUDIO_PARAMETER_DESCRIPTION\\__scr_fml_FMOD_STUDIO_PARAMETER_DESCRIPTION.gml",
                "scripts\\__scr_fml_FMOD_STUDIO_PARAMETER_ID\\__scr_fml_FMOD_STUDIO_PARAMETER_ID.gml",
                "scripts\\__scr_fml_FMOD_STUDIO_USER_PROPERTY\\__scr_fml_FMOD_STUDIO_USER_PROPERTY.gml",
                "scripts\\__scr_fml_FMOD_VECTOR\\__scr_fml_FMOD_VECTOR.gml",
            ]
        ), (
            "Miscellaneous enums",
            "Enums.md",
            vec![
                "scripts\\__scr_fml_fmod_constants\\__scr_fml_fmod_constants.gml",
            ],
        ), (
            "Other",
            "Other.md",
            vec![
                "scripts\\__scr_fml_misc\\__scr_fml_misc.gml",
            ]
        )
    ]
}
