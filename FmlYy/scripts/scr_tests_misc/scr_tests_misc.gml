
/// @returns {TestSuite}
function make_test_suite_Misc()
{
    var suite = new TestSuite("Misc");
    
    suite.add_test("fml api version match", function() {
        
        // The FML version number is defined in two places:
        // 1. The FML library (FmlLib project)
        // 2. This GML library
        // Check that both of these places define the same exact value.
        
        var fml_lib_version = __FML_UTIL_FML_VERSION();
        var gml_lib_version = FML_VERSION;
        
        ASSERT_EQUALS(typeof(fml_lib_version), "string");
        ASSERT_EQUALS(typeof(gml_lib_version), "string");
        ASSERT_EQUALS(fml_lib_version, gml_lib_version);
        
    });
    
    suite.add_test("fmod api version match", function() {
        
        // The FMOD API version number is defined in three different places:
        // 1. The FMOD library
        // 2. The FML library (FmlLib project)
        // 3. This GML library
        // Check that all of these places define the same exact value.
        
        var fmod_lib_version = FmodSystem_Create().get_version();
        var fml_lib_version  = __FML_UTIL_FMOD_VERSION();
        var gml_lib_version  = FMOD_VERSION;
        
        ASSERT_EQUALS(gml_lib_version, fmod_lib_version);
        ASSERT_EQUALS(gml_lib_version, fml_lib_version);
        
    });
    
    suite.add_test("fml_fmod_version_*", function() {
        
        var fmod_lib_version_str = fml_fmod_version_to_string(FmodSystem_Create().get_version());
        var fml_lib_version_str  = fml_fmod_version_to_string(__FML_UTIL_FMOD_VERSION());
        var gml_lib_version_str  = fml_fmod_version_to_string(FMOD_VERSION);
        ASSERT_EQUALS(gml_lib_version_str, fmod_lib_version_str);
        ASSERT_EQUALS(gml_lib_version_str, fml_lib_version_str);
        
        ASSERT_EQUALS(fml_fmod_version_to_string(0), "0.00.00");
        ASSERT_EQUALS(fml_fmod_version_to_string(0x00010203), "1.02.03");
        ASSERT_EQUALS(fml_fmod_version_to_string(0x00010c0d), "1.12.13");
        ASSERT_EQUALS(fml_fmod_version_to_string(0x000b1621), "11.22.33");
        
        ASSERT_EQUALS(fml_fmod_version_from_parts(1, 2, 3), 0x00010203);
        ASSERT_EQUALS(fml_fmod_version_get_product(0x00010203), 1);
        ASSERT_EQUALS(fml_fmod_version_get_major(0x00010203), 2);
        ASSERT_EQUALS(fml_fmod_version_get_minor(0x00010203), 3);
    });
    
    return suite;
}
