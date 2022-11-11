
/// https://www.fmod.com/docs/2.02/api/studio-api-common.html#fmod_studio_parameter_id
function FMOD_STUDIO_PARAMETER_ID() constructor
{
    data1 = 0;  /// @is {int}
    data2 = 0;  /// @is {int}
}

/// @param {FMOD_STUDIO_PARAMETER_ID} parameter_id
/// @param {buffer} buf
function __FMOD_STUDIO_PARAMETER_ID_serialize(parameter_id, buf)
{
    buffer_write(buf, buffer_u32, parameter_id.data1);
    buffer_write(buf, buffer_u32, parameter_id.data2);
}

/// @param {FMOD_STUDIO_PARAMETER_ID} parameter_id
/// @param {buffer} buf
function __FMOD_STUDIO_PARAMETER_ID_deserialize(parameter_id, buf)
{
    parameter_id.data1 = buffer_read(buf, buffer_u32);
    parameter_id.data2 = buffer_read(buf, buffer_u32);
}

/// @param {FMOD_STUDIO_PARAMETER_ID} parameter_id
/// @returns {pointer}
function __FMOD_STUDIO_PARAMETER_ID_as_buf_ptr(parameter_id)
{
    var buf = __fml_buffers_parameter_id;
    buffer_seek(buf, buffer_seek_start, 0);
    __FMOD_STUDIO_PARAMETER_ID_serialize(parameter_id, buf);
    return buffer_get_address(buf);
}
