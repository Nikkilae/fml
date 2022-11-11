
/// https://www.fmod.com/docs/2.02/api/studio-api-system.html#fmod_studio_buffer_usage
function FMOD_STUDIO_BUFFER_USAGE() constructor
{
    studiocommandqueue = new FMOD_STUDIO_BUFFER_INFO(); /// @is {FMOD_STUDIO_BUFFER_INFO}
    studiohandle = new FMOD_STUDIO_BUFFER_INFO();       /// @is {FMOD_STUDIO_BUFFER_INFO}
}

/// @param {FMOD_STUDIO_BUFFER_USAGE} usage
/// @param {buffer} buf
function __FMOD_STUDIO_BUFFER_USAGE_serialize(usage, buf)
{
    __FMOD_STUDIO_BUFFER_INFO_serialize(usage.studiocommandqueue, buf);
    __FMOD_STUDIO_BUFFER_INFO_serialize(usage.studiohandle, buf);
}

/// @param {FMOD_STUDIO_BUFFER_USAGE} usage
/// @param {buffer} buf
function __FMOD_STUDIO_BUFFER_USAGE_deserialize(usage, buf)
{
    __FMOD_STUDIO_BUFFER_INFO_deserialize(usage.studiocommandqueue, buf);
    __FMOD_STUDIO_BUFFER_INFO_deserialize(usage.studiohandle, buf);
}
