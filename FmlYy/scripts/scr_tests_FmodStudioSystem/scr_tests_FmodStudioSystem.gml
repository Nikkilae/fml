
/// Creates a parameter ID that doesn't exist yet in the given system.
/// It has random non-zero values for data1 and data2 instead of just zeroes, because
/// an all zeroes ID has special meaning in some of the FMOD API and we specifically
/// don't want to run into those cases.
/// @param {FmodStudioSystem} system
/// @returns {FMOD_STUDIO_PARAMETER_ID}
function __tests_sys_get_nonexistent_param_id(system)
{
    var param_id = new FMOD_STUDIO_PARAMETER_ID();
    repeat (1000) {
        param_id.data1 = irandom_range(1, power(2, 32));
        param_id.data2 = irandom_range(1, power(2, 32));
        if (system.get_parameter_description_by_id(param_id) == undefined) {
            return param_id;
        }
    }
    return undefined;
}

/// Creates a GUID that doesn't exist yet in the given system.
/// It has random non-zero values for data1 and data2 instead of just zeroes, because
/// an all zeroes ID has special meaning in some of the FMOD API and we specifically
/// don't want to run into those cases.
/// @param {FmodStudioSystem} system
/// @returns {FMOD_GUID}
function __tests_sys_get_nonexistent_guid(system)
{
    var guid = new FMOD_GUID();
    repeat (1000) {
        guid.Data1 = irandom_range(1, power(2, 32));
        guid.Data2 = irandom_range(1, power(2, 16));
        guid.Data3 = irandom_range(1, power(2, 16));
        for (var i = 0; i < 8; ++i) {
            guid.Data4[@ i] = irandom_range(1, power(2, 8));
        }
        if (system.lookup_path(guid) == undefined) {
            return guid;
        }
    }
    return undefined;
}

/// @param {FmodBank} bank
function __check_loaded_bank(bank)
{
    var error = new FmlError();
    
    ASSERT_NO_FML_ERROR(error);
    ASSERT_DEFINED(bank);
    var events = bank.get_event_list();
    var numEvents = array_length(events);
    ASSERT_EQUALS(numEvents, 4);
    var paths = array_create(numEvents);
    for (var i = 0; i < numEvents; ++i) {
        paths[@ i] = events[@ i].get_path();
    }
    array_sort(paths, true);
    ASSERT_EQUALS(paths[@ 0], "event:/Beats");
    ASSERT_EQUALS(paths[@ 1], "event:/Coin");
    ASSERT_EQUALS(paths[@ 2], "event:/Explosion");
    ASSERT_EQUALS(paths[@ 3], "event:/Jump");
}

/// @returns {TestSuite}
function make_test_suite_FmodStudioSystem()
{
    var suite = new TestSuite("FmodStudioSystem");
    suite.is_implemented_func = function(test_name) {
        return variable_struct_exists(new FmodStudioSystem(), test_name);
    };
    
    suite.add_test("create", function() {
        var error = new FmlError();
        
        var sys_1 = FmodStudioSystem_Create(, , error);
        ASSERT_NOT_EQUALS(sys_1, undefined);
        ASSERT_TRUE(sys_1.studio_system_index >= 1);
        ASSERT_TRUE(sys_1.is_valid());
        ASSERT_NO_FML_ERROR(error);
        
        var sys_2 = FmodStudioSystem_Create(, , error);
        ASSERT_NOT_EQUALS(sys_2, undefined);
        ASSERT_TRUE(sys_2.studio_system_index >= 1);
        ASSERT_TRUE(sys_2.is_valid());
        ASSERT_NOT_EQUALS(sys_1.studio_system_index, sys_2.studio_system_index);
        ASSERT_NO_FML_ERROR(error);
        sys_2.release();
        
        var out_sys = new FmodStudioSystem();
        var sys_3 = FmodStudioSystem_Create(, out_sys, error);
        ASSERT_EQUALS(sys_3, out_sys);
        ASSERT_NOT_EQUALS(sys_3, undefined);
        ASSERT_TRUE(sys_3.studio_system_index >= 1);
        ASSERT_TRUE(sys_3.is_valid());
        ASSERT_NOT_EQUALS(sys_1.studio_system_index, sys_3.studio_system_index);
        ASSERT_NO_FML_ERROR(error);
        sys_3.release();
        
        var sys_4 = FmodStudioSystem_Create(FMOD_VERSION, , error);
        ASSERT_NO_FML_ERROR(error);
        ASSERT_TRUE(sys_4.is_valid());
        sys_4.release();
        
        var v_product = fml_fmod_version_get_product(FMOD_VERSION);
        var v_major = fml_fmod_version_get_major(FMOD_VERSION);
        var v_minor = fml_fmod_version_get_minor(FMOD_VERSION);
        ASSERT_UNDEFINED(FmodStudioSystem_Create(0, , error));
        ASSERT_FML_ERROR(error, FML_RESULT.HEADER_MISMATCH);
        ASSERT_UNDEFINED(FmodStudioSystem_Create(fml_fmod_version_from_parts(v_product, v_major + 1, v_minor), , error));
        ASSERT_FML_ERROR(error, FML_RESULT.HEADER_MISMATCH);
        
        sys_1.release();
    });
    
    suite.add_test("set_advanced_settings", function() {
        
        var error = new FmlError();
        var sys = FmodStudioSystem_Create(, , error);
        
        var new_settings = new FMOD_STUDIO_ADVANCEDSETTINGS();
        new_settings.commandqueuesize = 1024; // 1024 seems to be the smallest possible value
        new_settings.handleinitialsize = 2;
        new_settings.studioupdateperiod = 3;
        new_settings.idlesampledatapoolsize = 4;
        new_settings.streamingscheduledelay = 5;
        new_settings.encryptionkey = "";
        
        ASSERT_TRUE(sys.set_advanced_settings(new_settings, error));
        ASSERT_NO_FML_ERROR(error);
        
        var settings = sys.get_advanced_settings();
        ASSERT_EQUALS(settings.commandqueuesize, 1024);
        ASSERT_EQUALS(settings.handleinitialsize, 2);
        ASSERT_EQUALS(settings.studioupdateperiod, 3);
        ASSERT_EQUALS(settings.idlesampledatapoolsize, 4);
        ASSERT_EQUALS(settings.streamingscheduledelay, 5);
        ASSERT_EQUALS(settings.encryptionkey, "");
        
        sys.initialize(1024, FMOD_STUDIO_INIT_NORMAL, FMOD_INIT_NORMAL);
        
        ASSERT_FALSE(sys.set_advanced_settings(new_settings, error));
        ASSERT_FML_ERROR(error, FML_RESULT.UNSUPPORTED);
        
        sys.release();
    });
    
    suite.add_test("get_advanced_settings", function() {
        
        var error = new FmlError();
        var sys = FmodStudioSystem_Create(, , error);
        
        {
            var settings = sys.get_advanced_settings(, error);
            ASSERT_NO_FML_ERROR(error);
            // Check for default values as defined in the FMOD API docs.
            ASSERT_EQUALS(settings.commandqueuesize, 32768);
            var ptr_size = __FML_UTIL_sizeOfVoidPtr();
            ASSERT_EQUALS(settings.handleinitialsize, 8192 * ptr_size);
            ASSERT_EQUALS(settings.studioupdateperiod, 20);
            ASSERT_EQUALS(settings.idlesampledatapoolsize, 262144);
            ASSERT_EQUALS(settings.streamingscheduledelay, 8192);
            ASSERT_EQUALS(settings.encryptionkey, "");
        }
        
        {
            var out_settings = new FMOD_STUDIO_ADVANCEDSETTINGS();
            var settings = sys.get_advanced_settings(out_settings, error);
            ASSERT_EQUALS(settings, out_settings);
            ASSERT_NO_FML_ERROR(error);
        }
        
        sys.release();
    });
    
    suite.add_test("initialize", function() {
        var error = new FmlError();
        var sys = FmodStudioSystem_Create();
        
        ASSERT_TRUE(sys.initialize(0, FMOD_STUDIO_INIT_NORMAL, FMOD_INIT_NORMAL, error));
        ASSERT_NO_FML_ERROR(error);
        ASSERT_FALSE(sys.initialize(0, FMOD_STUDIO_INIT_NORMAL, FMOD_INIT_NORMAL, error));
        ASSERT_FML_ERROR(error, FML_RESULT.INITIALIZED);
        
        sys.release();
    });
    
    suite.add_test("release", function() {
        var error = new FmlError();
        var sys = FmodStudioSystem_Create();
        
        ASSERT_TRUE(sys.release(error));
        ASSERT_NO_FML_ERROR(error);
        ASSERT_FALSE(sys.is_valid());
    });
    
    suite.add_test("is_valid", function() {
        var error = new FmlError();
        var sys = FmodStudioSystem_Create();
        
        ASSERT_TRUE(sys.is_valid(error));
        ASSERT_NO_FML_ERROR(error);
        sys.release();
        ASSERT_FALSE(sys.is_valid(error));
        ASSERT_NO_FML_ERROR(error);
        ASSERT_FALSE(sys.release(error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
    });
    
    suite.add_test("update", function() {
        
        var error = new FmlError();
        var sys = FmodStudioSystem_Create();
        sys.initialize(1024, FMOD_STUDIO_INIT_NORMAL, FMOD_INIT_NORMAL, error);
        
        ASSERT_TRUE(sys.update(error));
        ASSERT_NO_FML_ERROR(error);
        
        sys.release();
    });
    
    suite.add_test("flush_commands", function() { return "TODO"; });
    suite.add_test("flush_sample_loading", function() { return "TODO"; });
    
    suite.add_test("get_core_system", function() {
        
        var error = new FmlError();
        
        {
            var sys = FmodStudioSystem_Create();
            sys.release();
            var core_sys = sys.get_core_system(, error);
            ASSERT_UNDEFINED(core_sys);
            ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
        }
        
        {
            var sys = FmodStudioSystem_Create();
            {
                var core_sys = sys.get_core_system(, error);
                ASSERT_NO_FML_ERROR(error);
                ASSERT_DEFINED(core_sys);
            }
            {
                var out_core_sys = new FmodSystem();
                var core_sys = sys.get_core_system(out_core_sys, error);
                ASSERT_EQUALS(core_sys, out_core_sys);
                ASSERT_NO_FML_ERROR(error);
                ASSERT_DEFINED(core_sys);
            }
            
            sys.release();
        }
    });
    
    suite.add_test("get_event", function() {
        
        var error = new FmlError();
        var sys = __tests_create_system(error);
        
        var event1 = sys.get_event("event:/Explosion", , error);
        ASSERT_NO_FML_ERROR(error);
        ASSERT_DEFINED(event1);
        ASSERT_TRUE(event1.is_valid());
        
        var out_event = new FmodEventDescription();
        var event2 = sys.get_event("event:/Explosion", out_event, error);
        ASSERT_EQUALS(event2, out_event);
        ASSERT_NO_FML_ERROR(error);
        ASSERT_DEFINED(event2);
        ASSERT_TRUE(event2.is_valid());
        
        ASSERT_UNDEFINED(sys.get_event("event that doesn't exist", , error));
        ASSERT_FML_ERROR(error, FML_RESULT.EVENT_NOTFOUND);
        
        sys.release();
    });
    
    suite.add_test("get_bus", function() {
        
        var error = new FmlError();
        var sys = __tests_create_system(error);
        
        var bus1 = sys.get_bus("bus:/Reverb", , error);
        ASSERT_NO_FML_ERROR(error);
        ASSERT_DEFINED(bus1);
        ASSERT_TRUE(bus1.is_valid());
        
        var out_bus = new FmodBus();
        var bus2 = sys.get_bus("bus:/Reverb", out_bus, error);
        ASSERT_EQUALS(bus2, out_bus);
        ASSERT_NO_FML_ERROR(error);
        ASSERT_DEFINED(bus2);
        ASSERT_TRUE(bus2.is_valid());
        
        ASSERT_UNDEFINED(sys.get_bus("bus that doesn't exist", , error));
        ASSERT_FML_ERROR(error, FML_RESULT.EVENT_NOTFOUND);
        
        sys.release();
    });
    
    suite.add_test("get_vca", function() {
        
        var error = new FmlError();
        var sys = __tests_create_system(error);
        
        var vca1 = sys.get_vca("vca:/TestVca", , error);
        ASSERT_NO_FML_ERROR(error);
        ASSERT_DEFINED(vca1);
        ASSERT_TRUE(vca1.is_valid());
        
        var out_vca = new FmodVca();
        var vca2 = sys.get_vca("vca:/TestVca", out_vca, error);
        ASSERT_EQUALS(vca2, out_vca);
        ASSERT_NO_FML_ERROR(error);
        ASSERT_DEFINED(vca2);
        ASSERT_TRUE(vca2.is_valid());
        
        ASSERT_UNDEFINED(sys.get_vca("vca that doesn't exist", , error));
        ASSERT_FML_ERROR(error, FML_RESULT.EVENT_NOTFOUND);
        
        sys.release();
    });
    
    suite.add_test("get_bank", function() {
        
        var error = new FmlError();
        var sys = __tests_create_system(error);
        
        var bank1 = sys.get_bank("bank:/Master", , error);
        ASSERT_NO_FML_ERROR(error);
        ASSERT_DEFINED(bank1);
        ASSERT_TRUE(bank1.is_valid());
        
        var out_bank = new FmodBank();
        var bank2 = sys.get_bank("bank:/Master", out_bank, error);
        ASSERT_EQUALS(bank2, out_bank);
        ASSERT_NO_FML_ERROR(error);
        ASSERT_DEFINED(bank2);
        ASSERT_TRUE(bank2.is_valid());
        
        ASSERT_UNDEFINED(sys.get_bank("bank that doesn't exist", , error));
        ASSERT_FML_ERROR(error, FML_RESULT.EVENT_NOTFOUND);
        
        sys.release();
    });
    
    suite.add_test("get_event_by_id", function() {
        
        var error = new FmlError();
        var sys = __tests_create_system(error);
        
        var event1 = sys.get_event_by_id(FMOD_GUID_from_string("{03f6740d-f6e7-4285-b772-7a319bfd04fb}"), , error);
        ASSERT_NO_FML_ERROR(error);
        ASSERT_DEFINED(event1);
        ASSERT_TRUE(event1.is_valid());
        
        var out_event = new FmodEventDescription();
        var event2 = sys.get_event_by_id(FMOD_GUID_from_string("{03f6740d-f6e7-4285-b772-7a319bfd04fb}"), out_event, error);
        ASSERT_EQUALS(event2, out_event);
        ASSERT_NO_FML_ERROR(error);
        ASSERT_DEFINED(event2);
        ASSERT_TRUE(event2.is_valid());
        
        ASSERT_UNDEFINED(sys.get_event_by_id(__tests_sys_get_nonexistent_guid(sys), , error));
        ASSERT_FML_ERROR(error, FML_RESULT.EVENT_NOTFOUND);
        
        sys.release();
    });
    
    suite.add_test("get_bus_by_id", function() {
        
        var error = new FmlError();
        var sys = __tests_create_system(error);
        
        var bus1 = sys.get_bus_by_id(FMOD_GUID_from_string("{e6a6d70c-cac4-4ef4-be2b-d9004d7d80dc}"), , error);
        ASSERT_NO_FML_ERROR(error);
        ASSERT_DEFINED(bus1);
        ASSERT_TRUE(bus1.is_valid());
        
        var out_bus = new FmodBus();
        var bus2 = sys.get_bus_by_id(FMOD_GUID_from_string("{e6a6d70c-cac4-4ef4-be2b-d9004d7d80dc}"), out_bus, error);
        ASSERT_EQUALS(bus2, out_bus);
        ASSERT_NO_FML_ERROR(error);
        ASSERT_DEFINED(bus2);
        ASSERT_TRUE(bus2.is_valid());
        
        ASSERT_UNDEFINED(sys.get_bus_by_id(__tests_sys_get_nonexistent_guid(sys), , error));
        ASSERT_FML_ERROR(error, FML_RESULT.EVENT_NOTFOUND);
        
        sys.release();
    });
    
    suite.add_test("get_vca_by_id", function() {
        
        var error = new FmlError();
        var sys = __tests_create_system(error);
        
        var vca1 = sys.get_vca_by_id(FMOD_GUID_from_string("{a3cc2199-6255-49e3-bd77-cff33e72eaac}"), , error);
        ASSERT_NO_FML_ERROR(error);
        ASSERT_DEFINED(vca1);
        ASSERT_TRUE(vca1.is_valid());
        
        var out_vca = new FmodVca();
        var vca2 = sys.get_vca_by_id(FMOD_GUID_from_string("{a3cc2199-6255-49e3-bd77-cff33e72eaac}"), out_vca, error);
        ASSERT_EQUALS(vca2, out_vca);
        ASSERT_NO_FML_ERROR(error);
        ASSERT_DEFINED(vca2);
        ASSERT_TRUE(vca2.is_valid());
        
        ASSERT_UNDEFINED(sys.get_vca_by_id(__tests_sys_get_nonexistent_guid(sys), , error));
        ASSERT_FML_ERROR(error, FML_RESULT.EVENT_NOTFOUND);
        
        sys.release();
    });
    
    suite.add_test("get_bank_by_id", function() {
        
        var error = new FmlError();
        var sys = __tests_create_system(error);
        
        var bank1 = sys.get_bank_by_id(FMOD_GUID_from_string("{8f43fe09-20eb-4353-b68a-f572b3da81ad}"), , error);
        ASSERT_NO_FML_ERROR(error);
        ASSERT_DEFINED(bank1);
        ASSERT_TRUE(bank1.is_valid());
        
        var out_bank = new FmodBank();
        var bank2 = sys.get_bank_by_id(FMOD_GUID_from_string("{8f43fe09-20eb-4353-b68a-f572b3da81ad}"), out_bank, error);
        ASSERT_EQUALS(bank2, out_bank);
        ASSERT_NO_FML_ERROR(error);
        ASSERT_DEFINED(bank2);
        ASSERT_TRUE(bank2.is_valid());
        
        ASSERT_UNDEFINED(sys.get_bank_by_id(__tests_sys_get_nonexistent_guid(sys), , error));
        ASSERT_FML_ERROR(error, FML_RESULT.EVENT_NOTFOUND);
        
        sys.release();
    });
    
    
    suite.add_test("get_sound_info", function() { return "TODO"; });
    
    suite.add_test("get_parameter_description_by_name", function() {
        
        var error = new FmlError();
        var sys = __tests_create_system(error);
        
        {
            var param_desc = sys.get_parameter_description_by_name("TestGlobalParameterContinuous", , error);
            ASSERT_NO_FML_ERROR(error);
            ASSERT_DEFINED(param_desc);
            ASSERT_EQUALS(param_desc.id.data1, 4147700174);
            ASSERT_EQUALS(param_desc.id.data2, 3776654793);
        }
        
        {
            var out_param_desc = new FMOD_STUDIO_PARAMETER_DESCRIPTION();
            var param_desc = sys.get_parameter_description_by_name("TestGlobalParameterContinuous", out_param_desc, error);
            ASSERT_EQUALS(param_desc, out_param_desc);
            ASSERT_NO_FML_ERROR(error);
            ASSERT_DEFINED(param_desc);
        }
        
        ASSERT_UNDEFINED(sys.get_parameter_description_by_name("parameter that doesn't exist", , error));
        ASSERT_FML_ERROR(error, FML_RESULT.EVENT_NOTFOUND);
        
        sys.release();
    });
    
    suite.add_test("get_parameter_description_by_id", function() {
        
        var error = new FmlError();
        var sys = __tests_create_system(error);
        
        var param_id = new FMOD_STUDIO_PARAMETER_ID();
        param_id.data1 = 4147700174;
        param_id.data2 = 3776654793;
        
        {
            var param_desc = sys.get_parameter_description_by_id(param_id, , error);
            ASSERT_NO_FML_ERROR(error);
            ASSERT_DEFINED(param_desc);
            ASSERT_EQUALS(param_desc.name, "TestGlobalParameterContinuous");
        }
        
        {
            var out_param_desc = new FMOD_STUDIO_PARAMETER_DESCRIPTION();
            var param_desc = sys.get_parameter_description_by_id(param_id, out_param_desc, error);
            ASSERT_EQUALS(param_desc, out_param_desc);
            ASSERT_NO_FML_ERROR(error);
            ASSERT_DEFINED(param_desc);
            ASSERT_EQUALS(param_desc.name, "TestGlobalParameterContinuous");
        }
        
        ASSERT_UNDEFINED(sys.get_parameter_description_by_id(__tests_sys_get_nonexistent_param_id(sys), , error));
        ASSERT_FML_ERROR(error, FML_RESULT.EVENT_NOTFOUND);
        
        sys.release();
    });
    
    suite.add_test("get_parameter_label_by_name", function() {
        
        var error = new FmlError();
        var sys = __tests_create_system(error);
        
        ASSERT_EQUALS(sys.get_parameter_label_by_name("TestGlobalParameterLabeled", 0, error), "Value A");
        ASSERT_NO_FML_ERROR(error);
        ASSERT_EQUALS(sys.get_parameter_label_by_name("TestGlobalParameterLabeled", 1, error), "Value B");
        ASSERT_NO_FML_ERROR(error);
        ASSERT_EQUALS(sys.get_parameter_label_by_name("TestGlobalParameterLabeled", 2, error), "Value C");
        ASSERT_NO_FML_ERROR(error);
        ASSERT_UNDEFINED(sys.get_parameter_label_by_name("TestGlobalParameterLabeled", 3, error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_PARAM);
        
        sys.release();
    });
    
    suite.add_test("get_parameter_label_by_id", function() {
        
        var error = new FmlError();
        var sys = __tests_create_system(error);
        
        var param_id = new FMOD_STUDIO_PARAMETER_ID();
        param_id.data1 = 176844388;
        param_id.data2 = 932600991;
        ASSERT_EQUALS(sys.get_parameter_label_by_id(param_id, 0, error), "Value A");
        ASSERT_NO_FML_ERROR(error);
        ASSERT_EQUALS(sys.get_parameter_label_by_id(param_id, 1, error), "Value B");
        ASSERT_NO_FML_ERROR(error);
        ASSERT_EQUALS(sys.get_parameter_label_by_id(param_id, 2, error), "Value C");
        ASSERT_NO_FML_ERROR(error);
        ASSERT_UNDEFINED(sys.get_parameter_label_by_id(param_id, 3, error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_PARAM);
        
        sys.release();
    });
    
    suite.add_test("get_parameter_by_id", function() {
        
        var error = new FmlError();
        var sys = __tests_create_system(error);
        
        var param_id = new FMOD_STUDIO_PARAMETER_ID();
        param_id.data1 = 4147700174;
        param_id.data2 = 3776654793;
        
        {
            var value = sys.get_parameter_by_id(param_id, , error);
            ASSERT_NO_FML_ERROR(error);
            ASSERT_EQUALS(value.value, 0);
            ASSERT_EQUALS(value.final_value, 0);
        }
        
        {
            var out_value = {};
            var value = sys.get_parameter_by_id(param_id, out_value, error);
            ASSERT_EQUALS(value, out_value);
            ASSERT_NO_FML_ERROR(error);
            ASSERT_EQUALS(value.value, 0);
            ASSERT_EQUALS(value.final_value, 0);
        }
        
        ASSERT_UNDEFINED(sys.get_parameter_by_id(__tests_sys_get_nonexistent_param_id(sys), , error));
        ASSERT_FML_ERROR(error, FML_RESULT.EVENT_NOTFOUND);
        
        sys.release();
        
    });
    
    suite.add_test("set_parameter_by_id", function() {
        
        var error = new FmlError();
        var sys = __tests_create_system(error);
        
        var param_id = new FMOD_STUDIO_PARAMETER_ID();
        param_id.data1 = 4147700174;
        param_id.data2 = 3776654793;
        
        var value = sys.get_parameter_by_id(param_id, , error);
        ASSERT_NO_FML_ERROR(error);
        ASSERT_EQUALS(value.value, 0);
        ASSERT_EQUALS(value.final_value, 0);
        
        ASSERT_TRUE(sys.set_parameter_by_id(param_id, 0.5, , error));
        ASSERT_NO_FML_ERROR(error);
        var value = sys.get_parameter_by_id(param_id, , error);
        ASSERT_EQUALS(value.value, 0.5);
        ASSERT_EQUALS(value.final_value, 0.0);
        
        ASSERT_FALSE(sys.set_parameter_by_id(__tests_sys_get_nonexistent_param_id(sys), 0, , error));
        ASSERT_FML_ERROR(error, FML_RESULT.EVENT_NOTFOUND);
        
        sys.release();
        
    });
    
    suite.add_test("set_parameter_by_id_with_label", function() {
        
        var error = new FmlError();
        var sys = __tests_create_system(error);
        
        var param_id = new FMOD_STUDIO_PARAMETER_ID();
        param_id.data1 = 176844388;
        param_id.data2 = 932600991;
        
        ASSERT_TRUE(sys.set_parameter_by_id_with_label(param_id, "Value A", , error));
        ASSERT_NO_FML_ERROR(error);
        ASSERT_EQUALS(sys.get_parameter_by_id(param_id).value, 0);
        ASSERT_TRUE(sys.set_parameter_by_id_with_label(param_id, "Value B", , error));
        ASSERT_NO_FML_ERROR(error);
        ASSERT_EQUALS(sys.get_parameter_by_id(param_id).value, 1);
        ASSERT_TRUE(sys.set_parameter_by_id_with_label(param_id, "Value C", , error));
        ASSERT_NO_FML_ERROR(error);
        ASSERT_EQUALS(sys.get_parameter_by_id(param_id).value, 2);
        
        ASSERT_FALSE(sys.set_parameter_by_id_with_label(param_id, "label that doesn't exist", , error));
        ASSERT_FML_ERROR(error, FML_RESULT.EVENT_NOTFOUND);
        
        ASSERT_FALSE(sys.set_parameter_by_id_with_label(__tests_sys_get_nonexistent_param_id(sys), "asd", , error));
        ASSERT_FML_ERROR(error, FML_RESULT.EVENT_NOTFOUND);
        
        sys.release();
    });
    
    suite.add_test("set_parameters_by_ids", function() {
        
        var error = new FmlError();
        var sys = __tests_create_system(error);
        
        var param_ids = [
            new FMOD_STUDIO_PARAMETER_ID(),
            new FMOD_STUDIO_PARAMETER_ID(),
            new FMOD_STUDIO_PARAMETER_ID(),
        ];
        param_ids[@ 0].data1 = 372201694;   // TestGlobalParameterDiscrete
        param_ids[@ 0].data2 = 2797625691;
        param_ids[@ 1].data1 = 176844388;   // TestGlobalParameterLabeled
        param_ids[@ 1].data2 = 932600991;
        param_ids[@ 2].data1 = 4147700174;  // TestGlobalParameterContinuous
        param_ids[@ 2].data2 = 3776654793;
        
        var values = [
            2,
            1,
            0.75,
        ];
        
        ASSERT_TRUE(sys.set_parameters_by_ids(param_ids, values, , error));
        ASSERT_NO_FML_ERROR(error);
        
        ASSERT_TRUE(sys.set_parameters_by_ids([], [], , error));
        ASSERT_NO_FML_ERROR(error);
        
        ASSERT_FALSE(sys.set_parameters_by_ids([__tests_sys_get_nonexistent_param_id(sys)], [0], , error));
        ASSERT_FML_ERROR(error, FML_RESULT.EVENT_NOTFOUND);
        
        sys.release();
    });
    
    suite.add_test("get_parameter_by_name", function() {
        var error = new FmlError();
        var sys = __tests_create_system(error);
        
        {
            var value = sys.get_parameter_by_name("TestGlobalParameterContinuous", , error);
            ASSERT_NO_FML_ERROR(error);
            ASSERT_EQUALS(value.value, 0.0);
            ASSERT_EQUALS(value.final_value, 0.0);
        }
        
        {
            var out_value = {};
            var value = sys.get_parameter_by_name("TestGlobalParameterContinuous", out_value, error);
            ASSERT_EQUALS(value, out_value);
            ASSERT_NO_FML_ERROR(error);
            ASSERT_EQUALS(value.value, 0.0);
            ASSERT_EQUALS(value.final_value, 0.0);
        }
        
        ASSERT_UNDEFINED(sys.get_parameter_by_name("parameter that doesn't exist", , error));
        ASSERT_FML_ERROR(error, FML_RESULT.EVENT_NOTFOUND);
        
        sys.release();
    });
    
    suite.add_test("set_parameter_by_name", function() {
        
        var error = new FmlError();
        var sys = __tests_create_system(error);
        
        var param_name = "TestGlobalParameterContinuous";
        
        var value = sys.get_parameter_by_name(param_name, , error);
        ASSERT_NO_FML_ERROR(error);
        ASSERT_EQUALS(value.value, 0);
        ASSERT_EQUALS(value.final_value, 0);
        
        ASSERT_TRUE(sys.set_parameter_by_name(param_name, 0.5, , error));
        ASSERT_NO_FML_ERROR(error);
        var value = sys.get_parameter_by_name(param_name, , error);
        ASSERT_EQUALS(value.value, 0.5);
        ASSERT_EQUALS(value.final_value, 0.0);
        
        ASSERT_FALSE(sys.set_parameter_by_name("parameter that doesn't exist", 0, , error));
        ASSERT_FML_ERROR(error, FML_RESULT.EVENT_NOTFOUND);
        
        sys.release();
    });
    
    suite.add_test("set_parameter_by_name_with_label", function() {
        
        var error = new FmlError();
        var sys = __tests_create_system(error);
        
        var param_name = "TestGlobalParameterLabeled";
        
        ASSERT_TRUE(sys.set_parameter_by_name_with_label(param_name, "Value A", , error));
        ASSERT_NO_FML_ERROR(error);
        ASSERT_EQUALS(sys.get_parameter_by_name(param_name).value, 0);
        ASSERT_TRUE(sys.set_parameter_by_name_with_label(param_name, "Value B", , error));
        ASSERT_NO_FML_ERROR(error);
        ASSERT_EQUALS(sys.get_parameter_by_name(param_name).value, 1);
        ASSERT_TRUE(sys.set_parameter_by_name_with_label(param_name, "Value C", , error));
        ASSERT_NO_FML_ERROR(error);
        ASSERT_EQUALS(sys.get_parameter_by_name(param_name).value, 2);
        
        ASSERT_FALSE(sys.set_parameter_by_name_with_label(param_name, "label that doesn't exist", , error));
        ASSERT_FML_ERROR(error, FML_RESULT.EVENT_NOTFOUND);
        
        ASSERT_FALSE(sys.set_parameter_by_name_with_label("parameter that doesn't exist", "asd", , error));
        ASSERT_FML_ERROR(error, FML_RESULT.EVENT_NOTFOUND);
        
        sys.release();
    });
    
    suite.add_test("lookup_id", function() {
        
        var error = new FmlError();
        var sys = __tests_create_system(error);
        
        {
            var guid = sys.lookup_id("event:/Explosion", , error);
            ASSERT_NO_FML_ERROR(error);
            ASSERT_EQUALS(guid.toString(), "{03f6740d-f6e7-4285-b772-7a319bfd04fb}");
        }
        
        {
            var out_guid = new FMOD_GUID();
            var guid = sys.lookup_id("event:/Explosion", out_guid, error);
            ASSERT_EQUALS(guid, out_guid);
            ASSERT_NO_FML_ERROR(error);
            ASSERT_EQUALS(guid.toString(), "{03f6740d-f6e7-4285-b772-7a319bfd04fb}");
        }
        
        sys.release();
    });
    
    suite.add_test("lookup_path", function() {
        
        var error = new FmlError();
        var sys = __tests_create_system(error);
        
        var path = sys.lookup_path(FMOD_GUID_from_string("{03f6740d-f6e7-4285-b772-7a319bfd04fb}"), error);
        ASSERT_NO_FML_ERROR(error);
        ASSERT_EQUALS(path, "event:/Explosion");
        
        sys.release();
    });
    
    suite.add_test("get_num_listeners", function() {
        
        var error = new FmlError();
        var sys = __tests_create_system(error);
        
        ASSERT_EQUALS(sys.get_num_listeners(error), 1);
        ASSERT_NO_FML_ERROR(error);
        
        sys.release();
    });
    
    suite.add_test("set_num_listeners", function() {
        
        var error = new FmlError();
        var sys = __tests_create_system(error);
        
        ASSERT_TRUE(sys.set_num_listeners(2, error));
        ASSERT_NO_FML_ERROR(error);
        ASSERT_EQUALS(sys.get_num_listeners(), 2);
        
        ASSERT_FALSE(sys.set_num_listeners(-1, error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_PARAM);
        ASSERT_EQUALS(sys.get_num_listeners(), 2);
        
        sys.release();
    });
    
    suite.add_test("get_listener_attributes", function() {
        
        var error = new FmlError();
        var sys = __tests_create_system(error);
        
        {
            var a = sys.get_listener_attributes(0, undefined, undefined, error);
            ASSERT_INSTANCEOF(a, "FMOD_3D_ATTRIBUTES");
            ASSERT_NO_FML_ERROR(error);
        }
        {
            var out_attributes = new FMOD_3D_ATTRIBUTES();
            var out_attenuation_position = new FMOD_VECTOR();
            var a = sys.get_listener_attributes(0, out_attributes, out_attenuation_position, error);
            ASSERT_INSTANCEOF(a, "FMOD_3D_ATTRIBUTES");
            ASSERT_NO_FML_ERROR(error);
            ASSERT_EQUALS(a, out_attributes);
        }
        
        ASSERT_UNDEFINED(sys.get_listener_attributes(100, undefined, undefined, error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_PARAM);
        
        sys.release();
    });
    
    suite.add_test("set_listener_attributes", function() {
        var error = new FmlError();
        var sys = __tests_create_system(error);
        
        var attributes = new FMOD_3D_ATTRIBUTES();
        attributes.position = new FMOD_VECTOR(1, 0, 0);
        attributes.velocity = new FMOD_VECTOR(0, 1, 0);
        attributes.forward  = new FMOD_VECTOR(0, 0, 1);
        attributes.up       = new FMOD_VECTOR(0, 1, 0);
        var attenuation_position = new FMOD_VECTOR(1, 0, 0);
        ASSERT_TRUE(sys.set_listener_attributes(0, attributes, attenuation_position, error));
        ASSERT_NO_FML_ERROR(error);
        {
            var a = sys.get_listener_attributes(0, undefined, undefined, error);
            ASSERT_NO_FML_ERROR(error);
            ASSERT_STRUCT_DEEP_EQUALS(a, attributes);
        }
        {
            var out_attributes = new FMOD_3D_ATTRIBUTES();
            var out_attenuation_position = new FMOD_VECTOR();
            var a = sys.get_listener_attributes(0, out_attributes, out_attenuation_position, error);
            ASSERT_NO_FML_ERROR(error);
            ASSERT_EQUALS(a, out_attributes);
            ASSERT_STRUCT_DEEP_EQUALS(out_attributes, attributes);
            ASSERT_STRUCT_DEEP_EQUALS(out_attenuation_position, attenuation_position);
        }
        
        ASSERT_TRUE(sys.set_listener_attributes(0, attributes, undefined, error));
        ASSERT_NO_FML_ERROR(error);
        
        ASSERT_FALSE(sys.set_listener_attributes(100, attributes, attenuation_position, error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_PARAM);
        
        sys.release();
    });
    
    suite.add_test("get_listener_weight", function() {
        var error = new FmlError();
        var sys = __tests_create_system(error);
        
        ASSERT_TYPEOF(sys.get_listener_weight(0, error), "number");
        ASSERT_NO_FML_ERROR(error);
        
        ASSERT_UNDEFINED(sys.get_listener_weight(100, error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_PARAM);
        
        sys.release();
    });
    
    suite.add_test("set_listener_weight", function() {
        var error = new FmlError();
        var sys = __tests_create_system(error);
        
        ASSERT_TRUE(sys.set_listener_weight(0, 1.23, error));
        ASSERT_NO_FML_ERROR(error);
        
        ASSERT_EQUALS(sys.get_listener_weight(0), 1.23);
        
        ASSERT_FALSE(sys.set_listener_weight(100, 1.23, error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_PARAM);
        
        sys.release();
    });
    
    suite.add_test("load_bank_file", function() {
        var error = new FmlError();
        var sys = FmodStudioSystem_Create();
        sys.initialize(1024, FMOD_STUDIO_INIT_NORMAL, FMOD_INIT_NORMAL);
        
        sys.load_bank_file(__TESTS_FILE_MASTER_STRINGS_BANK, FMOD_STUDIO_LOAD_BANK_NORMAL);
        
        {
            var bank = sys.load_bank_file(__TESTS_FILE_MASTER_BANK, FMOD_STUDIO_LOAD_BANK_NORMAL, , error);
            __check_loaded_bank(bank);
            bank.unload();
        }
        {
            var out_bank = new FmodBank();
            var bank = sys.load_bank_file(__TESTS_FILE_MASTER_BANK, FMOD_STUDIO_LOAD_BANK_NORMAL, out_bank, error);
            __check_loaded_bank(bank);
            ASSERT_EQUALS(bank, out_bank);
            bank.unload();
        }
        
        sys.release();
        
        ASSERT_UNDEFINED(sys.load_bank_file(__TESTS_FILE_MASTER_BANK, FMOD_STUDIO_LOAD_BANK_NORMAL, , error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
    });
    
    suite.add_test("load_bank_memory", function() {
        var error = new FmlError();
        var sys = FmodStudioSystem_Create();
        sys.initialize(1024, FMOD_STUDIO_INIT_NORMAL, FMOD_INIT_NORMAL);
        
        sys.load_bank_file(__TESTS_FILE_MASTER_STRINGS_BANK, FMOD_STUDIO_LOAD_BANK_NORMAL);
        
        var bank_buffer = buffer_load(__TESTS_FILE_MASTER_BANK);
        
        {
            var bank = sys.load_bank_memory(bank_buffer, buffer_get_size(bank_buffer), FMOD_STUDIO_LOAD_MEMORY_MODE.MEMORY, FMOD_STUDIO_LOAD_BANK_NORMAL, , error);
            __check_loaded_bank(bank);
            bank.unload();
        }
        {
            var out_bank = new FmodBank();
            var bank = sys.load_bank_memory(bank_buffer, buffer_get_size(bank_buffer), FMOD_STUDIO_LOAD_MEMORY_MODE.MEMORY, FMOD_STUDIO_LOAD_BANK_NORMAL, out_bank, error);
            __check_loaded_bank(bank);
            ASSERT_EQUALS(bank, out_bank);
            bank.unload();
        }
        
        sys.release();
        
        ASSERT_UNDEFINED(sys.load_bank_memory(bank_buffer, buffer_get_size(bank_buffer), FMOD_STUDIO_LOAD_MEMORY_MODE.MEMORY, FMOD_STUDIO_LOAD_BANK_NORMAL, , error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
        
        buffer_delete(bank_buffer);
    });
    
    suite.add_test("load_bank_custom", function() { return "TODO"; });
    suite.add_test("unload_all", function() { return "TODO"; });
    
    suite.add_test("get_buffer_usage", function() {
        var error = new FmlError();
        var sys = __tests_create_system(error);
        
        {
            var usage = sys.get_buffer_usage(undefined, error);
            ASSERT_NO_FML_ERROR(error);
            ASSERT_INSTANCEOF(usage, "FMOD_STUDIO_BUFFER_USAGE");
        }
        {
            var out_usage = new FMOD_STUDIO_BUFFER_USAGE();
            var usage = sys.get_buffer_usage(out_usage, error);
            ASSERT_EQUALS(usage, out_usage);
            ASSERT_NO_FML_ERROR(error);
            ASSERT_INSTANCEOF(usage, "FMOD_STUDIO_BUFFER_USAGE");
        }
        
        sys.release();
        
        ASSERT_UNDEFINED(sys.get_buffer_usage(undefined, error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
    });
    
    suite.add_test("reset_buffer_usage", function() {
        var error = new FmlError();
        var sys = __tests_create_system(error);
        
        var usage_before = sys.get_buffer_usage();
        ASSERT_TRUE(sys.reset_buffer_usage(error));
        ASSERT_NO_FML_ERROR(error);
        var usage_after = sys.get_buffer_usage();
        ASSERT_TRUE(usage_after.studiocommandqueue.peakusage < usage_before.studiocommandqueue.peakusage);
        
        sys.release();
        
        ASSERT_FALSE(sys.reset_buffer_usage(error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
    });
    
    suite.add_test("register_plugin", function() { return "TODO"; });
    suite.add_test("unregister_plugin", function() { return "TODO"; });
    
    suite.add_test("get_bank_count", function() {
        
        var error = new FmlError();
        var sys = FmodStudioSystem_Create();
        sys.initialize(1024, FMOD_STUDIO_INIT_NORMAL, FMOD_INIT_NORMAL);
        
        ASSERT_EQUALS(sys.get_bank_count(error), 0);
        ASSERT_NO_FML_ERROR(error);
        
        sys.load_bank_file(__TESTS_FILE_MASTER_BANK, FMOD_STUDIO_LOAD_BANK_NORMAL);
        sys.load_bank_file(__TESTS_FILE_MASTER_STRINGS_BANK, FMOD_STUDIO_LOAD_BANK_NORMAL);
        sys.load_bank_file(__TESTS_FILE_EMPTY_BANK, FMOD_STUDIO_LOAD_BANK_NORMAL);
        
        ASSERT_EQUALS(sys.get_bank_count(error), 3);
        ASSERT_NO_FML_ERROR(error);
        
        sys.release();
    });
    
    suite.add_test("get_bank_list", function() {
        
        var error = new FmlError();
        var sys = FmodStudioSystem_Create();
        sys.initialize(1024, FMOD_STUDIO_INIT_NORMAL, FMOD_INIT_NORMAL);
        
        {
            var banks = sys.get_bank_list(error);
            ASSERT_DEFINED(banks);
            ASSERT_NO_FML_ERROR(error);
            ASSERT_EQUALS(array_length(banks), 0);
        }
        
        sys.load_bank_file(__TESTS_FILE_MASTER_BANK, FMOD_STUDIO_LOAD_BANK_NORMAL);
        sys.load_bank_file(__TESTS_FILE_MASTER_STRINGS_BANK, FMOD_STUDIO_LOAD_BANK_NORMAL);
        sys.load_bank_file(__TESTS_FILE_EMPTY_BANK, FMOD_STUDIO_LOAD_BANK_NORMAL);
        
        {
            var banks = sys.get_bank_list(error);
            ASSERT_DEFINED(banks);
            ASSERT_NO_FML_ERROR(error);
            ASSERT_EQUALS(array_length(banks), 3);
            ASSERT_EQUALS(banks[@ 0].get_path(), "bank:/Master");
            ASSERT_EQUALS(banks[@ 1].get_path(), "bank:/Master.strings");
            ASSERT_EQUALS(banks[@ 2].get_path(), "bank:/Empty");
        }
        
        sys.release();
    });
    
    suite.add_test("get_parameter_description_count", function() {
        
        var error = new FmlError();
        var sys = FmodStudioSystem_Create();
        
        ASSERT_UNDEFINED(sys.get_parameter_description_count(error));
        ASSERT_FML_ERROR(error, FML_RESULT.STUDIO_UNINITIALIZED);
        sys.initialize(1024, FMOD_STUDIO_INIT_NORMAL, FMOD_INIT_NORMAL);
        
        sys.load_bank_file(__TESTS_FILE_MASTER_BANK, FMOD_STUDIO_LOAD_BANK_NORMAL);
        sys.load_bank_file(__TESTS_FILE_MASTER_STRINGS_BANK, FMOD_STUDIO_LOAD_BANK_NORMAL);
        sys.load_bank_file(__TESTS_FILE_EMPTY_BANK, FMOD_STUDIO_LOAD_BANK_NORMAL);
        
        ASSERT_EQUALS(sys.get_parameter_description_count(error), 3);
        ASSERT_NO_FML_ERROR(error);
        
        sys.release();
    });
    
    suite.add_test("get_parameter_description_list", function() {
        
        var error = new FmlError();
        var sys = FmodStudioSystem_Create();
        
        ASSERT_UNDEFINED(sys.get_parameter_description_list(error));
        ASSERT_FML_ERROR(error, FML_RESULT.STUDIO_UNINITIALIZED);
        sys.initialize(1024, FMOD_STUDIO_INIT_NORMAL, FMOD_INIT_NORMAL);
        
        sys.load_bank_file(__TESTS_FILE_MASTER_BANK, FMOD_STUDIO_LOAD_BANK_NORMAL);
        sys.load_bank_file(__TESTS_FILE_MASTER_STRINGS_BANK, FMOD_STUDIO_LOAD_BANK_NORMAL);
        sys.load_bank_file(__TESTS_FILE_EMPTY_BANK, FMOD_STUDIO_LOAD_BANK_NORMAL);
        
        var params = sys.get_parameter_description_list(error);
        ASSERT_NO_FML_ERROR(error);
        ASSERT_EQUALS(array_length(params), 3);
        
        sys.release();
    });
    
    suite.add_test("start_command_capture", function() { return "TODO"; });
    suite.add_test("stop_command_capture", function() { return "TODO"; });
    suite.add_test("load_command_replay", function() { return "TODO"; });
    
    suite.add_test("set_callback", function() {
        
        var error = new FmlError();
        var sys = FmodStudioSystem_Create();
        sys.initialize(1024, FMOD_STUDIO_INIT_NORMAL | FMOD_STUDIO_INIT_SYNCHRONOUS_UPDATE, FMOD_INIT_NORMAL);
        
        // Store the data of each occurred callback into an array so that we can check
        // them afterwards and see if they hold the data we expect.
        var capture = {
            callback_parameters: [],
        };
        var callback = method(capture, function(type/*: int*/, studio_system_index/*: int*/, bank_index/*: int?*/) {
            array_push(callback_parameters, {
                type: type,
                studio_system_index: studio_system_index,
                bank_index: bank_index,
            });
        });
        ASSERT_TRUE(sys.set_callback(callback, FMOD_STUDIO_SYSTEM_CALLBACK_BANK_UNLOAD, error));
        ASSERT_NO_FML_ERROR(error);
        
        var bank = sys.load_bank_file(__TESTS_FILE_MASTER_STRINGS_BANK, FMOD_STUDIO_LOAD_BANK_NORMAL);
        bank.unload();
        
        sys.update();
        fml_update_callbacks();
        
        ASSERT_EQUALS(array_length(capture.callback_parameters), 1);
        ASSERT_EQUALS(capture.callback_parameters[@ 0].type, FMOD_STUDIO_SYSTEM_CALLBACK_BANK_UNLOAD);
        ASSERT_EQUALS(capture.callback_parameters[@ 0].studio_system_index, sys.studio_system_index);
        ASSERT_EQUALS(capture.callback_parameters[@ 0].bank_index, bank.bank_index);
        
        sys.release();
        
        ASSERT_FALSE(sys.set_callback(callback, FMOD_STUDIO_SYSTEM_CALLBACK_BANK_UNLOAD, error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
    });
    
    suite.add_test("get_user_data", function() { return "TODO"; });
    suite.add_test("set_user_data", function() { return "TODO"; });
    
    suite.add_test("get_cpu_usage", function() {
        
        var error = new FmlError();
        var sys = FmodStudioSystem_Create();
        
        var studio_usage = new FMOD_STUDIO_CPU_USAGE();
        studio_usage.update = -1;
        var core_usage = new FMOD_CPU_USAGE();
        core_usage.dsp = -1;
        core_usage.stream = -1;
        core_usage.geometry = -1;
        core_usage.update = -1;
        core_usage.convolution1 = -1;
        core_usage.convolution2 = -1;
        
        ASSERT_FALSE(sys.get_cpu_usage(studio_usage, core_usage, error));
        ASSERT_FML_ERROR(error, FML_RESULT.STUDIO_UNINITIALIZED);
        
        sys.initialize(1024, FMOD_STUDIO_INIT_NORMAL, FMOD_INIT_NORMAL);
        
        ASSERT_TRUE(sys.get_cpu_usage(studio_usage, core_usage, error));
        ASSERT_NO_FML_ERROR(error);
        ASSERT_NOT_EQUALS(studio_usage.update, -1);
        ASSERT_NOT_EQUALS(core_usage.dsp, -1);
        ASSERT_NOT_EQUALS(core_usage.stream, -1);
        ASSERT_NOT_EQUALS(core_usage.geometry, -1);
        ASSERT_NOT_EQUALS(core_usage.update, -1);
        ASSERT_NOT_EQUALS(core_usage.convolution1, -1);
        ASSERT_NOT_EQUALS(core_usage.convolution2, -1);
        
        sys.release();
    });
    
    suite.add_test("get_memory_usage", function() {
        
        var error = new FmlError();
        var sys = FmodStudioSystem_Create();
        
        var mem_usage = new FMOD_STUDIO_MEMORY_USAGE();
        mem_usage.exclusive = -1;
        mem_usage.inclusive = -1;
        mem_usage.sampledata = -1;
        
        ASSERT_DEFINED(sys.get_memory_usage(mem_usage, error));
        ASSERT_NO_FML_ERROR(error);
        ASSERT_NOT_EQUALS(mem_usage.exclusive, -1);
        ASSERT_NOT_EQUALS(mem_usage.inclusive, -1);
        ASSERT_NOT_EQUALS(mem_usage.sampledata, -1);
        
        sys.release();
    });
    
    return suite;
}
