
use serde::{Serialize};

#[derive(Serialize, Debug)]
pub struct Page {
    pub title: &'static str,
    pub doc_filename: &'static str,
    pub source_filename: &'static str,
}

impl Page {
    fn new(title: &'static str, doc_filename: &'static str, source_filename: &'static str) -> Self {
        Self { title, doc_filename, source_filename }
    }
}

pub fn make_pages() -> Vec<Page> {
    vec![
        Page::new(
            "FmodBank",
            "FmodBank.md",
            "scripts\\__scr_fml_FmodBank\\__scr_fml_FmodBank.gml"
        ),
        Page::new(
            "FmodBus",
            "FmodBus.md",
            "scripts\\__scr_fml_FmodBus\\__scr_fml_FmodBus.gml"
        ),
        Page::new(
            "FmodEventDescription",
            "FmodEventDescription.md",
            "scripts\\__scr_fml_FmodEventDescription\\__scr_fml_FmodEventDescription.gml"
        ),
        Page::new(
            "FmodEventInstance",
            "FmodEventInstance.md",
            "scripts\\__scr_fml_FmodEventInstance\\__scr_fml_FmodEventInstance.gml"
        ),
        Page::new(
            "FmodStudioSystem",
            "FmodStudioSystem.md",
            "scripts\\__scr_fml_FmodStudioSystem\\__scr_fml_FmodStudioSystem.gml"
        ),
        Page::new(
            "FmodSystem",
            "FmodSystem.md",
            "scripts\\__scr_fml_FmodSystem\\__scr_fml_FmodSystem.gml"
        ),
        Page::new(
            "FmodVca",
            "FmodVca.md",
            "scripts\\__scr_fml_FmodVca\\__scr_fml_FmodVca.gml"
        ),
        Page::new(
            "FmlError",
            "FmlError.md",
            "scripts\\__scr_fml_FmlError\\__scr_fml_FmlError.gml"
        ),
        Page::new(
            "FMOD_3D_ATTRIBUTES",
            "FMOD_3D_ATTRIBUTES.md",
            "scripts\\__scr_fml_FMOD_3D_ATTRIBUTES\\__scr_fml_FMOD_3D_ATTRIBUTES.gml"
        ),
        Page::new(
            "FMOD_CPU_USAGE",
            "FMOD_CPU_USAGE.md",
            "scripts\\__scr_fml_FMOD_CPU_USAGE\\__scr_fml_FMOD_CPU_USAGE.gml"
        ),
        Page::new(
            "FMOD_GUID",
            "FMOD_GUID.md",
            "scripts\\__scr_fml_FMOD_GUID\\__scr_fml_FMOD_GUID.gml"
        ),
        Page::new(
            "FMOD_STUDIO_ADVANCEDSETTINGS",
            "FMOD_STUDIO_ADVANCEDSETTINGS.md",
            "scripts\\__scr_fml_FMOD_STUDIO_ADVANCEDSETTINGS\\__scr_fml_FMOD_STUDIO_ADVANCEDSETTINGS.gml"
        ),
        Page::new(
            "FMOD_STUDIO_BUFFER_INFO",
            "FMOD_STUDIO_BUFFER_INFO.md",
            "scripts\\__scr_fml_FMOD_STUDIO_BUFFER_INFO\\__scr_fml_FMOD_STUDIO_BUFFER_INFO.gml"
        ),
        Page::new(
            "FMOD_STUDIO_BUFFER_USAGE",
            "FMOD_STUDIO_BUFFER_USAGE.md",
            "scripts\\__scr_fml_FMOD_STUDIO_BUFFER_USAGE\\__scr_fml_FMOD_STUDIO_BUFFER_USAGE.gml"
        ),
        Page::new(
            "FMOD_STUDIO_CPU_USAGE",
            "FMOD_STUDIO_CPU_USAGE.md",
            "scripts\\__scr_fml_FMOD_STUDIO_CPU_USAGE\\__scr_fml_FMOD_STUDIO_CPU_USAGE.gml"
        ),
        Page::new(
            "FMOD_STUDIO_MEMORY_USAGE",
            "FMOD_STUDIO_MEMORY_USAGE.md",
            "scripts\\__scr_fml_FMOD_STUDIO_MEMORY_USAGE\\__scr_fml_FMOD_STUDIO_MEMORY_USAGE.gml"
        ),
        Page::new(
            "FMOD_STUDIO_PARAMETER_DESCRIPTION",
            "FMOD_STUDIO_PARAMETER_DESCRIPTION.md",
            "scripts\\__scr_fml_FMOD_STUDIO_PARAMETER_DESCRIPTION\\__scr_fml_FMOD_STUDIO_PARAMETER_DESCRIPTION.gml"
        ),
        Page::new(
            "FMOD_STUDIO_PARAMETER_ID",
            "FMOD_STUDIO_PARAMETER_ID.md",
            "scripts\\__scr_fml_FMOD_STUDIO_PARAMETER_ID\\__scr_fml_FMOD_STUDIO_PARAMETER_ID.gml"
        ),
        Page::new(
            "FMOD_STUDIO_USER_PROPERTY",
            "FMOD_STUDIO_USER_PROPERTY.md",
            "scripts\\__scr_fml_FMOD_STUDIO_USER_PROPERTY\\__scr_fml_FMOD_STUDIO_USER_PROPERTY.gml"
        ),
        Page::new(
            "FMOD_VECTOR",
            "FMOD_VECTOR.md",
            "scripts\\__scr_fml_FMOD_VECTOR\\__scr_fml_FMOD_VECTOR.gml"
        ),
    ]
}
