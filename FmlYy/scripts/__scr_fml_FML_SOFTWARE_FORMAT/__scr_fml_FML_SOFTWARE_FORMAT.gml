
function FML_SOFTWARE_FORMAT() constructor
{
    sample_rate = 0;                            /// @is {int}
    speaker_mode = FMOD_SPEAKERMODE.DEFAULT;    /// @is {FMOD_SPEAKERMODE}
    num_raw_speakers = 0;                       /// @is {int}
}

/// @param {FML_SOFTWARE_FORMAT} software_format
/// @param {buffer} buf
function __FML_SOFTWARE_FORMAT_deserialize(software_format, buf)
{
    software_format.sample_rate         = real(buffer_read(buf, buffer_s32));
    software_format.speaker_mode        = buffer_read(buf, buffer_s32);
    software_format.num_raw_speakers    = real(buffer_read(buf, buffer_s32));
}
