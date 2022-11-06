
/// https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#fmod_studio_timeline_marker_properties
function FMOD_STUDIO_TIMELINE_MARKER_PROPERTIES() constructor
{
    name = "";      /// @is {string}
    position = 0;   /// @is {number}
}

/// @param {FMOD_STUDIO_TIMELINE_MARKER_PROPERTIES} properties
/// @param {buffer} buf
function FMOD_STUDIO_TIMELINE_MARKER_PROPERTIES_deserialize(properties, buf)
{
    properties.name     = buffer_read(buf, buffer_string);
    properties.position = real(buffer_read(buf, buffer_s32));
}
