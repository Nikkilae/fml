
/// https://www.fmod.com/docs/2.02/api/studio-api-common.html#fmod_studio_parameter_description
function FMOD_STUDIO_PARAMETER_DESCRIPTION() constructor
{
    name = "";                                  /// @is {string}
    id = new FMOD_STUDIO_PARAMETER_ID();        /// @is {FMOD_STUDIO_PARAMETER_ID}
    minimum = 0;                                /// @is {number}
    maximum = 0;                                /// @is {number}
    defaultvalue = 0;                           /// @is {number}
    type = 0;                                   /// @is {FMOD_STUDIO_PARAMETER_TYPE}
    flags = 0;                                  /// @is {number}
    guid = new FMOD_GUID();                     /// @is {FMOD_GUID}
}

/// @param {FMOD_STUDIO_PARAMETER_DESCRIPTION} description
/// @param {buffer} buf
function __FMOD_STUDIO_PARAMETER_DESCRIPTION_serialize(description, buf)
{
    buffer_write(buf, buffer_string, description.name);
    __FMOD_STUDIO_PARAMETER_ID_serialize(description.id, buf);
    buffer_write(buf, buffer_f32, description.minimum);
    buffer_write(buf, buffer_f32, description.maximum);
    buffer_write(buf, buffer_f32, description.defaultvalue);
    buffer_write(buf, buffer_s32, description.type);
    buffer_write(buf, buffer_s32, description.flags);
    __FMOD_GUID_serialize(description.guid, buf);
}

/// @param {FMOD_STUDIO_PARAMETER_DESCRIPTION} description
/// @param {buffer} buf
function __FMOD_STUDIO_PARAMETER_DESCRIPTION_deserialize(description, buf)
{
    description.name            = buffer_read(buf, buffer_string);
    __FMOD_STUDIO_PARAMETER_ID_deserialize(description.id, buf);
    description.minimum         = buffer_read(buf, buffer_f32);
    description.maximum         = buffer_read(buf, buffer_f32);
    description.defaultvalue    = buffer_read(buf, buffer_f32);
    description.type            = int64(buffer_read(buf, buffer_s32));
    description.flags           = int64(buffer_read(buf, buffer_s32));
    __FMOD_GUID_deserialize(description.guid, buf);
}
