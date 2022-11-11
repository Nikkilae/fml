
/// https://www.fmod.com/docs/2.02/api/core-api-common.html#fmod_3d_attributes
function FMOD_3D_ATTRIBUTES() constructor
{
    position = new FMOD_VECTOR();   /// @is {FMOD_VECTOR}
    velocity = new FMOD_VECTOR();   /// @is {FMOD_VECTOR}
    forward = new FMOD_VECTOR();    /// @is {FMOD_VECTOR}
    up = new FMOD_VECTOR();         /// @is {FMOD_VECTOR}
}

/// @param {FMOD_3D_ATTRIBUTES} attributes
/// @param {buffer} buf
function __FMOD_3D_ATTRIBUTES_serialize(attributes, buf)
{
    __FMOD_VECTOR_serialize(attributes.position, buf);
    __FMOD_VECTOR_serialize(attributes.velocity, buf);
    __FMOD_VECTOR_serialize(attributes.forward, buf);
    __FMOD_VECTOR_serialize(attributes.up, buf);
}

/// @param {FMOD_3D_ATTRIBUTES} attributes
/// @param {buffer} buf
function __FMOD_3D_ATTRIBUTES_deserialize(attributes, buf)
{
    __FMOD_VECTOR_deserialize(attributes.position, buf);
    __FMOD_VECTOR_deserialize(attributes.velocity, buf);
    __FMOD_VECTOR_deserialize(attributes.forward, buf);
    __FMOD_VECTOR_deserialize(attributes.up, buf);
}

/// @param {FMOD_3D_ATTRIBUTES} attributes
/// @returns {pointer}
function __FMOD_3D_ATTRIBUTES_as_buf_ptr(attributes)
{
    var buf = __fml_buffers_3d_attributes;
    buffer_seek(buf, buffer_seek_start, 0);
    __FMOD_3D_ATTRIBUTES_serialize(attributes, buf);
    return buffer_get_address(buf);
}