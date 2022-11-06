
/// https://www.fmod.com/resources/documentation-api?version=2.02&page=studio-api-common.html#fmod_studio_memory_usage
function FMOD_STUDIO_MEMORY_USAGE() constructor
{
    exclusive = 0;  /// @is {number}
    inclusive = 0;  /// @is {number}
    sampledata = 0; /// @is {number}
}

/// @param {FMOD_STUDIO_MEMORY_USAGE} usage
/// @param {buffer} buf
function FMOD_STUDIO_MEMORY_USAGE_serialize(usage, buf)
{
    buffer_write(buf, buffer_s32, usage.exclusive);
    buffer_write(buf, buffer_s32, usage.inclusive);
    buffer_write(buf, buffer_s32, usage.sampledata);
}

/// @param {FMOD_STUDIO_MEMORY_USAGE} usage
/// @param {buffer} buf
function FMOD_STUDIO_MEMORY_USAGE_deserialize(usage, buf)
{
    usage.exclusive  = real(buffer_read(buf, buffer_s32));
    usage.inclusive  = real(buffer_read(buf, buffer_s32));
    usage.sampledata = real(buffer_read(buf, buffer_s32));
}
