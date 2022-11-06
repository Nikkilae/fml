
/// https://www.fmod.com/docs/2.02/api/studio-api-system.html#fmod_studio_buffer_info
function FMOD_STUDIO_BUFFER_INFO() constructor
{
    currentusage = 0;   /// @is {number}
    peakusage = 0;      /// @is {number}
    capacity = 0;       /// @is {number}
    stallcount = 0;     /// @is {number}
    stalltime = 0;      /// @is {number}
}

/// @param {FMOD_STUDIO_BUFFER_INFO} info
/// @param {buffer} buf
function FMOD_STUDIO_BUFFER_INFO_serialize(info, buf)
{
    buffer_write(buf, buffer_s32, info.currentusage);
    buffer_write(buf, buffer_s32, info.peakusage);
    buffer_write(buf, buffer_s32, info.capacity);
    buffer_write(buf, buffer_s32, info.stallcount);
    buffer_write(buf, buffer_f32, info.stalltime);
}

/// @param {FMOD_STUDIO_BUFFER_INFO} info
/// @param {buffer} buf
function FMOD_STUDIO_BUFFER_INFO_deserialize(info, buf)
{
    info.currentusage   = real(buffer_read(buf, buffer_s32));
    info.peakusage      = real(buffer_read(buf, buffer_s32));
    info.capacity       = real(buffer_read(buf, buffer_s32));
    info.stallcount     = real(buffer_read(buf, buffer_s32));
    info.stalltime      = real(buffer_read(buf, buffer_f32));
}
