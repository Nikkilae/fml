
/// https://www.fmod.com/docs/2.02/api/core-api-common.html#fmod_vector
/// @param {number} x = 0
/// @param {number} y = 0
/// @param {number} z = 0
function FMOD_VECTOR(_x = 0, _y = 0, _z = 0) constructor
{
    x = _x; /// @is {number}
    y = _y; /// @is {number}
    z = _z; /// @is {number}
}

/// @param {FMOD_VECTOR} vector
/// @param {buffer} buf
function __FMOD_VECTOR_serialize(vector, buf)
{
    buffer_write(buf, buffer_f32, vector.x);
    buffer_write(buf, buffer_f32, vector.y);
    buffer_write(buf, buffer_f32, vector.z);
}

/// @param {FMOD_VECTOR} vector
/// @param {buffer} buf
function __FMOD_VECTOR_deserialize(vector, buf)
{
    vector.x = buffer_read(buf, buffer_f32);
    vector.y = buffer_read(buf, buffer_f32);
    vector.z = buffer_read(buf, buffer_f32);
}

/// @param {FMOD_VECTOR?} vector
/// @returns {pointer}
function __FMOD_VECTOR_as_buf_ptr(vector)
{
    if (vector == undefined) {
        return pointer_null;
    }
    var buf = __fml_buffers_vector;
    buffer_seek(buf, buffer_seek_start, 0);
    __FMOD_VECTOR_serialize(vector, buf);
    return buffer_get_address(buf);
}
