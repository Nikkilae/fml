
/// @returns {TestSuite}
function make_test_suite_FmodVca()
{
    var suite = new TestSuite("FmodVca");
    suite.is_implemented_func = function(test_name) {
        return variable_struct_exists(new FmodVca(), test_name);
    };
    
    suite.add_test("is_valid", function() {
        var error = new FmlError();
        var sys = __tests_create_system(error);
        var vca = sys.get_vca("vca:/TestVca");
        ASSERT_TRUE(vca.is_valid());
        sys.release();
        ASSERT_FALSE(vca.is_valid());
    });
    
    suite.add_test("get_id", function() {
        var error = new FmlError();
        var sys = __tests_create_system(error);
        var vca = sys.get_vca("vca:/TestVca");
        {
            ASSERT_EQUALS(vca.get_id(, error).toString(), "{a3cc2199-6255-49e3-bd77-cff33e72eaac}");
            ASSERT_NO_FML_ERROR(error);
        }
        {
            var out_guid = new FMOD_GUID();
            var guid = vca.get_id(out_guid, error);
            ASSERT_EQUALS(guid, out_guid);
            ASSERT_EQUALS(guid.toString(), "{a3cc2199-6255-49e3-bd77-cff33e72eaac}");
            ASSERT_NO_FML_ERROR(error);
        }
        sys.release();
        ASSERT_UNDEFINED(vca.get_id(, error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
    });
    
    suite.add_test("get_path", function() {
        var error = new FmlError();
        var sys = __tests_create_system(error);
        var vca = sys.get_vca("vca:/TestVca");
        ASSERT_EQUALS(vca.get_path(error), "vca:/TestVca");
        ASSERT_NO_FML_ERROR(error);
        sys.release();
        ASSERT_UNDEFINED(vca.get_path(error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
    });
    
    suite.add_test("get_volume", function() {
        var error = new FmlError();
        var sys = __tests_create_system(error);
        var vca = sys.get_vca("vca:/TestVca");
        
        {
            var volume = vca.get_volume(, error);
            ASSERT_NO_FML_ERROR(error);
            ASSERT_EQUALS(volume.volume, 1.0);
            ASSERT_EQUALS(volume.final_volume, 1.0);
        }
        {
            var out_volume = {};
            var volume = vca.get_volume(out_volume, error);
            ASSERT_EQUALS(volume, out_volume);
            ASSERT_NO_FML_ERROR(error);
            ASSERT_EQUALS(volume.volume, 1.0);
            ASSERT_EQUALS(volume.final_volume, 1.0);
        }
        
        sys.release();
        ASSERT_UNDEFINED(vca.get_volume(, error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
    });
    
    suite.add_test("set_volume", function() {
        var error = new FmlError();
        var sys = __tests_create_system(error);
        var vca = sys.get_vca("vca:/TestVca");
        
        ASSERT_TRUE(vca.set_volume(0.5, error));
        ASSERT_NO_FML_ERROR(error);
        ASSERT_EQUALS(vca.get_volume().volume, 0.5);
        
        sys.release();
        ASSERT_FALSE(vca.set_volume(0, error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
    });
    
    return suite;
}
