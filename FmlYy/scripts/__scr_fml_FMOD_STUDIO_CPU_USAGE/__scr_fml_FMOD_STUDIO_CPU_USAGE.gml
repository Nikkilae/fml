
/// https://www.fmod.com/docs/2.02/api/studio-api-system.html#fmod_studio_cpu_usage
function FMOD_STUDIO_CPU_USAGE() constructor
{
    update = 0; /// @is {number}
}

/// @param {FMOD_STUDIO_CPU_USAGE} usage
/// @param {buffer} buf
function __FMOD_STUDIO_CPU_USAGE_deserialize(usage, buf)
{
    usage.update = buffer_read(buf, buffer_f32);
}
