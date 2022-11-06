
/// https://www.fmod.com/resources/documentation-api?version=2.02&page=studio-api-eventinstance.html#fmod_studio_timeline_beat_properties
function FMOD_STUDIO_TIMELINE_BEAT_PROPERTIES() constructor
{
    bar = 0;                /// @is {int}
    beat = 0;               /// @is {int}
    position = 0;           /// @is {int}
    tempo = 0;              /// @is {number}
    timesignatureupper = 0; /// @is {int}
    timesignaturelower = 0; /// @is {int}
}

/// @param {FMOD_STUDIO_TIMELINE_BEAT_PROPERTIES} properties
/// @param {buffer} buf
function FMOD_STUDIO_TIMELINE_BEAT_PROPERTIES_deserialize(properties, buf)
{
    properties.bar                  = real(buffer_read(buf, buffer_s32));
    properties.beat                 = real(buffer_read(buf, buffer_s32));
    properties.position             = real(buffer_read(buf, buffer_s32));
    properties.tempo                = real(buffer_read(buf, buffer_f32));
    properties.timesignatureupper   = real(buffer_read(buf, buffer_s32));
    properties.timesignaturelower   = real(buffer_read(buf, buffer_s32));
}
