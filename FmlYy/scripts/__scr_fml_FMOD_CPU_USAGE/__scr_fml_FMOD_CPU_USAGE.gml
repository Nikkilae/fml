
/// https://www.fmod.com/docs/2.02/api/core-api-common.html#fmod_cpu_usage
function FMOD_CPU_USAGE() constructor
{
    dsp = 0;            /// @is {number}
    stream = 0;         /// @is {number}
    geometry = 0;       /// @is {number}
    update = 0;         /// @is {number}
    convolution1 = 0;   /// @is {number}
    convolution2 = 0;   /// @is {number}
}

/// @param {FMOD_CPU_USAGE} usage
/// @param {buffer} buf
function __FMOD_CPU_USAGE_serialize(usage, buf)
{
    buffer_write(buf, buffer_f32, usage.dsp);
    buffer_write(buf, buffer_f32, usage.stream);
    buffer_write(buf, buffer_f32, usage.geometry);
    buffer_write(buf, buffer_f32, usage.update);
    buffer_write(buf, buffer_f32, usage.convolution1);
    buffer_write(buf, buffer_f32, usage.convolution2);
}

/// @param {FMOD_CPU_USAGE} usage
/// @param {buffer} buf
function __FMOD_CPU_USAGE_deserialize(usage, buf)
{
    usage.dsp           = buffer_read(buf, buffer_f32);
    usage.stream        = buffer_read(buf, buffer_f32);
    usage.geometry      = buffer_read(buf, buffer_f32);
    usage.update        = buffer_read(buf, buffer_f32);
    usage.convolution1  = buffer_read(buf, buffer_f32);
    usage.convolution2  = buffer_read(buf, buffer_f32);
}
