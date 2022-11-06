
/// @returns {TestSuite}
function make_test_suite_FmodSystem()
{
    var suite = new TestSuite("FmodSystem");
    suite.is_implemented_func = function(test_name) {
        return variable_struct_exists(new FmodSystem(), test_name);
    };
    
    suite.add_test("create", function() {
        var error = new FmlError();
        
        var sys_1 = FmodSystem_Create(, , error);
        ASSERT_NOT_EQUALS(sys_1, undefined);
        ASSERT_TRUE(sys_1.core_system_index >= 1);
        ASSERT_NO_FML_ERROR(error);
        
        var sys_2 = FmodSystem_Create(, , error);
        ASSERT_NOT_EQUALS(sys_2, undefined);
        ASSERT_TRUE(sys_2.core_system_index >= 1);
        ASSERT_NOT_EQUALS(sys_1.core_system_index, sys_2.core_system_index);
        ASSERT_NO_FML_ERROR(error);
        
        var out_sys = new FmodSystem();
        var sys_3 = FmodSystem_Create(, out_sys, error);
        ASSERT_EQUALS(sys_3, out_sys);
        ASSERT_NOT_EQUALS(sys_3, undefined);
        ASSERT_TRUE(sys_3.core_system_index >= 1);
        ASSERT_NOT_EQUALS(sys_1.core_system_index, sys_3.core_system_index);
        ASSERT_NO_FML_ERROR(error);
        
        var sys_4 = FmodSystem_Create(FMOD_VERSION, , error);
        ASSERT_NO_FML_ERROR(error);
        
        var v_product = fml_fmod_version_get_product(FMOD_VERSION);
        var v_major = fml_fmod_version_get_major(FMOD_VERSION);
        var v_minor = fml_fmod_version_get_minor(FMOD_VERSION);
        ASSERT_UNDEFINED(FmodSystem_Create(0, , error));
        ASSERT_FML_ERROR(error, FML_RESULT.HEADER_MISMATCH);
        ASSERT_UNDEFINED(FmodSystem_Create(fml_fmod_version_from_parts(v_product, v_major + 1, v_minor), , error));
        ASSERT_FML_ERROR(error, FML_RESULT.HEADER_MISMATCH);
        
        sys_1.release();
        sys_2.release();
        sys_3.release();
        sys_4.release();
    });
    
    suite.add_test("release", function() {
        var error = new FmlError();
        var sys = FmodSystem_Create();
        
        ASSERT_TRUE(sys.release(error));
        ASSERT_NO_FML_ERROR(error);
        
        // TODO: How to make it fail?
        
        sys.release();
    });
    
    suite.add_test("set_output", function() {
        var error = new FmlError();
        var sys = FmodSystem_Create();
        
        ASSERT_TRUE(sys.set_output(FMOD_OUTPUTTYPE.AUTODETECT, error));
        ASSERT_NO_FML_ERROR(error);
        ASSERT_FALSE(sys.set_output(-123, error));
        ASSERT_FML_ERROR(error, FML_RESULT.PLUGIN_MISSING);
        
        sys.release();
    });
    
    suite.add_test("get_output", function() {
        var error = new FmlError();
        var sys = FmodSystem_Create();
        
        var output = sys.get_output(error);
        ASSERT_NO_FML_ERROR(error);
        ASSERT_TRUE(output >= 0 && output < FMOD_OUTPUTTYPE.MAX);
        
        sys.set_output(FMOD_OUTPUTTYPE.NOSOUND);
        ASSERT_EQUALS(sys.get_output(), FMOD_OUTPUTTYPE.NOSOUND);
        
        sys.release();
    });
    
    suite.add_test("get_num_drivers", function() {
        var error = new FmlError();
        var sys = FmodSystem_Create();
        
        ASSERT_TRUE(sys.get_num_drivers(error) > 0);
        ASSERT_NO_FML_ERROR(error);
        
        sys.release();
    });
    
    suite.add_test("get_driver_info", function() {
        var error = new FmlError();
        var sys = FmodSystem_Create();
        
        var num_drivers = sys.get_num_drivers();
        ASSERT_TRUE(num_drivers > 0);
        for (var i = 0; i < num_drivers; ++i) {
            
            {
                var driver_info = sys.get_driver_info(i, , error);
                ASSERT_NO_FML_ERROR(error);
                ASSERT_DEFINED(driver_info);
                ASSERT_TRUE(string_length(driver_info.name) > 0);
            }
            {
                var out_driver_info = new FML_DRIVER_INFO();
                var driver_info = sys.get_driver_info(i, out_driver_info, error);
                ASSERT_EQUALS(driver_info, out_driver_info);
                ASSERT_NO_FML_ERROR(error);
                
            }
            
        }
        
        sys.release();
    });
    
    suite.add_test("set_driver", function() {
        var error = new FmlError();
        var sys = FmodSystem_Create();
        
        var num_drivers = sys.get_num_drivers();
        ASSERT_TRUE(num_drivers > 0);
        for (var i = 0; i < num_drivers; ++i) {
            ASSERT_TRUE(sys.set_driver(i, error));
            ASSERT_NO_FML_ERROR(error);
            ASSERT_EQUALS(sys.get_driver(), i);
        }
        
        sys.release();
    });
    
    suite.add_test("get_driver", function() {
        var error = new FmlError();
        var sys = FmodSystem_Create();
        
        var driver = sys.get_driver(error);
        ASSERT_NO_FML_ERROR(error);
        ASSERT_TRUE(driver >= 0);
        ASSERT_TRUE(driver < sys.get_num_drivers());
        
        sys.release();
    });
    
    
    suite.add_test("set_software_channels", function() {
        var error = new FmlError();
        var sys = FmodSystem_Create();
        
        ASSERT_TRUE(sys.set_software_channels(32, error));
        ASSERT_NO_FML_ERROR(error);
        ASSERT_EQUALS(sys.get_software_channels(), 32);
        
        sys.init(1024, FMOD_INIT_NORMAL);
        
        ASSERT_FALSE(sys.set_software_channels(32, error));
        ASSERT_FML_ERROR(error, FML_RESULT.INITIALIZED);
        
        sys.release();
    });
    
    suite.add_test("get_software_channels", function() {
        var error = new FmlError();
        var sys = FmodSystem_Create();
        
        sys.set_software_channels(0);
        ASSERT_EQUALS(sys.get_software_channels(error), 0);
        ASSERT_NO_FML_ERROR(error);
        
        sys.set_software_channels(32);
        ASSERT_EQUALS(sys.get_software_channels(error), 32);
        ASSERT_NO_FML_ERROR(error);
        
        sys.release();
        
        ASSERT_UNDEFINED(sys.get_software_channels(error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
    });
    
    suite.add_test("set_software_format", function() {
        var error = new FmlError();
        var sys = FmodSystem_Create();
        
        ASSERT_TRUE(sys.set_software_format(50000, FMOD_SPEAKERMODE.RAW, 13, error));
        var format = sys.get_software_format(,,);
        ASSERT_EQUALS(format.sample_rate, 50000);
        ASSERT_EQUALS(format.speaker_mode, FMOD_SPEAKERMODE.RAW);
        ASSERT_EQUALS(format.num_raw_speakers, 13);
        
        ASSERT_FALSE(sys.set_software_format(-1, FMOD_SPEAKERMODE.RAW, 13, error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_PARAM);
        
        sys.release();
    });
    
    suite.add_test("get_software_format", function() {
        var error = new FmlError();
        var sys = FmodSystem_Create();
        
        {
            var format = sys.get_software_format(, error);
            ASSERT_NO_FML_ERROR(error);
            ASSERT_DEFINED(format);
            ASSERT_TRUE(format.sample_rate > 0);
            ASSERT_TRUE(format.speaker_mode >= 0 && format.speaker_mode < FMOD_SPEAKERMODE.MAX);
            ASSERT_TRUE(format.num_raw_speakers >= 0);
        }
        
        {
            var out_format = new FML_SOFTWARE_FORMAT();
            var format = sys.get_software_format(out_format, error);
            ASSERT_NO_FML_ERROR(error);
            ASSERT_EQUALS(format, out_format);
        }
        
        sys.release();
        
        ASSERT_UNDEFINED(sys.get_software_format(, error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
    });
    
    
    suite.add_test("set_dsp_buffer_size", function() {
        var error = new FmlError();
        var sys = FmodSystem_Create();
        
        ASSERT_TRUE(sys.set_dsp_buffer_size(512, 2, error));
        ASSERT_NO_FML_ERROR(error);
        
        sys.init(1024, FMOD_INIT_NORMAL);
        
        var buf_size = sys.get_dsp_buffer_size();
        ASSERT_EQUALS(buf_size.buffer_length, 512);
        ASSERT_EQUALS(buf_size.num_buffers, 2);
        
        sys.release();
    });
    
    suite.add_test("get_dsp_buffer_size", function() {
        var error = new FmlError();
        var sys = FmodSystem_Create();
        sys.init(1024, FMOD_INIT_NORMAL);
        
        {
            var buf_size = sys.get_dsp_buffer_size(undefined, error);
            ASSERT_EQUALS(buf_size.buffer_length, 1024);
            ASSERT_EQUALS(buf_size.num_buffers, 4);
        }
        {
            var out_buf_size = new FML_DSP_BUFFER_SIZE();
            var buf_size = sys.get_dsp_buffer_size(out_buf_size, error);
            ASSERT_EQUALS(buf_size, out_buf_size);
            ASSERT_EQUALS(buf_size.buffer_length, 1024);
            ASSERT_EQUALS(buf_size.num_buffers, 4);
        }
        
        sys.release();
    });
    
    suite.add_test("set_file_system", function() { return "TODO"; });
    suite.add_test("attach_file_system", function() { return "TODO"; });
    suite.add_test("set_advanced_settings", function() { return "TODO"; });
    suite.add_test("get_advanced_settings", function() { return "TODO"; });
    
    suite.add_test("set_callback", function() {
        var error = new FmlError();
        var sys = FmodSystem_Create();
        sys.init(1024, FMOD_INIT_NORMAL);
        
        // Store the data of each occurred callback into an array so that we can check
        // them afterwards and see if they hold the data we expect.
        var capture = {
            callback_parameters: [],
        };
        var callback = method(capture, function(type/*: int*/, core_system_index/*: int*/) {
            array_push(callback_parameters, {
                type: type,
                core_system_index: core_system_index,
            });
        });
        ASSERT_TRUE(sys.set_callback(callback, FMOD_SYSTEM_CALLBACK_PREUPDATE | FMOD_SYSTEM_CALLBACK_POSTUPDATE, error));
        ASSERT_NO_FML_ERROR(error);
        
        sys.update();
        fml_update_callbacks();
        
        ASSERT_EQUALS(array_length(capture.callback_parameters), 2);
        ASSERT_EQUALS(capture.callback_parameters[@ 0].type, FMOD_SYSTEM_CALLBACK_PREUPDATE);
        ASSERT_EQUALS(capture.callback_parameters[@ 0].core_system_index, sys.core_system_index);
        ASSERT_EQUALS(capture.callback_parameters[@ 1].type, FMOD_SYSTEM_CALLBACK_POSTUPDATE);
        ASSERT_EQUALS(capture.callback_parameters[@ 1].core_system_index, sys.core_system_index);
        
        sys.release();
        
        ASSERT_FALSE(sys.set_callback(callback, FMOD_SYSTEM_CALLBACK_PREUPDATE | FMOD_SYSTEM_CALLBACK_POSTUPDATE, error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
    });
    
    suite.add_test("set_plugin_path", function() { return "TODO"; });
    suite.add_test("load_plugin", function() { return "TODO"; });
    suite.add_test("unload_plugin", function() { return "TODO"; });
    suite.add_test("get_num_nested_plugins", function() { return "TODO"; });
    suite.add_test("get_nested_plugin", function() { return "TODO"; });
    suite.add_test("get_num_plugins", function() { return "TODO"; });
    suite.add_test("get_plugin_handle", function() { return "TODO"; });
    suite.add_test("get_plugin_info", function() { return "TODO"; });
    suite.add_test("set_output_by_plugin", function() { return "TODO"; });
    suite.add_test("get_output_by_plugin", function() { return "TODO"; });
    suite.add_test("create_dsp_by_plugin", function() { return "TODO"; });
    suite.add_test("get_dsp_info_by_plugin", function() { return "TODO"; });
    suite.add_test("register_codec", function() { return "TODO"; });
    suite.add_test("register_dsp", function() { return "TODO"; });
    suite.add_test("register_output", function() { return "TODO"; });
    
    suite.add_test("init", function() {
        var error = new FmlError();
        var sys = FmodSystem_Create();
        
        ASSERT_TRUE(sys.init(0, FMOD_INIT_NORMAL, error));
        ASSERT_NO_FML_ERROR(error);
        ASSERT_FALSE(sys.init(0, FMOD_INIT_NORMAL, error));
        ASSERT_FML_ERROR(error, FML_RESULT.INITIALIZED);
        
        sys.release();
    });
    
    suite.add_test("close", function() { return "TODO"; });
    
    suite.add_test("update", function() {
        var error = new FmlError();
        var sys = FmodSystem_Create();
        
        ASSERT_FALSE(sys.update(error));
        ASSERT_FML_ERROR(error, FML_RESULT.UNINITIALIZED);
        
        sys.init(1024, FMOD_INIT_NORMAL);
        
        ASSERT_TRUE(sys.update(error));
        ASSERT_NO_FML_ERROR(error);
        
        sys.release();
    });
    
    suite.add_test("set_speaker_position", function() { return "TODO"; });
    suite.add_test("set_speaker_position", function() { return "TODO"; });
    suite.add_test("set_stream_buffer_size", function() { return "TODO"; });
    suite.add_test("get_stream_buffer_size", function() { return "TODO"; });
    
    suite.add_test("set_3d_settings", function() {
        var error = new FmlError();
        var sys = FmodSystem_Create();
        
        ASSERT_TRUE(sys.set_3d_settings(1, 1, 1, error));
        ASSERT_NO_FML_ERROR(error);
        
        ASSERT_FALSE(sys.set_3d_settings(-1, -1, -1, error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_PARAM);
        
        sys.release();
    });
    
    suite.add_test("get_3d_settings", function() {
        var error = new FmlError();
        var sys = FmodSystem_Create();
        
        sys.set_3d_settings(1, 1, 1, error);
        
        {
            var settings = sys.get_3d_settings(undefined, error);
            ASSERT_NO_FML_ERROR(error);
            ASSERT_EQUALS(settings.doppler_scale, 1);
            ASSERT_EQUALS(settings.distance_factor, 1);
            ASSERT_EQUALS(settings.rolloff_scale, 1);
        }
        
        sys.set_3d_settings(2, 3, 4, error);
        
        {
            var out_settings = new FML_3D_SETTINGS();
            var settings = sys.get_3d_settings(out_settings, error);
            ASSERT_NO_FML_ERROR(error);
            ASSERT_EQUALS(settings, out_settings);
            ASSERT_EQUALS(settings.doppler_scale, 2);
            ASSERT_EQUALS(settings.distance_factor, 3);
            ASSERT_EQUALS(settings.rolloff_scale, 4);
        }
        
        sys.release();
        
        ASSERT_UNDEFINED(sys.get_3d_settings(undefined, error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
    });
    
    suite.add_test("set_3d_num_listeners", function() { return "TODO"; });
    suite.add_test("get_3d_num_listeners", function() { return "TODO"; });
    suite.add_test("set_3d_listener_attributes", function() { return "TODO"; });
    suite.add_test("get_3d_listener_attributes", function() { return "TODO"; });
    suite.add_test("set_3d_rolloff_callback", function() { return "TODO"; });
    suite.add_test("mixer_suspend", function() { return "TODO"; });
    suite.add_test("mixer_resume", function() { return "TODO"; });
    suite.add_test("get_default_mix_matrix", function() { return "TODO"; });
    suite.add_test("get_speaker_mode_channels", function() { return "TODO"; });
    
    suite.add_test("get_version", function() {
        var error = new FmlError();
        var sys = FmodSystem_Create();
        
        ASSERT_EQUALS(sys.get_version(error), FMOD_VERSION);
        ASSERT_NO_FML_ERROR(error);
        
        sys.release();
    });
    
    suite.add_test("get_output_handle", function() { return "TODO"; });
    suite.add_test("get_channels_playing", function() { return "TODO"; });
    suite.add_test("get_cpu_usage", function() { return "TODO"; });
    suite.add_test("get_file_usage", function() { return "TODO"; });
    suite.add_test("create_sound", function() { return "TODO"; });
    suite.add_test("create_stream", function() { return "TODO"; });
    suite.add_test("create_dsp", function() { return "TODO"; });
    suite.add_test("create_dsp_by_type", function() { return "TODO"; });
    suite.add_test("create_channel_group", function() { return "TODO"; });
    suite.add_test("create_sound_group", function() { return "TODO"; });
    suite.add_test("create_reverb_3d", function() { return "TODO"; });
    suite.add_test("play_sound", function() { return "TODO"; });
    suite.add_test("play_dsp", function() { return "TODO"; });
    suite.add_test("get_channel", function() { return "TODO"; });
    suite.add_test("get_dsp_info_by_type", function() { return "TODO"; });
    suite.add_test("get_master_channel_group", function() { return "TODO"; });
    suite.add_test("get_master_sound_group", function() { return "TODO"; });
    suite.add_test("attach_channel_group_to_port", function() { return "TODO"; });
    suite.add_test("detach_channel_group_from_port", function() { return "TODO"; });
    suite.add_test("set_reverb_properties", function() { return "TODO"; });
    suite.add_test("get_reverb_properties", function() { return "TODO"; });
    suite.add_test("lock_dsp", function() { return "TODO"; });
    suite.add_test("unlock_dsp", function() { return "TODO"; });
    suite.add_test("get_record_num_drivers", function() { return "TODO"; });
    suite.add_test("get_record_driver_info", function() { return "TODO"; });
    suite.add_test("get_record_position", function() { return "TODO"; });
    suite.add_test("record_start", function() { return "TODO"; });
    suite.add_test("record_stop", function() { return "TODO"; });
    suite.add_test("is_recording", function() { return "TODO"; });
    suite.add_test("create_geometry", function() { return "TODO"; });
    suite.add_test("set_geometry_settings", function() { return "TODO"; });
    suite.add_test("get_geometry_settings", function() { return "TODO"; });
    suite.add_test("load_geometry", function() { return "TODO"; });
    suite.add_test("get_geometry_occlusion", function() { return "TODO"; });
    suite.add_test("set_network_proxy", function() { return "TODO"; });
    suite.add_test("get_network_proxy", function() { return "TODO"; });
    suite.add_test("set_network_timeout", function() { return "TODO"; });
    suite.add_test("get_network_timeout", function() { return "TODO"; });
    suite.add_test("set_user_data", function() { return "TODO"; });
    suite.add_test("get_user_data", function() { return "TODO"; });
    
    return suite;
}
