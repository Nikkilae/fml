
use crate::parser;

#[derive(serde::Serialize, Debug)]
pub struct Page {
    pub title: &'static str,
    pub doc_filename_stem: &'static str,
    pub doc_filename: std::path::PathBuf,
    pub parse_result: parser::ParseResult,
}

pub fn parse_pages(yy_directory: &str, docs_directory: &str) -> Vec<Page> {

    get_page_definitions().iter().map(|(title, doc_filename_stem, source_filename)| {
        let full_source_filename = std::path::Path::new(yy_directory).join(source_filename);
        let doc_filename = std::path::Path::new(docs_directory).join("ref").join(doc_filename_stem);
        Page {
            title,
            doc_filename_stem,
            doc_filename,
            parse_result: parser::parse_from_file(&full_source_filename.display().to_string()).unwrap(),
        }
    }).collect()

}

fn get_page_definitions<'a>() -> Vec<(&'a str, &'a str, &'a str)> {
    vec![(
            "FmodBank",
            "FmodBank.md",
            "scripts\\__scr_fml_FmodBank\\__scr_fml_FmodBank.gml"
        ), (
            "FmodBus",
            "FmodBus.md",
            "scripts\\__scr_fml_FmodBus\\__scr_fml_FmodBus.gml"
        ), (
            "FmodEventDescription",
            "FmodEventDescription.md",
            "scripts\\__scr_fml_FmodEventDescription\\__scr_fml_FmodEventDescription.gml"
        ), (
            "FmodEventInstance",
            "FmodEventInstance.md",
            "scripts\\__scr_fml_FmodEventInstance\\__scr_fml_FmodEventInstance.gml"
        ), (
            "FmodStudioSystem",
            "FmodStudioSystem.md",
            "scripts\\__scr_fml_FmodStudioSystem\\__scr_fml_FmodStudioSystem.gml"
        ), (
            "FmodSystem",
            "FmodSystem.md",
            "scripts\\__scr_fml_FmodSystem\\__scr_fml_FmodSystem.gml"
        ), (
            "FmodVca",
            "FmodVca.md",
            "scripts\\__scr_fml_FmodVca\\__scr_fml_FmodVca.gml"
        ), (
            "FmlError",
            "FmlError.md",
            "scripts\\__scr_fml_FmlError\\__scr_fml_FmlError.gml"
        ), (
            "FMOD_3D_ATTRIBUTES",
            "FMOD_3D_ATTRIBUTES.md",
            "scripts\\__scr_fml_FMOD_3D_ATTRIBUTES\\__scr_fml_FMOD_3D_ATTRIBUTES.gml"
        ), (
            "FMOD_CPU_USAGE",
            "FMOD_CPU_USAGE.md",
            "scripts\\__scr_fml_FMOD_CPU_USAGE\\__scr_fml_FMOD_CPU_USAGE.gml"
        ), (
            "FMOD_GUID",
            "FMOD_GUID.md",
            "scripts\\__scr_fml_FMOD_GUID\\__scr_fml_FMOD_GUID.gml"
        ), (
            "FMOD_STUDIO_ADVANCEDSETTINGS",
            "FMOD_STUDIO_ADVANCEDSETTINGS.md",
            "scripts\\__scr_fml_FMOD_STUDIO_ADVANCEDSETTINGS\\__scr_fml_FMOD_STUDIO_ADVANCEDSETTINGS.gml"
        ), (
            "FMOD_STUDIO_BUFFER_INFO",
            "FMOD_STUDIO_BUFFER_INFO.md",
            "scripts\\__scr_fml_FMOD_STUDIO_BUFFER_INFO\\__scr_fml_FMOD_STUDIO_BUFFER_INFO.gml"
        ), (
            "FMOD_STUDIO_BUFFER_USAGE",
            "FMOD_STUDIO_BUFFER_USAGE.md",
            "scripts\\__scr_fml_FMOD_STUDIO_BUFFER_USAGE\\__scr_fml_FMOD_STUDIO_BUFFER_USAGE.gml"
        ), (
            "FMOD_STUDIO_CPU_USAGE",
            "FMOD_STUDIO_CPU_USAGE.md",
            "scripts\\__scr_fml_FMOD_STUDIO_CPU_USAGE\\__scr_fml_FMOD_STUDIO_CPU_USAGE.gml"
        ), (
            "FMOD_STUDIO_MEMORY_USAGE",
            "FMOD_STUDIO_MEMORY_USAGE.md",
            "scripts\\__scr_fml_FMOD_STUDIO_MEMORY_USAGE\\__scr_fml_FMOD_STUDIO_MEMORY_USAGE.gml"
        ), (
            "FMOD_STUDIO_PARAMETER_DESCRIPTION",
            "FMOD_STUDIO_PARAMETER_DESCRIPTION.md",
            "scripts\\__scr_fml_FMOD_STUDIO_PARAMETER_DESCRIPTION\\__scr_fml_FMOD_STUDIO_PARAMETER_DESCRIPTION.gml"
        ), (
            "FMOD_STUDIO_PARAMETER_ID",
            "FMOD_STUDIO_PARAMETER_ID.md",
            "scripts\\__scr_fml_FMOD_STUDIO_PARAMETER_ID\\__scr_fml_FMOD_STUDIO_PARAMETER_ID.gml"
        ), (
            "FMOD_STUDIO_USER_PROPERTY",
            "FMOD_STUDIO_USER_PROPERTY.md",
            "scripts\\__scr_fml_FMOD_STUDIO_USER_PROPERTY\\__scr_fml_FMOD_STUDIO_USER_PROPERTY.gml"
        ), (
            "FMOD_VECTOR",
            "FMOD_VECTOR.md",
            "scripts\\__scr_fml_FMOD_VECTOR\\__scr_fml_FMOD_VECTOR.gml"
        ),
    ]
}
