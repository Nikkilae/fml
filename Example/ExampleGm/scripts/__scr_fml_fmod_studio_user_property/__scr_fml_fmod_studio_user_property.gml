
/// https://www.fmod.com/resources/documentation-api?version=2.02&page=studio-api-eventdescription.html#fmod_studio_user_property
function FMOD_STUDIO_USER_PROPERTY() constructor
{
    name = "";                                      /// @is {string}
    type = FMOD_STUDIO_USER_PROPERTY_TYPE.INTEGER;  /// @is {FMOD_STUDIO_USER_PROPERTY_TYPE}
    value = 0;                                      /// @is {int|bool|number|string}
}

/// @param {FMOD_STUDIO_USER_PROPERTY} property
/// @param {buffer} buf
function FMOD_STUDIO_USER_PROPERTY_serialize(property, buf)
{
    buffer_write(buf, buffer_string, property.name);
    buffer_write(buf, buffer_s32, property.type);
    switch (property.type) {
        case FMOD_STUDIO_USER_PROPERTY_TYPE.INTEGER: buffer_write(buf, buffer_s32, property.value); break;
        case FMOD_STUDIO_USER_PROPERTY_TYPE.BOOLEAN: buffer_write(buf, buffer_bool, property.value); break;
        case FMOD_STUDIO_USER_PROPERTY_TYPE.FLOAT:   buffer_write(buf, buffer_f32, property.value); break;
        case FMOD_STUDIO_USER_PROPERTY_TYPE.STRING:  buffer_write(buf, buffer_string, property.value); break;
    }
}

/// @param {FMOD_STUDIO_USER_PROPERTY} property
/// @param {buffer} buf
function FMOD_STUDIO_USER_PROPERTY_deserialize(property, buf)
{
    property.name = buffer_read(buf, buffer_string);
    property.type = int64(buffer_read(buf, buffer_s32));
    switch (property.type) {
        case FMOD_STUDIO_USER_PROPERTY_TYPE.INTEGER: property.value = int64(buffer_read(buf, buffer_s32)); break;
        case FMOD_STUDIO_USER_PROPERTY_TYPE.BOOLEAN: property.value = bool(buffer_read(buf, buffer_s32)); break;
        case FMOD_STUDIO_USER_PROPERTY_TYPE.FLOAT:   property.value = buffer_read(buf, buffer_f32); break;
        case FMOD_STUDIO_USER_PROPERTY_TYPE.STRING:  property.value = buffer_read(buf, buffer_string); break;
    }
}
