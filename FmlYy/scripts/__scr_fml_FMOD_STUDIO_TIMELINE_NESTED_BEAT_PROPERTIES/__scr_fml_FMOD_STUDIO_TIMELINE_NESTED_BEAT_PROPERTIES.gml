
/// https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#fmod_studio_timeline_nested_beat_properties
function FMOD_STUDIO_TIMELINE_NESTED_BEAT_PROPERTIES() constructor
{
    event_id = new FMOD_GUID();                                 /// @is {FMOD_GUID}
    properties = new FMOD_STUDIO_TIMELINE_BEAT_PROPERTIES();    /// @is {FMOD_STUDIO_TIMELINE_BEAT_PROPERTIES}
}

/// @param {FMOD_STUDIO_TIMELINE_NESTED_BEAT_PROPERTIES} properties
/// @param {buffer} buf
function FMOD_STUDIO_TIMELINE_NESTED_BEAT_PROPERTIES_deserialize(properties, buf)
{
    __FMOD_GUID_deserialize(properties.event_id, buf);
    FMOD_STUDIO_TIMELINE_BEAT_PROPERTIES_deserialize(properties.properties, buf);
}
