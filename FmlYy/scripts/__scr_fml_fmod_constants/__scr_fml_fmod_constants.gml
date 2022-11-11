
// The version of the FMOD library.
// This should match the definition of the same name in the FMOD API library that's included in this extension.
#macro FMOD_VERSION 0x00020210

/// https://www.fmod.com/docs/2.02/api/core-api-common.html#fmod_result
/// A composite of FMOD's error code enum FMOD_RESULT and FML's custom error codes (the negative values).
enum FML_RESULT
{
    /// Custom FML error codes:
    
    BUFFER_TOO_SMALL = -2,
    OBJECT_DOESNT_EXIST = -1,
    
    
    
    /// FMOD_RESULT values:
    
    OK = 0,
    
    BADCOMMAND,
    CHANNEL_ALLOC,
    CHANNEL_STOLEN,
    DMA,
    DSP_CONNECTION,
    DSP_DONTPROCESS,
    DSP_FORMAT,
    DSP_INUSE,
    DSP_NOTFOUND,
    DSP_RESERVED,
    DSP_SILENCE,
    DSP_TYPE,
    FILE_BAD,
    FILE_COULDNOTSEEK,
    FILE_DISKEJECTED,
    FILE_EOF,
    FILE_ENDOFDATA,
    FILE_NOTFOUND,
    FORMAT,
    HEADER_MISMATCH,
    HTTP,
    HTTP_ACCESS,
    HTTP_PROXY_AUTH,
    HTTP_SERVER_ERROR,
    HTTP_TIMEOUT,
    INITIALIZATION,
    INITIALIZED,
    INTERNAL,
    INVALID_FLOAT,
    INVALID_HANDLE,
    INVALID_PARAM,
    INVALID_POSITION,
    INVALID_SPEAKER,
    INVALID_SYNCPOINT,
    INVALID_THREAD,
    INVALID_VECTOR,
    MAXAUDIBLE,
    MEMORY,
    MEMORY_CANTPOINT,
    NEEDS3D,
    NEEDSHARDWARE,
    NET_CONNECT,
    NET_SOCKET_ERROR,
    NET_URL,
    NET_WOULD_BLOCK,
    NOTREADY,
    OUTPUT_ALLOCATED,
    OUTPUT_CREATEBUFFER,
    OUTPUT_DRIVERCALL,
    OUTPUT_FORMAT,
    OUTPUT_INIT,
    OUTPUT_NODRIVERS,
    PLUGIN,
    PLUGIN_MISSING,
    PLUGIN_RESOURCE,
    PLUGIN_VERSION,
    RECORD,
    REVERB_CHANNELGROUP,
    REVERB_INSTANCE,
    SUBSOUNDS,
    SUBSOUND_ALLOCATED,
    SUBSOUND_CANTMOVE,
    TAGNOTFOUND,
    TOOMANYCHANNELS,
    TRUNCATED,
    UNIMPLEMENTED,
    UNINITIALIZED,
    UNSUPPORTED,
    VERSION,
    EVENT_ALREADY_LOADED,
    EVENT_LIVEUPDATE_BUSY,
    EVENT_LIVEUPDATE_MISMATCH,
    EVENT_LIVEUPDATE_TIMEOUT,
    EVENT_NOTFOUND,
    STUDIO_UNINITIALIZED,
    STUDIO_NOT_LOADED,
    INVALID_STRING,
    ALREADY_LOCKED,
    NOT_LOCKED,
    RECORD_DISCONNECTED,
    TOOMANYSAMPLES,
}

#macro FMOD_STUDIO_INIT_NORMAL                             0x00000000
#macro FMOD_STUDIO_INIT_LIVEUPDATE                         0x00000001
#macro FMOD_STUDIO_INIT_ALLOW_MISSING_PLUGINS              0x00000002
#macro FMOD_STUDIO_INIT_SYNCHRONOUS_UPDATE                 0x00000004
#macro FMOD_STUDIO_INIT_DEFERRED_CALLBACKS                 0x00000008
#macro FMOD_STUDIO_INIT_LOAD_FROM_UPDATE                   0x00000010
#macro FMOD_STUDIO_INIT_MEMORY_TRACKING                    0x00000020

#macro FMOD_INIT_NORMAL                            0x00000000
#macro FMOD_INIT_STREAM_FROM_UPDATE                0x00000001
#macro FMOD_INIT_MIX_FROM_UPDATE                   0x00000002
#macro FMOD_INIT_3D_RIGHTHANDED                    0x00000004
#macro FMOD_INIT_CLIP_OUTPUT                       0x00000008
#macro FMOD_INIT_CHANNEL_LOWPASS                   0x00000100
#macro FMOD_INIT_CHANNEL_DISTANCEFILTER            0x00000200
#macro FMOD_INIT_PROFILE_ENABLE                    0x00010000
#macro FMOD_INIT_VOL0_BECOMES_VIRTUAL              0x00020000
#macro FMOD_INIT_GEOMETRY_USECLOSEST               0x00040000
#macro FMOD_INIT_PREFER_DOLBY_DOWNMIX              0x00080000
#macro FMOD_INIT_THREAD_UNSAFE                     0x00100000
#macro FMOD_INIT_PROFILE_METER_ALL                 0x00200000
#macro FMOD_INIT_MEMORY_TRACKING                   0x00400000

#macro FMOD_STUDIO_LOAD_BANK_NORMAL                        0x00000000
#macro FMOD_STUDIO_LOAD_BANK_NONBLOCKING                   0x00000001
#macro FMOD_STUDIO_LOAD_BANK_DECOMPRESS_SAMPLES            0x00000002
#macro FMOD_STUDIO_LOAD_BANK_UNENCRYPTED                   0x00000004

#macro FMOD_DEBUG_LEVEL_NONE                       0x00000000
#macro FMOD_DEBUG_LEVEL_ERROR                      0x00000001
#macro FMOD_DEBUG_LEVEL_WARNING                    0x00000002
#macro FMOD_DEBUG_LEVEL_LOG                        0x00000004
#macro FMOD_DEBUG_TYPE_MEMORY                      0x00000100
#macro FMOD_DEBUG_TYPE_FILE                        0x00000200
#macro FMOD_DEBUG_TYPE_CODEC                       0x00000400
#macro FMOD_DEBUG_TYPE_TRACE                       0x00000800
#macro FMOD_DEBUG_DISPLAY_TIMESTAMPS               0x00010000
#macro FMOD_DEBUG_DISPLAY_LINENUMBERS              0x00020000
#macro FMOD_DEBUG_DISPLAY_THREAD                   0x00040000

/// https://www.fmod.com/docs/2.02/api/core-api-common.html#fmod_debug_mode
enum FMOD_DEBUG_MODE
{
    TTY = 0,
    FILE,
    CALLBACK,
}

/// https://www.fmod.com/docs/2.02/api/studio-api-common.html#fmod_studio_parameter_type
enum FMOD_STUDIO_PARAMETER_TYPE
{
    GAME_CONTROLLED = 0,
    AUTOMATIC_DISTANCE,
    AUTOMATIC_EVENT_CONE_ANGLE,
    AUTOMATIC_EVENT_ORIENTATION,
    AUTOMATIC_DIRECTION,
    AUTOMATIC_ELEVATION,
    AUTOMATIC_LISTENER_ORIENTATION,
    AUTOMATIC_SPEED,
    AUTOMATIC_SPEED_ABSOLUTE,
    AUTOMATIC_DISTANCE_NORMALIZED,

    MAX,
}

/// https://www.fmod.com/docs/2.02/api/studio-api-common.html#fmod_studio_loading_state
enum FMOD_STUDIO_LOADING_STATE
{
    UNLOADING = 0,
    UNLOADED,
    LOADING,
    LOADED,
    ERROR,
}

/// https://www.fmod.com/docs/2.02/api/studio-api-eventdescription.html#fmod_studio_user_property_type
enum FMOD_STUDIO_USER_PROPERTY_TYPE
{
    INTEGER = 0,
    BOOLEAN,
    FLOAT,
    STRING,
}

/// https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#fmod_studio_event_property
enum FMOD_STUDIO_EVENT_PROPERTY
{
    CHANNELPRIORITY = 0,
    SCHEDULE_DELAY,
    SCHEDULE_LOOKAHEAD,
    MINIMUM_DISTANCE,
    MAXIMUM_DISTANCE,
    COOLDOWN,
    MAX,
}

/// https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#fmod_studio_stop_mode
enum FMOD_STUDIO_STOP_MODE
{
    ALLOWFADEOUT = 0,
    IMMEDIATE,
}

/// https://www.fmod.com/docs/2.02/api/studio-api-common.html#fmod_studio_playback_state
enum FMOD_STUDIO_PLAYBACK_STATE
{
    PLAYING = 0,
    SUSTAINING,
    STOPPED,
    STARTING,
    STOPPING,
}

/// https://www.fmod.com/docs/2.02/api/core-api-system.html#fmod_outputtype
enum FMOD_OUTPUTTYPE
{
    AUTODETECT = 0,
    UNKNOWN,
    NOSOUND,
    WAVWRITER,
    NOSOUND_NRT,
    WAVWRITER_NRT,
    WASAPI,
    ASIO,
    PULSEAUDIO,
    ALSA,
    COREAUDIO,
    AUDIOTRACK,
    OPENSL,
    AUDIOOUT,
    AUDIO3D,
    WEBAUDIO,
    NNAUDIO,
    WINSONIC,
    AAUDIO,
    MAX,
}

/// https://www.fmod.com/docs/2.02/api/core-api-common.html#fmod_speakermode
enum FMOD_SPEAKERMODE
{
    DEFAULT = 0,
    RAW,
    MONO,
    STEREO,
    QUAD,
    SURROUND,
    _5POINT1, // Leading underscore is necessary because the variant name starts with a number.
    _7POINT1,
    _7POINT1POINT4,
    MAX,
}


#macro FMOD_STUDIO_SYSTEM_CALLBACK_PREUPDATE               0x00000001
#macro FMOD_STUDIO_SYSTEM_CALLBACK_POSTUPDATE              0x00000002
#macro FMOD_STUDIO_SYSTEM_CALLBACK_BANK_UNLOAD             0x00000004
#macro FMOD_STUDIO_SYSTEM_CALLBACK_LIVEUPDATE_CONNECTED    0x00000008
#macro FMOD_STUDIO_SYSTEM_CALLBACK_LIVEUPDATE_DISCONNECTED 0x00000010
#macro FMOD_STUDIO_SYSTEM_CALLBACK_ALL                     0xFFFFFFFF


#macro FMOD_STUDIO_EVENT_CALLBACK_CREATED                  0x00000001
#macro FMOD_STUDIO_EVENT_CALLBACK_DESTROYED                0x00000002
#macro FMOD_STUDIO_EVENT_CALLBACK_STARTING                 0x00000004
#macro FMOD_STUDIO_EVENT_CALLBACK_STARTED                  0x00000008
#macro FMOD_STUDIO_EVENT_CALLBACK_RESTARTED                0x00000010
#macro FMOD_STUDIO_EVENT_CALLBACK_STOPPED                  0x00000020
#macro FMOD_STUDIO_EVENT_CALLBACK_START_FAILED             0x00000040
#macro FMOD_STUDIO_EVENT_CALLBACK_CREATE_PROGRAMMER_SOUND  0x00000080
#macro FMOD_STUDIO_EVENT_CALLBACK_DESTROY_PROGRAMMER_SOUND 0x00000100
#macro FMOD_STUDIO_EVENT_CALLBACK_PLUGIN_CREATED           0x00000200
#macro FMOD_STUDIO_EVENT_CALLBACK_PLUGIN_DESTROYED         0x00000400
#macro FMOD_STUDIO_EVENT_CALLBACK_TIMELINE_MARKER          0x00000800
#macro FMOD_STUDIO_EVENT_CALLBACK_TIMELINE_BEAT            0x00001000
#macro FMOD_STUDIO_EVENT_CALLBACK_SOUND_PLAYED             0x00002000
#macro FMOD_STUDIO_EVENT_CALLBACK_SOUND_STOPPED            0x00004000
#macro FMOD_STUDIO_EVENT_CALLBACK_REAL_TO_VIRTUAL          0x00008000
#macro FMOD_STUDIO_EVENT_CALLBACK_VIRTUAL_TO_REAL          0x00010000
#macro FMOD_STUDIO_EVENT_CALLBACK_START_EVENT_COMMAND      0x00020000
#macro FMOD_STUDIO_EVENT_CALLBACK_NESTED_TIMELINE_BEAT     0x00040000
#macro FMOD_STUDIO_EVENT_CALLBACK_ALL                      0xFFFFFFFF

#macro FMOD_SYSTEM_CALLBACK_DEVICELISTCHANGED      0x00000001
#macro FMOD_SYSTEM_CALLBACK_DEVICELOST             0x00000002
#macro FMOD_SYSTEM_CALLBACK_MEMORYALLOCATIONFAILED 0x00000004
#macro FMOD_SYSTEM_CALLBACK_THREADCREATED          0x00000008
#macro FMOD_SYSTEM_CALLBACK_BADDSPCONNECTION       0x00000010
#macro FMOD_SYSTEM_CALLBACK_PREMIX                 0x00000020
#macro FMOD_SYSTEM_CALLBACK_POSTMIX                0x00000040
#macro FMOD_SYSTEM_CALLBACK_ERROR                  0x00000080
#macro FMOD_SYSTEM_CALLBACK_MIDMIX                 0x00000100
#macro FMOD_SYSTEM_CALLBACK_THREADDESTROYED        0x00000200
#macro FMOD_SYSTEM_CALLBACK_PREUPDATE              0x00000400
#macro FMOD_SYSTEM_CALLBACK_POSTUPDATE             0x00000800
#macro FMOD_SYSTEM_CALLBACK_RECORDLISTCHANGED      0x00001000
#macro FMOD_SYSTEM_CALLBACK_BUFFEREDNOMIX          0x00002000
#macro FMOD_SYSTEM_CALLBACK_DEVICEREINITIALIZE     0x00004000
#macro FMOD_SYSTEM_CALLBACK_OUTPUTUNDERRUN         0x00008000
#macro FMOD_SYSTEM_CALLBACK_RECORDPOSITIONCHANGED  0x00010000
#macro FMOD_SYSTEM_CALLBACK_ALL                    0xFFFFFFFF

/// https://www.fmod.com/docs/2.02/api/studio-api-system.html#fmod_studio_load_memory_mode
enum FMOD_STUDIO_LOAD_MEMORY_MODE
{
    MEMORY = 0,
    MEMORY_POINT,
}
