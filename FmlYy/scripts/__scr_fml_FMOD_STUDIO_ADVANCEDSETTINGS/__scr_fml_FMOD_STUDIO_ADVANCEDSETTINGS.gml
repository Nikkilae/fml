
/// https://www.fmod.com/docs/2.02/api/studio-api-system.html#fmod_studio_advancedsettings
function FMOD_STUDIO_ADVANCEDSETTINGS() constructor
{
    commandqueuesize = 0;       /// @is {number}
    handleinitialsize = 0;      /// @is {number}
    studioupdateperiod = 0;     /// @is {number}
    idlesampledatapoolsize = 0; /// @is {number}
    streamingscheduledelay = 0; /// @is {number}
    encryptionkey = "";         /// @is {string}
}

/// @param {FMOD_STUDIO_ADVANCEDSETTINGS} settings
/// @param {buffer} buf
function FMOD_STUDIO_ADVANCEDSETTINGS_serialize(settings, buf)
{
    buffer_write(buf, buffer_u32,       settings.commandqueuesize);
    buffer_write(buf, buffer_u32,       settings.handleinitialsize);
    buffer_write(buf, buffer_s32,       settings.studioupdateperiod);
    buffer_write(buf, buffer_s32,       settings.idlesampledatapoolsize);
    buffer_write(buf, buffer_u32,       settings.streamingscheduledelay);
    buffer_write(buf, buffer_string,    settings.encryptionkey);
}

/// @param {FMOD_STUDIO_ADVANCEDSETTINGS} settings
/// @param {buffer} buf
function FMOD_STUDIO_ADVANCEDSETTINGS_deserialize(settings, buf)
{
    settings.commandqueuesize        = real(buffer_read(buf, buffer_u32));
    settings.handleinitialsize       = real(buffer_read(buf, buffer_u32));
    settings.studioupdateperiod      = real(buffer_read(buf, buffer_s32));
    settings.idlesampledatapoolsize  = real(buffer_read(buf, buffer_s32));
    settings.streamingscheduledelay  = real(buffer_read(buf, buffer_u32));
    settings.encryptionkey           = buffer_read(buf, buffer_string);
}

/// @param {FMOD_STUDIO_ADVANCEDSETTINGS} settings
/// @returns {pointer}
function FMOD_STUDIO_ADVANCEDSETTINGS_as_buf_ptr(settings)
{
    static buf = buffer_create(0, buffer_grow, 1);
    buffer_seek(buf, buffer_seek_start, 0);
    FMOD_STUDIO_ADVANCEDSETTINGS_serialize(settings, buf);
    return buffer_get_address(buf);
}
