
/// @returns {TestSuite}
function make_test_suite_FmodBank()
{
    var suite = new TestSuite("FmodBank");
    suite.is_implemented_func = function(test_name) {
        return variable_struct_exists(new FmodBank(), test_name);
    };
    
    suite.add_test("is_valid", function() {
        var error = new FmlError();
        var sys = __tests_create_system(error);
        var bank = sys.get_bank("bank:/Master");
        ASSERT_TRUE(bank.is_valid(error));
        ASSERT_NO_FML_ERROR(error);
        sys.release();
        ASSERT_FALSE(bank.is_valid());
    });
    
    suite.add_test("get_id", function() {
        var error = new FmlError();
        var sys = __tests_create_system(error);
        var bank = sys.get_bank("bank:/Master");
        ASSERT_EQUALS(bank.get_id(, error).toString(), "{8f43fe09-20eb-4353-b68a-f572b3da81ad}");
        ASSERT_NO_FML_ERROR(error);
        sys.release();
        ASSERT_UNDEFINED(bank.get_id(, error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
    });
    
    suite.add_test("get_path", function() {
        var error = new FmlError();
        var sys = __tests_create_system(error);
        var bank = sys.get_bank("bank:/Master");
        ASSERT_EQUALS(bank.get_path(error), "bank:/Master");
        ASSERT_NO_FML_ERROR(error);
        sys.release();
        ASSERT_UNDEFINED(bank.get_path(error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
    });
    
    suite.add_test("unload", function() {
        var error = new FmlError();
        var sys = __tests_create_system(error);
        var bank = sys.get_bank("bank:/Master");
        
        ASSERT_TRUE(bank.unload(error));
        ASSERT_NO_FML_ERROR(error);
        ASSERT_EQUALS(bank.get_loading_state(error), FMOD_STUDIO_LOADING_STATE.UNLOADING);
        
        sys.release();
        
        ASSERT_FALSE(bank.unload(error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
    });
    
    suite.add_test("load_sample_data", function() {
        var error = new FmlError();
        var sys = __tests_create_system(error);
        var bank = sys.get_bank("bank:/Master");
        
        ASSERT_EQUALS(bank.get_sample_loading_state(), FMOD_STUDIO_LOADING_STATE.UNLOADED);
        
        ASSERT_TRUE(bank.load_sample_data(error));
        ASSERT_NO_FML_ERROR(error);
        
        ASSERT_EQUALS(bank.get_sample_loading_state(), FMOD_STUDIO_LOADING_STATE.LOADING);
        
        sys.release();
        
        ASSERT_FALSE(bank.load_sample_data(error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
    });
    
    suite.add_test("unload_sample_data", function() {
        var error = new FmlError();
        var sys = __tests_create_system(error);
        var bank = sys.get_bank("bank:/Master");
        
        bank.load_sample_data();
        
        ASSERT_EQUALS(bank.get_sample_loading_state(), FMOD_STUDIO_LOADING_STATE.LOADING);
        
        ASSERT_TRUE(bank.unload_sample_data(error));
        ASSERT_NO_FML_ERROR(error);
        
        ASSERT_EQUALS(bank.get_sample_loading_state(), FMOD_STUDIO_LOADING_STATE.UNLOADED);
        
        sys.release();
        
        ASSERT_FALSE(bank.unload_sample_data(error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
    });
    
    suite.add_test("get_loading_state", function() {
        var error = new FmlError();
        var sys = __tests_create_system(error);
        var bank = sys.get_bank("bank:/Master");
        
        ASSERT_EQUALS(bank.get_loading_state(error), FMOD_STUDIO_LOADING_STATE.LOADED);
        ASSERT_NO_FML_ERROR(error);
        
        bank.unload();
        ASSERT_EQUALS(bank.get_loading_state(error), FMOD_STUDIO_LOADING_STATE.UNLOADING);
        
        sys.release();
        
        ASSERT_UNDEFINED(bank.get_loading_state(error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
    });
    
    suite.add_test("get_sample_loading_state", function() {
        var error = new FmlError();
        var sys = __tests_create_system(error);
        var bank = sys.get_bank("bank:/Master");
        
        ASSERT_EQUALS(bank.get_sample_loading_state(error), FMOD_STUDIO_LOADING_STATE.UNLOADED);
        ASSERT_NO_FML_ERROR(error);
        
        sys.release();
        
        ASSERT_UNDEFINED(bank.get_sample_loading_state(error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
    });
    
    suite.add_test("get_string_count", function() {
        var error = new FmlError();
        var sys = __tests_create_system(error);
        
        var bank_master = sys.get_bank("bank:/Master");
        ASSERT_EQUALS(bank_master.get_string_count(error), 0);
        ASSERT_NO_FML_ERROR(error);
        var bank_master_strings = sys.get_bank("bank:/Master.strings");
        ASSERT_TRUE(bank_master_strings.get_string_count(error) > 0);
        ASSERT_NO_FML_ERROR(error);
        
        sys.release();
        
        ASSERT_UNDEFINED(bank_master_strings.get_string_count(error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
    });
    
    suite.add_test("get_string_info", function() {
        var error = new FmlError();
        var sys = __tests_create_system(error);
        
        var bank_master_strings = sys.get_bank("bank:/Master.strings");
        var count = bank_master_strings.get_string_count();
        for (var i = 0; i < count; ++i) {
            var guid = new FMOD_GUID();
            var path = bank_master_strings.get_string_info(i, guid, error);
            ASSERT_NO_FML_ERROR(error);
            ASSERT_EQUALS(sys.lookup_path(guid), path);
        }
        
        sys.release();
        
        ASSERT_UNDEFINED(bank_master_strings.get_string_info(0, undefined, error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
    });
    
    suite.add_test("get_event_count", function() {
        var error = new FmlError();
        var sys = __tests_create_system(error);
        var bank = sys.get_bank("bank:/Master");
        
        ASSERT_EQUALS(bank.get_event_count(error), 4);
        ASSERT_NO_FML_ERROR(error);
        
        sys.release();
        
        ASSERT_UNDEFINED(bank.get_event_count(error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
    });
    
    suite.add_test("get_event_list", function() {
        var error = new FmlError();
        var sys = __tests_create_system(error);
        var bank = sys.get_bank("bank:/Master");
        
        __check_loaded_bank(bank);
        
        sys.release();
        
        ASSERT_UNDEFINED(bank.get_event_list(error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
    });
    
    suite.add_test("get_bus_count", function() {
        var error = new FmlError();
        var sys = __tests_create_system(error);
        var bank = sys.get_bank("bank:/Master");
        
        ASSERT_EQUALS(bank.get_bus_count(error), 2);
        ASSERT_NO_FML_ERROR(error);
        
        sys.release();
        
        ASSERT_UNDEFINED(bank.get_bus_count(error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
    });
    
    suite.add_test("get_bus_list", function() {
        var error = new FmlError();
        var sys = __tests_create_system(error);
        var bank = sys.get_bank("bank:/Master");
        
        var buses = bank.get_bus_list(error);
        ASSERT_NO_FML_ERROR(error);
        ASSERT_EQUALS(array_length(buses), 2);
        ASSERT_EQUALS(buses[@ 0].get_path(), "bus:/Reverb");
        ASSERT_EQUALS(buses[@ 1].get_path(), "bus:/");
        
        sys.release();
        
        ASSERT_UNDEFINED(bank.get_bus_list(error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
    });
    
    suite.add_test("get_vca_count", function() {
        var error = new FmlError();
        var sys = __tests_create_system(error);
        var bank = sys.get_bank("bank:/Master");
        
        ASSERT_EQUALS(bank.get_vca_count(error), 1);
        ASSERT_NO_FML_ERROR(error);
        
        sys.release();
        
        ASSERT_UNDEFINED(bank.get_vca_count(error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
    });
    
    suite.add_test("get_vca_list", function() {
        var error = new FmlError();
        var sys = __tests_create_system(error);
        var bank = sys.get_bank("bank:/Master");
        
        var vcas = bank.get_vca_list(error);
        ASSERT_NO_FML_ERROR(error);
        ASSERT_EQUALS(array_length(vcas), 1);
        ASSERT_EQUALS(vcas[@ 0].get_path(), "vca:/TestVca");
        
        sys.release();
        
        ASSERT_UNDEFINED(bank.get_vca_list(error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
    });
    
    suite.add_test("get_user_data", function() { return "TODO"; });
    suite.add_test("set_user_data", function() { return "TODO"; });
    
    return suite;
}
