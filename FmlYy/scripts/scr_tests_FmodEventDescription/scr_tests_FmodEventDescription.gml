
/// @returns {TestSuite}
function make_test_suite_FmodEventDescription()
{
    var suite = new TestSuite("FmodEventDescription");
    suite.is_implemented_func = function(test_name) {
        return variable_struct_exists(new FmodEventDescription(), test_name);
    };
    
    suite.add_test("is_valid", function() {
        var error = new FmlError();
        var sys = __tests_create_system(error);
        var event = sys.get_event("event:/Coin");
        ASSERT_TRUE(event.is_valid());
        sys.release();
        ASSERT_FALSE(event.is_valid());
    });
    
    suite.add_test("get_id", function() {
        var error = new FmlError();
        var sys = __tests_create_system(error);
        var event = sys.get_event("event:/Coin");
        ASSERT_EQUALS(event.get_id(, error).toString(), "{5a16ea05-c43a-4b14-9997-aba63c4e5c1f}");
        ASSERT_NO_FML_ERROR(error);
        sys.release();
        ASSERT_UNDEFINED(event.get_id(, error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
    });
    
    suite.add_test("get_path", function() {
        var error = new FmlError();
        var sys = __tests_create_system(error);
        var event = sys.get_event("event:/Coin");
        ASSERT_EQUALS(event.get_path(error), "event:/Coin");
        ASSERT_NO_FML_ERROR(error);
        sys.release();
        ASSERT_UNDEFINED(event.get_path(error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
    });
    
    suite.add_test("get_parameter_description_count", function() {
        
        var error = new FmlError();
        var sys = __tests_create_system(error);
        var event = sys.get_event("event:/Coin");
        
        ASSERT_EQUALS(event.get_parameter_description_count(error), 2);
        ASSERT_NO_FML_ERROR(error);
        
        sys.release();
        
        ASSERT_UNDEFINED(event.get_parameter_description_count(error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
    });
    
    suite.add_test("get_parameter_description_by_index", function() {
        
        var error = new FmlError();
        var sys = __tests_create_system(error);
        var event = sys.get_event("event:/Coin");
        
        {
            var desc = event.get_parameter_description_by_index(0, , error);
            ASSERT_NO_FML_ERROR(error);
            ASSERT_EQUALS(desc.name, "TestLocalParameterContinuous");
        }
        {
            var out_desc = new FMOD_STUDIO_PARAMETER_DESCRIPTION();
            var desc = event.get_parameter_description_by_index(0, out_desc, error);
            ASSERT_EQUALS(desc, out_desc);
            ASSERT_NO_FML_ERROR(error);
            ASSERT_EQUALS(desc.name, "TestLocalParameterContinuous");
        }
        
        sys.release();
        
        ASSERT_UNDEFINED(event.get_parameter_description_by_index(0, , error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
    });
    
    suite.add_test("get_parameter_description_by_name", function() {
        
        var error = new FmlError();
        var sys = __tests_create_system(error);
        var event = sys.get_event("event:/Coin");
        
        {
            var desc = event.get_parameter_description_by_name("TestLocalParameterContinuous", , error);
            ASSERT_NO_FML_ERROR(error);
            ASSERT_EQUALS(desc.guid.toString(), "{f23ac419-0e28-4446-969c-ffbe5be22eb3}");
        }
        {
            var out_desc = new FMOD_STUDIO_PARAMETER_DESCRIPTION();
            var desc = event.get_parameter_description_by_name("TestLocalParameterContinuous", out_desc, error);
            ASSERT_EQUALS(desc, out_desc);
            ASSERT_NO_FML_ERROR(error);
            ASSERT_EQUALS(desc.guid.toString(), "{f23ac419-0e28-4446-969c-ffbe5be22eb3}");
        }
        
        sys.release();
        
        ASSERT_UNDEFINED(event.get_parameter_description_by_name("TestLocalParameterContinuous", , error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
    });
    
    suite.add_test("get_parameter_description_by_id", function() {
        
        var error = new FmlError();
        var sys = __tests_create_system(error);
        var event = sys.get_event("event:/Coin");
        
        var param_id = new FMOD_STUDIO_PARAMETER_ID();
        param_id.data1 = 2705762729; // TestLocalParameterContinuous
        param_id.data2 = 3396002376;
        
        {
            var desc = event.get_parameter_description_by_id(param_id, , error);
            ASSERT_NO_FML_ERROR(error);
            ASSERT_EQUALS(desc.guid.toString(), "{f23ac419-0e28-4446-969c-ffbe5be22eb3}");
        }
        {
            var out_desc = new FMOD_STUDIO_PARAMETER_DESCRIPTION();
            var desc = event.get_parameter_description_by_id(param_id, out_desc, error);
            ASSERT_EQUALS(desc, out_desc);
            ASSERT_NO_FML_ERROR(error);
            ASSERT_EQUALS(desc.guid.toString(), "{f23ac419-0e28-4446-969c-ffbe5be22eb3}");
        }
        
        sys.release();
        
        ASSERT_UNDEFINED(event.get_parameter_description_by_id(param_id, , error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
    });
    
    suite.add_test("get_parameter_label_by_index", function() {
        
        var error = new FmlError();
        var sys = __tests_create_system(error);
        var event = sys.get_event("event:/Coin");
        
        ASSERT_EQUALS(event.get_parameter_label_by_index(1, 0, error), "Value A");
        ASSERT_NO_FML_ERROR(error);
        ASSERT_EQUALS(event.get_parameter_label_by_index(1, 1, error), "Value B");
        ASSERT_NO_FML_ERROR(error);
        ASSERT_EQUALS(event.get_parameter_label_by_index(1, 2, error), "Value C");
        ASSERT_NO_FML_ERROR(error);
        
        sys.release();
        
        ASSERT_UNDEFINED(event.get_parameter_label_by_index(0, 0, error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
    });
    
    suite.add_test("get_parameter_label_by_name", function() {
        
        var error = new FmlError();
        var sys = __tests_create_system(error);
        var event = sys.get_event("event:/Coin");
        
        var name = "TestLocalParameterLabeled";
        ASSERT_EQUALS(event.get_parameter_label_by_name(name, 0, error), "Value A");
        ASSERT_NO_FML_ERROR(error);
        ASSERT_EQUALS(event.get_parameter_label_by_name(name, 1, error), "Value B");
        ASSERT_NO_FML_ERROR(error);
        ASSERT_EQUALS(event.get_parameter_label_by_name(name, 2, error), "Value C");
        ASSERT_NO_FML_ERROR(error);
        
        sys.release();
        
        ASSERT_UNDEFINED(event.get_parameter_label_by_name(name, 0, error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
    });
    
    suite.add_test("get_parameter_label_by_id", function() {
        
        var error = new FmlError();
        var sys = __tests_create_system(error);
        var event = sys.get_event("event:/Coin");
        
        var param_id = new FMOD_STUDIO_PARAMETER_ID();
        param_id.data1 = 3991529614; // TestLocalParameterLabeled
        param_id.data2 = 3327628025;
        
        ASSERT_EQUALS(event.get_parameter_label_by_id(param_id, 0, error), "Value A");
        ASSERT_NO_FML_ERROR(error);
        ASSERT_EQUALS(event.get_parameter_label_by_id(param_id, 1, error), "Value B");
        ASSERT_NO_FML_ERROR(error);
        ASSERT_EQUALS(event.get_parameter_label_by_id(param_id, 2, error), "Value C");
        ASSERT_NO_FML_ERROR(error);
        
        sys.release();
        
        ASSERT_UNDEFINED(event.get_parameter_label_by_id(param_id, 0, error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
    });
    
    suite.add_test("get_user_property_count", function() {
        
        var error = new FmlError();
        var sys = __tests_create_system(error);
        var event = sys.get_event("event:/Coin");
        
        ASSERT_EQUALS(event.get_user_property_count(error) ,2);
        ASSERT_NO_FML_ERROR(error);
        
        sys.release();
        
        ASSERT_UNDEFINED(event.get_user_property_count(error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
    });
    
    suite.add_test("get_user_property_by_index", function() {
        var error = new FmlError();
        var sys = __tests_create_system(error);
        var event = sys.get_event("event:/Coin");
        
        {
            var prop = event.get_user_property_by_index(1, , error);
            ASSERT_NO_FML_ERROR(error);
            ASSERT_EQUALS(prop.name, "StringProp");
            ASSERT_EQUALS(prop.type, FMOD_STUDIO_USER_PROPERTY_TYPE.STRING);
            ASSERT_EQUALS(prop.value, "asd");
        }
        {
            var out_prop = new FMOD_STUDIO_USER_PROPERTY();
            var prop = event.get_user_property_by_index(1, out_prop, error);
            ASSERT_EQUALS(prop, out_prop);
            ASSERT_NO_FML_ERROR(error);
            ASSERT_EQUALS(prop.name, "StringProp");
            ASSERT_EQUALS(prop.type, FMOD_STUDIO_USER_PROPERTY_TYPE.STRING);
            ASSERT_EQUALS(prop.value, "asd");
        }
        
        sys.release();
        
        ASSERT_UNDEFINED(event.get_user_property_by_index(1, , error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
    });
    
    suite.add_test("get_user_property", function() {
        
        var error = new FmlError();
        var sys = __tests_create_system(error);
        var event = sys.get_event("event:/Coin");
        
        var string_prop = event.get_user_property("StringProp", , error);
        ASSERT_NO_FML_ERROR(error);
        ASSERT_EQUALS(string_prop.name, "StringProp");
        ASSERT_EQUALS(string_prop.type, FMOD_STUDIO_USER_PROPERTY_TYPE.STRING);
        ASSERT_EQUALS(string_prop.value, "asd");
        
        var out_float_prop = new FMOD_STUDIO_USER_PROPERTY();
        var float_prop = event.get_user_property("FloatProp", out_float_prop, error);
        ASSERT_EQUALS(float_prop, out_float_prop);
        ASSERT_NO_FML_ERROR(error);
        ASSERT_EQUALS(float_prop.name, "FloatProp");
        ASSERT_EQUALS(float_prop.type, FMOD_STUDIO_USER_PROPERTY_TYPE.FLOAT);
        ASSERT_EQUALS(float_prop.value, 1.23);
        
        sys.release();
        
        ASSERT_UNDEFINED(event.get_user_property("StringProp", , error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
    });
    
    suite.add_test("get_length", function() {
        
        var error = new FmlError();
        var sys = __tests_create_system(error);
        var event = sys.get_event("event:/Coin");
        
        ASSERT_EQUALS(event.get_length(error), 207);
        ASSERT_NO_FML_ERROR(error);
        
        sys.release();
        
        ASSERT_UNDEFINED(event.get_length(error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
    });
    
    suite.add_test("get_min_max_distance", function() {
        var error = new FmlError();
        var sys = __tests_create_system(error);
        var event = sys.get_event("event:/Coin");
        
        {
            var dis = event.get_min_max_distance(, error);
            ASSERT_NO_FML_ERROR(error);
            ASSERT_DEFINED(dis);
            ASSERT_EQUALS(dis.min, 1);
            ASSERT_EQUALS(dis.max, 20);
        }
        {
            var out_dis = {};
            var dis = event.get_min_max_distance(out_dis, error);
            ASSERT_EQUALS(dis, out_dis);
            ASSERT_NO_FML_ERROR(error);
            ASSERT_DEFINED(dis);
            ASSERT_EQUALS(dis.min, 1);
            ASSERT_EQUALS(dis.max, 20);
        }
        
        sys.release();
        
        ASSERT_UNDEFINED(event.get_min_max_distance(, error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
    });
    
    suite.add_test("get_sound_size", function() {
        var error = new FmlError();
        var sys = __tests_create_system(error);
        var event = sys.get_event("event:/Coin");
        
        ASSERT_EQUALS(event.get_sound_size(error), 0);
        ASSERT_NO_FML_ERROR(error);
        
        sys.release();
        
        ASSERT_UNDEFINED(event.get_sound_size(error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
    });
    
    suite.add_test("is_snapshot", function() {
        var error = new FmlError();
        var sys = __tests_create_system(error);
        var event = sys.get_event("event:/Coin");
        ASSERT_EQUALS(event.is_snapshot(error), false);
        ASSERT_NO_FML_ERROR(error);
        sys.release();
        ASSERT_UNDEFINED(event.is_snapshot(error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
    });
    
    suite.add_test("is_oneshot", function() {
        var error = new FmlError();
        var sys = __tests_create_system(error);
        var event = sys.get_event("event:/Coin");
        ASSERT_EQUALS(event.is_oneshot(error), false);
        ASSERT_NO_FML_ERROR(error);
        sys.release();
        ASSERT_UNDEFINED(event.is_oneshot(error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
    });
    
    suite.add_test("is_stream", function() {
        var error = new FmlError();
        var sys = __tests_create_system(error);
        var event = sys.get_event("event:/Coin");
        ASSERT_EQUALS(event.is_stream(error), false);
        ASSERT_NO_FML_ERROR(error);
        sys.release();
        ASSERT_UNDEFINED(event.is_stream(error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
    });
    
    suite.add_test("is_3d", function() {
        var error = new FmlError();
        var sys = __tests_create_system(error);
        var event = sys.get_event("event:/Coin");
        ASSERT_EQUALS(event.is_3d(error), false);
        ASSERT_NO_FML_ERROR(error);
        sys.release();
        ASSERT_UNDEFINED(event.is_3d(error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
    });
    
    suite.add_test("is_doppler_enabled", function() {
        var error = new FmlError();
        var sys = __tests_create_system(error);
        var event = sys.get_event("event:/Coin");
        ASSERT_EQUALS(event.is_doppler_enabled(error), false);
        ASSERT_NO_FML_ERROR(error);
        sys.release();
        ASSERT_UNDEFINED(event.is_doppler_enabled(error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
    });
    
    suite.add_test("has_sustain_point", function() {
        var error = new FmlError();
        var sys = __tests_create_system(error);
        var event = sys.get_event("event:/Coin");
        ASSERT_EQUALS(event.has_sustain_point(error), true);
        ASSERT_NO_FML_ERROR(error);
        sys.release();
        ASSERT_UNDEFINED(event.has_sustain_point(error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
    });
    
    suite.add_test("create_instance", function() {
        var error = new FmlError();
        var sys = __tests_create_system(error);
        var event = sys.get_event("event:/Coin");
        
        {
            var inst = event.create_instance(, error);
            ASSERT_NO_FML_ERROR(error);
            ASSERT_EQUALS(inst.get_description().event_description_index, event.event_description_index);
        }
        {
            var out_inst = new FmodEventInstance();
            var inst = event.create_instance(out_inst, error);
            ASSERT_EQUALS(inst, out_inst);
            ASSERT_NO_FML_ERROR(error);
            ASSERT_EQUALS(inst.get_description().event_description_index, event.event_description_index);
        }
        
        sys.release();
        
        ASSERT_UNDEFINED(event.create_instance(, error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
    });
    
    suite.add_test("get_instance_count", function() {
        var error = new FmlError();
        var sys = __tests_create_system(error);
        var event = sys.get_event("event:/Coin");
        
        ASSERT_EQUALS(event.get_instance_count(error), 0);
        ASSERT_NO_FML_ERROR(error);
        repeat (3) {
            event.create_instance();
        }
        ASSERT_EQUALS(event.get_instance_count(error), 3);
        ASSERT_NO_FML_ERROR(error);
        
        sys.release();
        
        ASSERT_UNDEFINED(event.get_instance_count(error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
    });
    
    suite.add_test("get_instance_list", function() {
        var error = new FmlError();
        var sys = __tests_create_system(error);
        var event = sys.get_event("event:/Coin");
        
        ASSERT_ARRAY_DEEP_EQUALS(event.get_instance_list(error), []);
        ASSERT_NO_FML_ERROR(error);
        
        var original_events = [
            event.create_instance(),
            event.create_instance(),
            event.create_instance()
        ];
        
        var returned_events = event.get_instance_list(error);
        ASSERT_NO_FML_ERROR(error);
        
        array_sort(original_events, function(e1, e2) { return e2.event_instance_index - e1.event_instance_index; });
        array_sort(returned_events, function(e1, e2) { return e2.event_instance_index - e1.event_instance_index; });
        
        ASSERT_ARRAY_DEEP_EQUALS(returned_events, original_events);
        
        sys.release();
        
        ASSERT_UNDEFINED(event.get_instance_list(error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
    });
    
    suite.add_test("load_sample_data", function() {
        var error = new FmlError();
        var sys = __tests_create_system(error);
        var event = sys.get_event("event:/Coin");
        
        ASSERT_EQUALS(event.get_sample_loading_state(), FMOD_STUDIO_LOADING_STATE.UNLOADED);
        
        ASSERT_TRUE(event.load_sample_data(error));
        ASSERT_NO_FML_ERROR(error);
        
        ASSERT_EQUALS(event.get_sample_loading_state(), FMOD_STUDIO_LOADING_STATE.LOADING);
        
        sys.release();
        
        ASSERT_FALSE(event.load_sample_data(error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
    });
    
    suite.add_test("unload_sample_data", function() {
        var error = new FmlError();
        var sys = __tests_create_system(error);
        var event = sys.get_event("event:/Coin");
        
        event.load_sample_data();
        
        ASSERT_EQUALS(event.get_sample_loading_state(), FMOD_STUDIO_LOADING_STATE.LOADING);
        
        ASSERT_TRUE(event.unload_sample_data(error));
        ASSERT_NO_FML_ERROR(error);
        
        ASSERT_EQUALS(event.get_sample_loading_state(), FMOD_STUDIO_LOADING_STATE.UNLOADED);
        
        sys.release();
        
        ASSERT_FALSE(event.unload_sample_data(error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
    });
    
    suite.add_test("get_sample_loading_state", function() {
        var error = new FmlError();
        var sys = __tests_create_system(error);
        var event = sys.get_event("event:/Coin");
        
        ASSERT_EQUALS(event.get_sample_loading_state(error), FMOD_STUDIO_LOADING_STATE.UNLOADED);
        ASSERT_NO_FML_ERROR(error);
        
        sys.release();
        
        ASSERT_UNDEFINED(event.get_sample_loading_state(error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
    });
    
    suite.add_test("release_all_instances", function() {
        var error = new FmlError();
        var sys = __tests_create_system(error, FMOD_STUDIO_INIT_SYNCHRONOUS_UPDATE);
        var event = sys.get_event("event:/Coin");
        
        var instances = [
            event.create_instance(),
            event.create_instance(),
            event.create_instance(),
        ];
        
        ASSERT_TRUE(event.release_all_instances(error));
        ASSERT_NO_FML_ERROR(error);
        
        sys.update();
        
        for (var i = 0; i < array_length(instances); ++i) {
            ASSERT_FALSE(instances[@ i].is_valid());
        }
        
        sys.release();
        
        ASSERT_FALSE(event.release_all_instances(error));
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
        var callback = method(capture, function(type/*: int*/, event_instance_index/*: int*/, parameters/*: any*/) {
            array_push(callback_parameters, {
                type: type,
                event_instance_index: event_instance_index,
                parameters: parameters,
            });
        });
        ASSERT_TRUE(event.set_callback(callback, FMOD_STUDIO_EVENT_CALLBACK_CREATED, error));
        ASSERT_NO_FML_ERROR(error);
        
        var instance = event.create_instance();
        
        sys.update();
        fml_update_callbacks();
        
        ASSERT_EQUALS(array_length(capture.callback_parameters), 1);
        ASSERT_EQUALS(capture.callback_parameters[@ 0].type, FMOD_STUDIO_EVENT_CALLBACK_CREATED);
        ASSERT_EQUALS(capture.callback_parameters[@ 0].event_instance_index, instance.event_instance_index);
        ASSERT_EQUALS(capture.callback_parameters[@ 0].parameters, undefined);
        
        sys.release();
        
        ASSERT_FALSE(event.set_callback(callback, FMOD_STUDIO_EVENT_CALLBACK_CREATED, error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
    });
    
    suite.add_test("get_user_data", function() { return "TODO"; });
    suite.add_test("set_user_data", function() { return "TODO"; });
    
    return suite;
}
