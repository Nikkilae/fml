
function FML_DRIVER_INFO() constructor
{
    name = "";                                  /// @is {string}
    guid = new FMOD_GUID();                     /// @is {FMOD_GUID}
    system_rate = 0;                            /// @is {int}
    speaker_mode = FMOD_SPEAKERMODE.DEFAULT;    /// @is {FMOD_SPEAKERMODE}
    speaker_mode_channels = 0;                  /// @is {int}
}

/// @param {FML_DRIVER_INFO} driver_info
/// @param {buffer} buf
function __FML_DRIVER_INFO_deserialize(driver_info, buf)
{
    driver_info.name                    = buffer_read(buf, buffer_string);
    __FMOD_GUID_deserialize(driver_info.guid, buf);
    driver_info.system_rate             = buffer_read(buf, buffer_s32);
    driver_info.speaker_mode            = buffer_read(buf, buffer_s32);
    driver_info.speaker_mode_channels   = buffer_read(buf, buffer_s32);
}

