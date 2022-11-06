
/// https://www.fmod.com/resources/documentation-api?version=2.02&page=core-api-system.html#system_create
/// @param {int?} header_version = FMOD_VERSION
/// @param {FmodSystem?} out_system = undefined
/// @param {FmlError?} error = undefined
/// @returns {FmodSystem}
function FmodSystem_Create(header_version = FMOD_VERSION, out_system = undefined, error = undefined)
{
    var out_buf = __fml_buffers_fixed[@ buffer_u64];
    var res = __FML_Core_System_create(header_version, buffer_get_address(out_buf));
    __fml_set_error(error, res);
    if (res == FML_RESULT.OK) {
        if (out_system == undefined) out_system = new FmodSystem();
        out_system.core_system_index = real(buffer_peek(out_buf, 0, buffer_u64));
        return out_system;
    }
    return undefined;
}

/// https://www.fmod.com/resources/documentation-api?version=2.02&page=core-api-system.html
function FmodSystem() constructor
{
    core_system_index = 0;  /// @is {int}
    
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=core-api-system.html#system_release
    /// @param {FmlError} error = undefined
    /// @returns {bool}
    static release = function(error = undefined)
    {
        var res = __FML_Core_System_release(core_system_index);
        __fml_set_error(error, res);
        return (res == FML_RESULT.OK);
    }
    
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=core-api-system.html#system_setoutput
    /// @param {FMOD_OUTPUTTYPE} output
    /// @param {FmlError} error = undefined
    /// @returns {bool}
    static set_output = function(output, error = undefined)
    {
        var res = __FML_Core_System_setOutput(core_system_index, output);
        __fml_set_error(error, res);
        return (res == FML_RESULT.OK);
    }
    
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=core-api-system.html#system_getoutput
    /// @param {FmlError} error = undefined
    /// @returns {FMOD_OUTPUTTYPE}
    static get_output = function(error = undefined)
    {
        var out_buf = __fml_buffers_fixed[@ buffer_s32];
        var res = __FML_Core_System_getOutput(core_system_index, buffer_get_address(out_buf));
        __fml_set_error(error, res);
        return (res == FML_RESULT.OK) ? buffer_peek(out_buf, 0, buffer_s32) : undefined;
    }
    
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=core-api-system.html#system_getnumdrivers
    /// @param {FmlError} error = undefined
    /// @returns {int}
    static get_num_drivers = function(error = undefined)
    {
        var out_buf = __fml_buffers_fixed[@ buffer_s32];
        var res = __FML_Core_System_getNumDrivers(core_system_index, buffer_get_address(out_buf));
        __fml_set_error(error, res);
        return (res == FML_RESULT.OK) ? real(buffer_peek(out_buf, 0, buffer_s32)) : undefined;
    }
    
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=core-api-system.html#system_getdriverinfo
    /// @param {int} id
    /// @param {FML_DRIVER_INFO?} out_driver_info = undefined
    /// @param {FmlError} error = undefined
    /// @returns {FML_DRIVER_INFO}
    static get_driver_info = function(_id, out_driver_info = undefined, error = undefined)
    {
        var out_buf = buffer_create(0, buffer_fixed, 1);
        var res = undefined;
        for (var i = 0; i < 8; ++i) {
            var size = 64 * power(2, i);
            buffer_resize(out_buf, size);
            buffer_poke(out_buf, 0, __FML_BUFFER_SIZE_HINT_TYPE, size);
            res = __FML_Core_System_getDriverInfo(core_system_index, _id, buffer_get_address(out_buf));
            if (res == FML_RESULT.OK) {
                buffer_seek(out_buf, buffer_seek_start, 0);
                if (out_driver_info == undefined) out_driver_info = new FML_DRIVER_INFO();
                __FML_DRIVER_INFO_deserialize(out_driver_info, out_buf);
                __fml_set_error(error, res);
                buffer_delete(out_buf);
                return out_driver_info;
            }
            else if (res != FML_RESULT.BUFFER_TOO_SMALL) {
                break;
            }
        }
        __fml_set_error(error, res);
        buffer_delete(out_buf);
        return undefined;
    }
    
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=core-api-system.html#system_setdriver
    /// @param {int} driver
    /// @param {FmlError} error = undefined
    /// @returns {bool}
    static set_driver = function(driver, error = undefined)
    {
        var res = __FML_Core_System_setDriver(core_system_index, driver);
        __fml_set_error(error, res);
        return (res == FML_RESULT.OK);
    }
    
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=core-api-system.html#system_getdriver
    /// @param {FmlError} error = undefined
    /// @returns {int}
    static get_driver = function(error = undefined)
    {
        var out_buf = __fml_buffers_fixed[@ buffer_s32];
        var res = __FML_Core_System_getDriver(core_system_index, buffer_get_address(out_buf));
        return (res == FML_RESULT.OK) ? real(buffer_peek(out_buf, 0, buffer_s32)) : undefined;
    }
    
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=core-api-system.html#system_setsoftwarechannels
    /// @param {int} num_software_channels
    /// @param {FmlError} error = undefined
    /// @returns {bool}
    static set_software_channels = function(num_software_channels, error = undefined)
    {
        var res = __FML_Core_System_setSoftwareChannels(core_system_index, num_software_channels);
        __fml_set_error(error, res);
        return (res == FML_RESULT.OK);
    }
    
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=core-api-system.html#system_getsoftwarechannels
    /// @param {FmlError} error = undefined
    /// @returns {int}
    static get_software_channels = function(error = undefined)
    {
        var out_buf = __fml_buffers_fixed[@ buffer_s32];
        var res = __FML_Core_System_getSoftwareChannels(core_system_index, buffer_get_address(out_buf));
        __fml_set_error(error, res);
        return (res == FML_RESULT.OK) ? real(buffer_peek(out_buf, 0, buffer_s32)) : undefined;
    }
    
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=core-api-system.html#system_setsoftwareformat
    /// @param {int} sample_rate
    /// @param {FMOD_SPEAKERMODE} speaker_mode
    /// @param {int} num_raw_speakers
    /// @param {FmlError} error = undefined
    /// @returns {bool}
    static set_software_format = function(sample_rate, speaker_mode, num_raw_speakers, error = undefined)
    {
        var res = __FML_Core_System_setSoftwareFormat(core_system_index, sample_rate, speaker_mode, num_raw_speakers);
        __fml_set_error(error, res);
        return (res == FML_RESULT.OK);
    }
    
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=core-api-system.html#system_getsoftwareformat
    /// @param {FML_SOFTWARE_FORMAT?} out_software_format
    /// @param {FmlError} error = undefined
    /// @returns {FML_SOFTWARE_FORMAT}
    static get_software_format = function(out_software_format = undefined, error = undefined)
    {
        var out_buf = buffer_create(12, buffer_fixed, 4);
        var res = __FML_Core_System_getSoftwareFormat(core_system_index, buffer_get_address(out_buf));
        __fml_set_error(error, res);
        if (res == FML_RESULT.OK) {
            if (out_software_format == undefined) out_software_format = new FML_SOFTWARE_FORMAT();
            __FML_SOFTWARE_FORMAT_deserialize(out_software_format, out_buf);
            buffer_delete(out_buf);
            return out_software_format;
        }
        buffer_delete(out_buf);
        return undefined;
    }
    
    
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=core-api-system.html#system_setdspbuffersize
    /// @param {number} buffer_length
    /// @param {number} num_buffers
    /// @param {FmlError} error = undefined
    /// @returns {bool}
    static set_dsp_buffer_size = function(buffer_length, num_buffers, error = undefined)
    {
        var res = __FML_Core_System_setDSPBufferSize(core_system_index, buffer_length, num_buffers);
        __fml_set_error(error, res);
        return (res == FML_RESULT.OK);
    }
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=core-api-system.html#system_getdspbuffersize
    /// @param {FML_DSP_BUFFER_SIZE?} out_dsp_buffer_size = undefined
    /// @param {FmlError} error = undefined
    /// @returns {FML_DSP_BUFFER_SIZE}
    static get_dsp_buffer_size = function(out_dsp_buffer_size = undefined, error = undefined)
    {
        var out_buf = buffer_create(8, buffer_fixed, 4);
        var res = __FML_Core_System_getDSPBufferSize(core_system_index, buffer_get_address(out_buf));
        __fml_set_error(error, res);
        if (res == FML_RESULT.OK) {
            if (out_dsp_buffer_size == undefined) out_dsp_buffer_size = new FML_DSP_BUFFER_SIZE();
            __FML_DSP_BUFFER_SIZE_deserialize(out_dsp_buffer_size, out_buf);
            buffer_delete(out_buf);
            return out_dsp_buffer_size;
        }
        buffer_delete(out_buf);
        return undefined;
    }
    
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=core-api-system.html#system_setfilesystem
    static _set_file_system = function() {}
    static _attach_file_system = function() {}
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=core-api-system.html#system_setadvancedsettings
    static _set_advanced_settings = function() {}
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=core-api-system.html#system_getadvancedsettings
    static _get_advanced_settings = function() {}
    
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=core-api-system.html#system_setcallback
    /// @param {function<int, int, void>} callback
    /// @param {int} callback_mask = FMOD_SYSTEM_CALLBACK_ALL A bitmask of FMOD_SYSTEM_CALLBACK_xx values.
    /// @param {FmlError?} error = undefined
    /// @returns {bool}
    static set_callback = function(callback, callback_mask = FMOD_SYSTEM_CALLBACK_ALL, error = undefined)
    {
        var res = __FML_Core_System_setCallback(core_system_index, callback_mask);
        __fml_set_error(error, res);
        if (res == FML_RESULT.OK) {
            global.__fml_callbacks[? core_system_index] = callback;
            return true;
        }
        return false;
    }
    
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=core-api-system.html#system_setpluginpath
    static _set_plugin_path = function() {}
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=core-api-system.html#system_loadplugin
    static _load_plugin = function() {}
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=core-api-system.html#system_unloadplugin
    static _unload_plugin = function() {}
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=core-api-system.html#system_getnumnestedplugins
    static _get_num_nested_plugins = function() {}
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=core-api-system.html#system_getnestedplugin
    static _get_nested_plugin = function() {}
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=core-api-system.html#system_getnumplugins
    static _get_num_plugins = function() {}
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=core-api-system.html#system_getpluginhandle
    static _get_plugin_handle = function() {}
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=core-api-system.html#system_getplugininfo
    static _get_plugin_info = function() {}
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=core-api-system.html#system_setoutputbyplugin
    static _set_output_by_plugin = function() {}
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=core-api-system.html#system_getoutputbyplugin
    static _get_output_by_plugin = function() {}
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=core-api-system.html#system_createdspbyplugin
    static _create_dsp_by_plugin = function() {}
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=core-api-system.html#system_getdspinfobyplugin
    static _get_dsp_info_by_plugin = function() {}
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=core-api-system.html#system_registercodec
    static _register_codec = function() {}
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=core-api-system.html#system_registerdsp
    static _register_dsp = function() {}
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=core-api-system.html#system_registeroutput
    static _register_output = function() {}
    
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=core-api-system.html#system_init
    /// @param {int} max_channels
    /// @param {int} flags A bitmask of FMOD_INIT_xx values.
    /// @param {FmlError?} error = undefined
    /// @returns {bool}
    static init = function(max_channels, flags, error = undefined)
    {
        var res = __FML_Core_System_init(core_system_index, max_channels, flags);
        __fml_set_error(error, res);
        return (res == FML_RESULT.OK);
    }
    
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=core-api-system.html#system_close
    /// @param {FmlError?} error = undefined
    /// @returns {bool}
    static close = function(error = undefined)
    {
        var res = __FML_Core_System_close(core_system_index);
        __fml_set_error(error, res);
        return (res == FML_RESULT.OK);
    }
    
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=core-api-system.html#system_update
    /// @param {FmlError?} error = undefined
    /// @returns {bool}
    static update = function(error = undefined)
    {
        var res = __FML_Core_System_update(core_system_index);
        __fml_set_error(error, res);
        return (res == FML_RESULT.OK);
    }
    
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=core-api-system.html#system_setspeakerposition
    static _set_speaker_position = function() {}
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=core-api-system.html#system_getspeakerposition
    static _get_speaker_position = function() {}
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=core-api-system.html#system_setstreambuffersize
    static _set_stream_buffer_size = function() {}
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=core-api-system.html#system_getstreambuffersize
    static _get_stream_buffer_size = function() {}
    
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=core-api-system.html#system_set3dsettings
    /// @param {number} doppler_scale
    /// @param {number} distance_factor
    /// @param {number} rolloff_scale
    /// @param {FmlError?} error = undefined
    /// @returns {bool}
    static set_3d_settings = function(doppler_scale, distance_factor, rolloff_scale, error = undefined)
    {
        var res = __FML_Core_System_set3DSettings(core_system_index, doppler_scale, distance_factor, rolloff_scale);
        __fml_set_error(error, res);
        return (res == FML_RESULT.OK);
    }
    
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=core-api-system.html#system_get3dsettings
    /// @param {FML_3D_SETTINGS?} out_settings = undefined
    /// @param {FmlError?} error = undefined
    /// @returns {FML_3D_SETTINGS}
    static get_3d_settings = function(out_settings = undefined, error = undefined)
    {
        var out_buf = buffer_create(12, buffer_fixed, 4);
        var res = __FML_Core_System_get3DSettings(core_system_index, buffer_get_address(out_buf));
        __fml_set_error(error, res);
        if (res == FML_RESULT.OK) {
            if (out_settings == undefined) out_settings = new FML_3D_SETTINGS();
            __FML_3D_SETTINGS_deserialize(out_settings, out_buf);
            buffer_delete(out_buf);
            return out_settings;
        }
        buffer_delete(out_buf);
        return undefined;
    }
    
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=core-api-system.html#system_set3dnumlisteners
    static _set_3d_num_listeners = function() {}
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=core-api-system.html#system_get3dnumlisteners
    static _get_3d_num_listeners = function() {}
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=core-api-system.html#system_set3dlistenerattributes
    static _set_3d_listener_attributes = function() {}
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=core-api-system.html#system_get3dlistenerattributes
    static _get_3d_listener_attributes = function() {}
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=core-api-system.html#system_set3drolloffcallback
    static _set_3d_rolloff_callback = function() {}
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=core-api-system.html#system_mixersuspend
    static _mixer_suspend = function() {}
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=core-api-system.html#system_mixerresume
    static _mixer_resume = function() {}
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=core-api-system.html#system_getdefaultmixmatrix
    static _get_default_mix_matrix = function() {}
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=core-api-system.html#system_getspeakermodechannels
    static _get_speaker_mode_channels = function() {}
    
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=core-api-system.html#system_getversion
    /// @param {FmlError} error = undefined
    /// @returns {int}
    static get_version = function(error = undefined)
    {
        var out_buf = __fml_buffers_fixed[@ buffer_u32];
        var res = __FML_Core_System_getVersion(core_system_index, buffer_get_address(out_buf));
        __fml_set_error(error, res);
        return (res == FML_RESULT.OK) ? buffer_peek(out_buf, 0, buffer_u32) : undefined;
    }
    
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=core-api-system.html#system_getoutputhandle
    static _get_output_handle = function() {}
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=core-api-system.html#system_getchannelsplaying
    static _get_channels_playing = function() {}
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=core-api-system.html#system_getcpuusage
    static _get_cpu_usage = function() {}
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=core-api-system.html#system_getfileusage
    static _get_file_usage = function() {}
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=core-api-system.html#system_createsound
    static _create_sound = function() {}
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=core-api-system.html#system_createstream
    static _create_stream = function() {}
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=core-api-system.html#system_createdsp
    static _create_dsp = function() {}
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=core-api-system.html#system_createdspbytype
    static _create_dsp_by_type = function() {}
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=core-api-system.html#system_createchannelgroup
    static _create_channel_group = function() {}
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=core-api-system.html#system_createsoundgroup
    static _create_sound_group = function() {}
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=core-api-system.html#system_createreverb3d
    static _create_reverb_3d = function() {}
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=core-api-system.html#system_playsound
    static _play_sound = function() {}
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=core-api-system.html#system_playdsp
    static _play_dsp = function() {}
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=core-api-system.html#system_getchannel
    static _get_channel = function() {}
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=core-api-system.html#system_getdspinfobytype
    static _get_dsp_info_by_type = function() {}
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=core-api-system.html#system_getmasterchannelgroup
    static _get_master_channel_group = function() {}
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=core-api-system.html#system_getmastersoundgroup
    static _get_master_sound_group = function() {}
    static _attach_channel_group_to_port = function() {}
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=core-api-system.html#system_detachchannelgroupfromport
    static _detach_channel_group_from_port = function() {}
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=core-api-system.html#system_setreverbproperties
    static _set_reverb_properties = function() {}
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=core-api-system.html#system_getreverbproperties
    static _get_reverb_properties = function() {}
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=core-api-system.html#system_lockdsp
    static _lock_dsp = function() {}
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=core-api-system.html#system_unlockdsp
    static _unlock_dsp = function() {}
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=core-api-system.html#system_getrecordnumdrivers
    static _get_record_num_drivers = function() {}
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=core-api-system.html#system_getrecorddriverinfo
    static _get_record_driver_info = function() {}
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=core-api-system.html#system_getrecordposition
    static _get_record_position = function() {}
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=core-api-system.html#system_recordstart
    static _record_start = function() {}
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=core-api-system.html#system_recordstop
    static _record_stop = function() {}
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=core-api-system.html#system_isrecording
    static _is_recording = function() {}
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=core-api-system.html#system_creategeometry
    static _create_geometry = function() {}
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=core-api-system.html#system_setgeometrysettings
    static _set_geometry_settings = function() {}
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=core-api-system.html#system_getgeometrysettings
    static _get_geometry_settings = function() {}
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=core-api-system.html#system_loadgeometry
    static _load_geometry = function() {}
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=core-api-system.html#system_getgeometryocclusion
    static _get_geometry_occlusion = function() {}
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=core-api-system.html#system_setnetworkproxy
    static _set_network_proxy = function() {}
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=core-api-system.html#system_getnetworkproxy
    static _get_network_proxy = function() {}
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=core-api-system.html#system_setnetworktimeout
    static _set_network_timeout = function() {}
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=core-api-system.html#system_getnetworktimeout
    static _get_network_timeout = function() {}
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=core-api-system.html#system_setuserdata
    static _set_user_data = function() {}
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=core-api-system.html#system_getuserdata
    static _get_user_data = function() {}
}
