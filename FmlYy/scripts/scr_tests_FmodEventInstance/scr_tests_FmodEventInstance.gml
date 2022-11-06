
/// @returns {TestSuite}
function make_test_suite_FmodEventInstance()
{
    var suite = new TestSuite("FmodEventInstance");
    suite.is_implemented_func = function(test_name) {
        return variable_struct_exists(new FmodEventInstance(), test_name);
    };
    
    suite.add_test("is_valid", function() {
        var error = new FmlError();
        var sys = __tests_create_system(error);
        var instance = sys.get_event("event:/Coin").create_instance();
        ASSERT_TRUE(instance.is_valid());
        sys.release();
        ASSERT_FALSE(instance.is_valid());
    });
    
    suite.add_test("get_description", function() {
        var error = new FmlError();
        var sys = __tests_create_system(error);
        
        var event = sys.get_event("event:/Coin");
        var instance = event.create_instance();
        ASSERT_EQUALS(event.event_description_index, instance.get_description(, error).event_description_index);
        ASSERT_NO_FML_ERROR(error);
        var out_event = new FmodEventDescription();
        var ev = instance.get_description(out_event, error);
        ASSERT_EQUALS(ev, out_event);
        ASSERT_NO_FML_ERROR(error);
        
        sys.release();
        
        ASSERT_UNDEFINED(instance.get_description(, error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
    });
    
    suite.add_test("get_volume", function() {
        var error = new FmlError();
        var sys = __tests_create_system(error);
        var inst = sys.get_event("event:/Coin").create_instance();
        
        {
            var volume = inst.get_volume(, error);
            ASSERT_DEFINED(volume);
            ASSERT_NO_FML_ERROR(error);
            ASSERT_EQUALS(volume.volume, 1.0);
            ASSERT_EQUALS(volume.final_volume, 1.0);
        }
        {
            var out_volume = {};
            var volume = inst.get_volume(out_volume, error);
            ASSERT_EQUALS(volume, out_volume);
            ASSERT_DEFINED(volume);
            ASSERT_NO_FML_ERROR(error);
            ASSERT_EQUALS(volume.volume, 1.0);
            ASSERT_EQUALS(volume.final_volume, 1.0);
        }
        
        sys.release();
        
        ASSERT_UNDEFINED(inst.get_volume(, error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
    });
    
    suite.add_test("set_volume", function() {
        var error = new FmlError();
        var sys = __tests_create_system(error);
        var inst = sys.get_event("event:/Coin").create_instance();
        
        ASSERT_TRUE(inst.set_volume(0.5, error));
        ASSERT_NO_FML_ERROR(error);
        ASSERT_EQUALS(inst.get_volume().volume, 0.5);
        
        sys.release();
        ASSERT_FALSE(inst.set_volume(0, error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
    });
    
    suite.add_test("get_pitch", function() {
        var error = new FmlError();
        var sys = __tests_create_system(error);
        var inst = sys.get_event("event:/Coin").create_instance();
        
        {
            var pitch = inst.get_pitch(, error);
            ASSERT_DEFINED(pitch);
            ASSERT_NO_FML_ERROR(error);
            ASSERT_EQUALS(pitch.pitch, 1.0);
            ASSERT_EQUALS(pitch.final_pitch, 1.0);
        }
        {
            var out_pitch = {};
            var pitch = inst.get_pitch(out_pitch, error);
            ASSERT_EQUALS(pitch, out_pitch);
            ASSERT_DEFINED(pitch);
            ASSERT_NO_FML_ERROR(error);
            ASSERT_EQUALS(pitch.pitch, 1.0);
            ASSERT_EQUALS(pitch.final_pitch, 1.0);
        }
        
        sys.release();
        
        ASSERT_UNDEFINED(inst.get_pitch(, error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
    });
    
    suite.add_test("set_pitch", function() {
        var error = new FmlError();
        var sys = __tests_create_system(error);
        var inst = sys.get_event("event:/Coin").create_instance();
        
        ASSERT_TRUE(inst.set_pitch(0.5, error));
        ASSERT_NO_FML_ERROR(error);
        ASSERT_EQUALS(inst.get_pitch().pitch, 0.5);
        
        sys.release();
        
        ASSERT_FALSE(inst.set_pitch(0, error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
    });
    
    suite.add_test("get_3d_attributes", function() {
        var error = new FmlError();
        var sys = __tests_create_system(error);
        var inst = sys.get_event("event:/Coin").create_instance();
        
        static _check_attributes = function(attributes)
        {
            ASSERT_DEFINED(attributes);
            ASSERT_INSTANCEOF(attributes, "FMOD_3D_ATTRIBUTES");
            ASSERT_INSTANCEOF(attributes.position, "FMOD_VECTOR");
            ASSERT_INSTANCEOF(attributes.velocity, "FMOD_VECTOR");
            ASSERT_INSTANCEOF(attributes.forward, "FMOD_VECTOR");
            ASSERT_INSTANCEOF(attributes.up, "FMOD_VECTOR");
        }
        
        {
            var attributes = inst.get_3d_attributes(, error);
            ASSERT_NO_FML_ERROR(error);
            _check_attributes(attributes);
        }
        {
            var out_attributes = new FMOD_3D_ATTRIBUTES();
            var attributes = inst.get_3d_attributes(out_attributes, error);
            ASSERT_NO_FML_ERROR(error);
            ASSERT_EQUALS(attributes, out_attributes);
            _check_attributes(attributes);
        }
        
        sys.release();
        
        ASSERT_UNDEFINED(inst.get_3d_attributes(, error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
    });
    
    suite.add_test("set_3d_attributes", function() {
        var error = new FmlError();
        var sys = __tests_create_system(error);
        var inst = sys.get_event("event:/Coin").create_instance();
        
        var attributes = new FMOD_3D_ATTRIBUTES();
        attributes.position = new FMOD_VECTOR(1, 2, 3);
        attributes.velocity = new FMOD_VECTOR(4, 5, 6);
        attributes.forward = new FMOD_VECTOR(7, 8, 9);
        attributes.up = new FMOD_VECTOR(10, 11, 12);
        ASSERT_TRUE(inst.set_3d_attributes(attributes, error));
        ASSERT_NO_FML_ERROR(error);
        ASSERT_STRUCT_DEEP_EQUALS(attributes, inst.get_3d_attributes());
        
        sys.release();
        
        ASSERT_FALSE(inst.set_3d_attributes(new FMOD_3D_ATTRIBUTES(), error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
    });
    
    suite.add_test("get_listener_mask", function() {
        var error = new FmlError();
        var sys = __tests_create_system(error);
        var inst = sys.get_event("event:/Coin").create_instance();
        
        var mask = inst.get_listener_mask(error);
        ASSERT_TYPEOF(mask, "int64");
        ASSERT_NO_FML_ERROR(error);
        
        sys.release();
        
        ASSERT_UNDEFINED(inst.get_listener_mask(error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
    });
    
    suite.add_test("set_listener_mask", function() {
        var error = new FmlError();
        var sys = __tests_create_system(error);
        var inst = sys.get_event("event:/Coin").create_instance();
        
        var mask = int64(41 << 3);
        ASSERT_TRUE(inst.set_listener_mask(mask, error));
        ASSERT_NO_FML_ERROR(error);
        
        ASSERT_EQUALS(inst.get_listener_mask(), mask);
        
        sys.release();
        
        ASSERT_FALSE(inst.set_listener_mask(mask, error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
        
    });
    
    suite.add_test("get_property", function() {
        var error = new FmlError();
        var sys = __tests_create_system(error);
        var inst = sys.get_event("event:/Coin").create_instance();
        
        var value = inst.get_property(FMOD_STUDIO_EVENT_PROPERTY.COOLDOWN, error);
        ASSERT_NO_FML_ERROR(error);
        ASSERT_EQUALS(value, -1);
        
        sys.release();
        
        ASSERT_UNDEFINED(inst.get_property(FMOD_STUDIO_EVENT_PROPERTY.COOLDOWN, error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
    });
    
    suite.add_test("set_property", function() {
        var error = new FmlError();
        var sys = __tests_create_system(error);
        var inst = sys.get_event("event:/Coin").create_instance();
        
        ASSERT_TRUE(inst.set_property(FMOD_STUDIO_EVENT_PROPERTY.COOLDOWN, 0.5, error));
        ASSERT_NO_FML_ERROR(error);
        ASSERT_EQUALS(inst.get_property(FMOD_STUDIO_EVENT_PROPERTY.COOLDOWN), 0.5);
        
        sys.release();
        
        ASSERT_FALSE(inst.set_property(FMOD_STUDIO_EVENT_PROPERTY.COOLDOWN, 0.5, error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
    });
    
    suite.add_test("get_reverb_level", function() {
        var error = new FmlError();
        var sys = __tests_create_system(error);
        var inst = sys.get_event("event:/Coin").create_instance();
        
        var reverb = inst.get_reverb_level(0, error);
        ASSERT_NO_FML_ERROR(error);
        ASSERT_EQUALS(reverb, 0);
        
        sys.release();
        
        ASSERT_UNDEFINED(inst.get_reverb_level(0, error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
    });
    
    suite.add_test("set_reverb_level", function() {
        var error = new FmlError();
        var sys = __tests_create_system(error);
        var inst = sys.get_event("event:/Coin").create_instance();
        
        ASSERT_TRUE(inst.set_reverb_level(0, 0.5, error));
        ASSERT_NO_FML_ERROR(error);
        ASSERT_EQUALS(inst.get_reverb_level(0), 0.5);
        
        sys.release();
        
        ASSERT_FALSE(inst.set_reverb_level(0, 0.5, error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
    });
    
    suite.add_test("get_paused", function() {
        var error = new FmlError();
        var sys = __tests_create_system(error);
        var inst = sys.get_event("event:/Coin").create_instance();
        
        ASSERT_FALSE(inst.get_paused(error));
        ASSERT_NO_FML_ERROR(error);
        
        sys.release();
        
        ASSERT_UNDEFINED(inst.get_paused(error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
    });
    
    suite.add_test("set_paused", function() {
        var error = new FmlError();
        var sys = __tests_create_system(error);
        var inst = sys.get_event("event:/Coin").create_instance();
        
        ASSERT_TRUE(inst.set_paused(false, error));
        ASSERT_NO_FML_ERROR(error);
        ASSERT_FALSE(inst.get_paused());
        
        ASSERT_TRUE(inst.set_paused(true, error));
        ASSERT_NO_FML_ERROR(error);
        ASSERT_TRUE(inst.get_paused());
        
        sys.release();
        
        ASSERT_FALSE(inst.set_paused(false, error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
    });
    
    suite.add_test("start", function() {
        var error = new FmlError();
        var sys = __tests_create_system(error);
        var inst = sys.get_event("event:/Coin").create_instance();
        
        ASSERT_TRUE(inst.start(error));
        ASSERT_NO_FML_ERROR(error);
        
        sys.release();
        
        ASSERT_FALSE(inst.start(error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
    });
    
    suite.add_test("stop", function() {
        var error = new FmlError();
        var sys = __tests_create_system(error);
        var event = sys.get_event("event:/Coin");
        var inst = event.create_instance();
        
        inst.start();
        ASSERT_EQUALS(inst.get_playback_state(), FMOD_STUDIO_PLAYBACK_STATE.STARTING);
        ASSERT_TRUE(inst.stop(FMOD_STUDIO_STOP_MODE.IMMEDIATE, error));
        ASSERT_EQUALS(inst.get_playback_state(), FMOD_STUDIO_PLAYBACK_STATE.STOPPING);
        
        sys.release();
        ASSERT_FALSE(inst.stop(FMOD_STUDIO_STOP_MODE.IMMEDIATE, error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
    });
    
    suite.add_test("get_timeline_position", function() {
        var error = new FmlError();
        var sys = __tests_create_system(error);
        var inst = sys.get_event("event:/Coin").create_instance();
        
        ASSERT_TRUE(inst.get_timeline_position(error) >= 0);
        ASSERT_NO_FML_ERROR(error);
        
        sys.release();
        
        ASSERT_UNDEFINED(inst.get_timeline_position(error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
    });
    
    suite.add_test("set_timeline_position", function() {
        var error = new FmlError();
        var sys = __tests_create_system(error, FMOD_STUDIO_INIT_NORMAL | FMOD_STUDIO_INIT_SYNCHRONOUS_UPDATE);
        var inst = sys.get_event("event:/Coin").create_instance();
        
        ASSERT_TRUE(inst.set_timeline_position(99, error));
        ASSERT_NO_FML_ERROR(error);
        sys.update();
        ASSERT_EQUALS(inst.get_timeline_position(), 99);
        
        sys.release();
        
        ASSERT_FALSE(inst.set_timeline_position(1, error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
    });
    
    suite.add_test("get_playback_state", function() {
        var error = new FmlError();
        var sys = __tests_create_system(error);
        var inst = sys.get_event("event:/Coin").create_instance();
        
        var state = inst.get_playback_state(error);
        ASSERT_NO_FML_ERROR(error);
        ASSERT_EQUALS(state, FMOD_STUDIO_PLAYBACK_STATE.STOPPED);
        
        sys.release();
        
        ASSERT_UNDEFINED(inst.get_playback_state(error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
    });
    
    suite.add_test("get_channel_group", function() {
        var error = new FmlError();
        var sys = __tests_create_system(error, FMOD_STUDIO_INIT_SYNCHRONOUS_UPDATE);
        var inst = sys.get_event("event:/Coin").create_instance();
        
        sys.update();
        
        {
            var group = inst.get_channel_group(, error);
            ASSERT_NO_FML_ERROR(error);
            ASSERT_TRUE(group.channel_group_index > 0);
        }
        {
            var out_group = new FmodChannelGroup();
            var group = inst.get_channel_group(out_group, error);
            ASSERT_EQUALS(group, out_group);
            ASSERT_NO_FML_ERROR(error);
            ASSERT_TRUE(group.channel_group_index > 0);
        }
        
        sys.release();
        
        ASSERT_UNDEFINED(inst.get_channel_group(, error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
    });
    
    suite.add_test("get_min_max_distance", function() {
        var error = new FmlError();
        var sys = __tests_create_system(error);
        var inst = sys.get_event("event:/Coin").create_instance();
        
        {
            var dis = inst.get_min_max_distance(, error);
            ASSERT_NO_FML_ERROR(error);
            ASSERT_DEFINED(dis);
            ASSERT_EQUALS(dis.min, 1);
            ASSERT_EQUALS(dis.max, 20);
        }
        {
            var out_dis = {};
            var dis = inst.get_min_max_distance(out_dis, error);
            ASSERT_EQUALS(dis, out_dis);
            ASSERT_NO_FML_ERROR(error);
            ASSERT_DEFINED(dis);
            ASSERT_EQUALS(dis.min, 1);
            ASSERT_EQUALS(dis.max, 20);
        }
        
        sys.release();
        
        ASSERT_UNDEFINED(inst.get_min_max_distance(, error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
    });
    
    suite.add_test("release", function() {
        var error = new FmlError();
        var sys = __tests_create_system(error);
        var inst = sys.get_event("event:/Coin").create_instance();
        
        ASSERT_TRUE(inst.release(error));
        ASSERT_NO_FML_ERROR(error);
        
        // TODO: How to make it fail?
        
        sys.release();
    });
    
    suite.add_test("is_virtual", function() {
        var error = new FmlError();
        var sys = __tests_create_system(error);
        var inst = sys.get_event("event:/Coin").create_instance();
        
        ASSERT_FALSE(inst.is_virtual(error));
        ASSERT_NO_FML_ERROR(error);
        
        sys.release();
        
        ASSERT_UNDEFINED(inst.is_virtual(error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
    });
    
    suite.add_test("get_parameter_by_id", function() {
        var error = new FmlError();
        var sys = __tests_create_system(error);
        var inst = sys.get_event("event:/Coin").create_instance();
        
        var param_id = new FMOD_STUDIO_PARAMETER_ID();
        param_id.data1 = 2705762729; // TestLocalParameterContinuous
        param_id.data2 = 3396002376;
        
        {
            var value = inst.get_parameter_by_id(param_id, , error);
            ASSERT_NO_FML_ERROR(error);
            ASSERT_EQUALS(value.value, 0);
            ASSERT_EQUALS(value.final_value, 0);
        }
        
        {
            var out_value = {};
            var value = inst.get_parameter_by_id(param_id, out_value, error);
            ASSERT_EQUALS(value, out_value);
            ASSERT_NO_FML_ERROR(error);
            ASSERT_EQUALS(value.value, 0);
            ASSERT_EQUALS(value.final_value, 0);
        }
        
        sys.release();
        
        ASSERT_UNDEFINED(inst.get_parameter_by_id(param_id, , error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
    });
    
    suite.add_test("set_parameter_by_id", function() {
        var error = new FmlError();
        var sys = __tests_create_system(error);
        var inst = sys.get_event("event:/Coin").create_instance();
        
        var param_id = new FMOD_STUDIO_PARAMETER_ID();
        param_id.data1 = 2705762729; // TestLocalParameterContinuous
        param_id.data2 = 3396002376;
        
        ASSERT_TRUE(inst.set_parameter_by_id(param_id, 0.5, , error));
        ASSERT_NO_FML_ERROR(error);
        ASSERT_EQUALS(inst.get_parameter_by_id(param_id).value, 0.5);
        
        sys.release();
        ASSERT_FALSE(inst.set_parameter_by_id(param_id, 0, , error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
    });
    
    suite.add_test("set_parameter_by_id_with_label", function() {
        var error = new FmlError();
        var sys = __tests_create_system(error);
        var inst = sys.get_event("event:/Coin").create_instance();
        
        var param_id = new FMOD_STUDIO_PARAMETER_ID();
        param_id.data1 = 3991529614; // TestLocalParameterLabeled
        param_id.data2 = 3327628025;
        
        ASSERT_TRUE(inst.set_parameter_by_id_with_label(param_id, "Value B", , error));
        ASSERT_NO_FML_ERROR(error);
        ASSERT_EQUALS(inst.get_parameter_by_id(param_id).value, 1);
        
        sys.release();
        
        ASSERT_FALSE(inst.set_parameter_by_id_with_label(param_id, "Value A", , error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
    });
    
    suite.add_test("set_parameters_by_ids", function() {
        var error = new FmlError();
        var sys = __tests_create_system(error);
        var inst = sys.get_event("event:/Coin").create_instance();
        
        var param_id_1 = new FMOD_STUDIO_PARAMETER_ID();
        param_id_1.data1 = 2705762729; // TestLocalParameterContinuous
        param_id_1.data2 = 3396002376;
        var param_id_2 = new FMOD_STUDIO_PARAMETER_ID();
        param_id_2.data1 = 3991529614; // TestLocalParameterLabeled
        param_id_2.data2 = 3327628025;
        
        ASSERT_TRUE(inst.set_parameters_by_ids([param_id_1, param_id_2], [0.5, 2], , error));
        ASSERT_NO_FML_ERROR(error);
        ASSERT_EQUALS(inst.get_parameter_by_id(param_id_1).value, 0.5);
        ASSERT_EQUALS(inst.get_parameter_by_id(param_id_2).value, 2);
        
        sys.release();
        
        ASSERT_FALSE(inst.set_parameters_by_ids([param_id_1, param_id_2], [0.5, 2], , error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
    });
    
    suite.add_test("get_parameter_by_name", function() {
        var error = new FmlError();
        var sys = __tests_create_system(error);
        var inst = sys.get_event("event:/Coin").create_instance();
        
        {
            var value = inst.get_parameter_by_name("TestLocalParameterContinuous", , error);
            ASSERT_NO_FML_ERROR(error);
            ASSERT_EQUALS(value.value, 0);
            ASSERT_EQUALS(value.final_value, 0);
        }
        
        {
            var out_value = {};
            var value = inst.get_parameter_by_name("TestLocalParameterContinuous", out_value, error);
            ASSERT_EQUALS(value, out_value);
            ASSERT_NO_FML_ERROR(error);
            ASSERT_EQUALS(value.value, 0);
            ASSERT_EQUALS(value.final_value, 0);
        }
        
        sys.release();
        
        ASSERT_UNDEFINED(inst.get_parameter_by_name("TestLocalParameterContinuous", , error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
    });
    
    suite.add_test("set_parameter_by_name", function() {
        var error = new FmlError();
        var sys = __tests_create_system(error);
        var inst = sys.get_event("event:/Coin").create_instance();
        
        ASSERT_TRUE(inst.set_parameter_by_name("TestLocalParameterContinuous", 0.5, , error));
        ASSERT_NO_FML_ERROR(error);
        ASSERT_EQUALS(inst.get_parameter_by_name("TestLocalParameterContinuous").value, 0.5);
        
        sys.release();
        ASSERT_FALSE(inst.set_parameter_by_name("TestLocalParameterContinuous", 0, , error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
    });
    
    suite.add_test("set_parameter_by_name_with_label", function() {
        var error = new FmlError();
        var sys = __tests_create_system(error);
        var inst = sys.get_event("event:/Coin").create_instance();
        
        ASSERT_TRUE(inst.set_parameter_by_name_with_label("TestLocalParameterLabeled", "Value B", , error));
        ASSERT_NO_FML_ERROR(error);
        ASSERT_EQUALS(inst.get_parameter_by_name("TestLocalParameterLabeled").value, 1);
        
        sys.release();
        
        ASSERT_FALSE(inst.set_parameter_by_name_with_label("TestLocalParameterLabeled", "Value A", , error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
    });
    
    suite.add_test("key_off", function() {
        var error = new FmlError();
        var sys = __tests_create_system(error);
        var inst = sys.get_event("event:/Coin").create_instance();
        
        ASSERT_TRUE(inst.key_off(error));
        ASSERT_NO_FML_ERROR(error);
        
        sys.release();
        
        ASSERT_FALSE(inst.key_off(error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
    });
    
    suite.add_test("get_cpu_usage", function() {
        var error = new FmlError();
        var sys = __tests_create_system(error);
        var inst = sys.get_event("event:/Coin").create_instance();
        
        {
            var usage = inst.get_cpu_usage(, error);
            ASSERT_NO_FML_ERROR(error);
            ASSERT_DEFINED(usage.exclusive);
            ASSERT_DEFINED(usage.inclusive);
        }
        {
            var out_usage = {};
            var usage = inst.get_cpu_usage(out_usage, error);
            ASSERT_EQUALS(usage, out_usage);
            ASSERT_NO_FML_ERROR(error);
            ASSERT_DEFINED(usage.exclusive);
            ASSERT_DEFINED(usage.inclusive);
        }
        
        sys.release();
        
        ASSERT_UNDEFINED(inst.get_cpu_usage(, error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
    });
    
    suite.add_test("get_memory_usage", function() {
        var error = new FmlError();
        var sys = __tests_create_system(error);
        var inst = sys.get_event("event:/Coin").create_instance();
        
        {
            var usage = inst.get_memory_usage(, error);
            ASSERT_NO_FML_ERROR(error);
            ASSERT_DEFINED(usage.exclusive);
            ASSERT_DEFINED(usage.inclusive);
            ASSERT_DEFINED(usage.sampledata);
        }
        {
            var out_usage = {};
            var usage = inst.get_memory_usage(out_usage, error);
            ASSERT_EQUALS(usage, out_usage);
            ASSERT_DEFINED(usage.exclusive);
            ASSERT_DEFINED(usage.inclusive);
            ASSERT_DEFINED(usage.sampledata);
        }
        
        sys.release();
        
        ASSERT_UNDEFINED(inst.get_memory_usage(, error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
    });
    
    suite.add_test("set_callback", function() {
        
        var error = new FmlError();
        var sys = FmodStudioSystem_Create();
        sys.initialize(1024, FMOD_STUDIO_INIT_NORMAL | FMOD_STUDIO_INIT_SYNCHRONOUS_UPDATE, FMOD_INIT_NORMAL);
        
        ASSERT_DEFINED(sys.load_bank_file(__TESTS_FILE_MASTER_STRINGS_BANK, FMOD_STUDIO_LOAD_BANK_NORMAL));
        ASSERT_DEFINED(sys.load_bank_file(__TESTS_FILE_MASTER_BANK, FMOD_STUDIO_LOAD_BANK_NORMAL));
        
        var event = sys.get_event("event:/Coin");
        
        // Store the data of each occurred callback into an array so that we can check
        // them afterwards and see if they hold the data we expect.
        var capture = {
            callback_parameters: [],
        };
        var event_callback = method(capture, function(type/*: int*/, event_instance_index/*: int*/, parameters/*: any*/) {
            array_push(callback_parameters, {
                type: type,
                event_instance_index: event_instance_index,
                parameters: parameters,
                is_instance_callback: false,
            });
        });
        ASSERT_TRUE(event.set_callback(event_callback, FMOD_STUDIO_EVENT_CALLBACK_STARTING, error));
        ASSERT_NO_FML_ERROR(error);
        
        var instance1 = event.create_instance();
        var instance2 = event.create_instance();
        
        var instance_callback = method(capture, function(type/*: int*/, event_instance_index/*: int*/, parameters/*: any*/) {
            array_push(callback_parameters, {
                type: type,
                event_instance_index: event_instance_index,
                parameters: parameters,
                is_instance_callback: true,
            });
        });
        ASSERT_TRUE(instance1.set_callback(instance_callback, FMOD_STUDIO_EVENT_CALLBACK_STARTING));
        ASSERT_NO_FML_ERROR(error);
        
        instance1.start();
        instance2.start();
        
        sys.update();
        array_resize(capture.callback_parameters, 0);
        fml_update_callbacks();
        
        ASSERT_EQUALS(array_length(capture.callback_parameters), 2);
        ASSERT_EQUALS(capture.callback_parameters[@ 0].type, FMOD_STUDIO_EVENT_CALLBACK_STARTING);
        ASSERT_EQUALS(capture.callback_parameters[@ 0].event_instance_index, instance1.event_instance_index);
        ASSERT_EQUALS(capture.callback_parameters[@ 0].parameters, undefined);
        ASSERT_EQUALS(capture.callback_parameters[@ 0].is_instance_callback, true);
        ASSERT_EQUALS(capture.callback_parameters[@ 1].type, FMOD_STUDIO_EVENT_CALLBACK_STARTING);
        ASSERT_EQUALS(capture.callback_parameters[@ 1].event_instance_index, instance2.event_instance_index);
        ASSERT_EQUALS(capture.callback_parameters[@ 1].parameters, undefined);
        ASSERT_EQUALS(capture.callback_parameters[@ 1].is_instance_callback, false);
        
        sys.release();
        
        ASSERT_FALSE(instance1.set_callback(instance_callback, FMOD_STUDIO_EVENT_CALLBACK_CREATED, error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
        
    });
    
    suite.add_test("get_user_data", function() { return "TODO"; });
    suite.add_test("set_user_data", function() { return "TODO"; });
    
    return suite;
}
