
function FML_3D_SETTINGS() constructor
{
    doppler_scale = 0;      /// @is {number}
    distance_factor = 0;    /// @is {number}
    rolloff_scale = 0;      /// @is {number}
}

/// @param {FML_3D_SETTINGS} settings
/// @param {buffer} buf
function __FML_3D_SETTINGS_deserialize(settings, buf)
{
    settings.doppler_scale      = buffer_read(buf, buffer_f32);
    settings.distance_factor    = buffer_read(buf, buffer_f32);
    settings.rolloff_scale      = buffer_read(buf, buffer_f32);
}
