
/// @returns {TestSuite}
function make_test_suite_Structs()
{
    var suite = new TestSuite("Structs");
    
    suite.add_test("FMOD_3D_ATTRIBUTES_serialization", function() {
        
        var attributes_1 = new FMOD_3D_ATTRIBUTES();
        attributes_1.position = new FMOD_VECTOR(1, 2, 3);
        attributes_1.velocity = new FMOD_VECTOR(4, 5, 6);
        attributes_1.forward  = new FMOD_VECTOR(7, 8, 9);
        attributes_1.up       = new FMOD_VECTOR(10, 11, 12);
        var buf = __fml_buffers_3d_attributes;
        buffer_seek(buf, buffer_seek_start, 0);
        FMOD_3D_ATTRIBUTES_serialize(attributes_1, buf);
        var attributes_2 = new FMOD_3D_ATTRIBUTES();
        buffer_seek(buf, buffer_seek_start, 0);
        FMOD_3D_ATTRIBUTES_deserialize(attributes_2, buf);
        
        ASSERT_STRUCT_DEEP_EQUALS(attributes_1, attributes_2);
        
    });
    
    suite.add_test("FMOD_CPU_USAGE_serialization", function() {
        
        var cpu_usage_1 = new FMOD_CPU_USAGE();
        cpu_usage_1.dsp = 1;
        cpu_usage_1.stream = 2;
        cpu_usage_1.geometry = 3;
        cpu_usage_1.update = 4;
        cpu_usage_1.convolution1 = 5;
        cpu_usage_1.convolution2 = 6;
        var buf = __fml_buffers_core_cpu_usage;
        buffer_seek(buf, buffer_seek_start, 0);
        FMOD_CPU_USAGE_serialize(cpu_usage_1, buf);
        var cpu_usage_2 = new FMOD_CPU_USAGE();
        buffer_seek(buf, buffer_seek_start, 0);
        FMOD_CPU_USAGE_deserialize(cpu_usage_2, buf);
        
        ASSERT_STRUCT_DEEP_EQUALS(cpu_usage_1, cpu_usage_2);
        
    });
    
    suite.add_test("FMOD_GUID_serialization", function() {
        
        var guid_1 = new FMOD_GUID();
        guid_1.Data1 = int64(1);
        guid_1.Data2 = int64(2);
        guid_1.Data3 = int64(3);
        for (var i = 0; i < array_length(guid_1.Data4); ++i) {
            guid_1.Data4[@ i] = int64(4 + i);
        }
        var buf = __fml_buffers_guid;
        buffer_seek(buf, buffer_seek_start, 0);
        FMOD_GUID_serialize(guid_1, buf);
        var guid_2 = new FMOD_GUID();
        buffer_seek(buf, buffer_seek_start, 0);
        FMOD_GUID_deserialize(guid_2, buf);
        
        ASSERT_STRUCT_DEEP_EQUALS(guid_1, guid_2);
        
    });
    
    suite.add_test("FMOD_STUDIO_ADVANCEDSETTINGS_serialization", function() {
        
        var as_1 = new FMOD_STUDIO_ADVANCEDSETTINGS();
        as_1.commandqueuesize = 1;
        as_1.handleinitialsize = 2;
        as_1.studioupdateperiod = 3;
        as_1.idlesampledatapoolsize = 4;
        as_1.streamingscheduledelay = 5;
        as_1.encryptionkey = "abcdefg";
        
        var buf = buffer_create(0, buffer_grow, 1);
        FMOD_STUDIO_ADVANCEDSETTINGS_serialize(as_1, buf);
        var as_2 = new FMOD_STUDIO_ADVANCEDSETTINGS();
        buffer_seek(buf, buffer_seek_start, 0);
        FMOD_STUDIO_ADVANCEDSETTINGS_deserialize(as_2, buf);
        
        ASSERT_STRUCT_DEEP_EQUALS(as_1, as_2);
        
        buffer_delete(buf);
        
    });
    
    suite.add_test("FMOD_STUDIO_BUFFER_INFO_serialization", function() {
        
        var buf_info_1 = new FMOD_STUDIO_BUFFER_INFO();
        buf_info_1.currentusage = 1;
        buf_info_1.peakusage = 2;
        buf_info_1.capacity = 3;
        buf_info_1.stallcount = 4;
        buf_info_1.stalltime = 5;
        var buf = __fml_buffers_buffer_info;
        buffer_seek(buf, buffer_seek_start, 0);
        FMOD_STUDIO_BUFFER_INFO_serialize(buf_info_1, buf);
        var buf_info_2 = new FMOD_STUDIO_BUFFER_INFO();
        buffer_seek(buf, buffer_seek_start, 0);
        FMOD_STUDIO_BUFFER_INFO_deserialize(buf_info_2, buf);
        
        ASSERT_STRUCT_DEEP_EQUALS(buf_info_1, buf_info_2);
        
    });
    
    suite.add_test("FMOD_STUDIO_BUFFER_USAGE_serialization", function() {
        
        var buf_usage_1 = new FMOD_STUDIO_BUFFER_USAGE();
        buf_usage_1.studiocommandqueue.currentusage = 1;
        buf_usage_1.studiocommandqueue.peakusage = 2;
        buf_usage_1.studiocommandqueue.capacity = 3;
        buf_usage_1.studiocommandqueue.stallcount = 4;
        buf_usage_1.studiocommandqueue.stalltime = 5;
        buf_usage_1.studiohandle.currentusage = 6;
        buf_usage_1.studiohandle.peakusage = 7;
        buf_usage_1.studiohandle.capacity = 8;
        buf_usage_1.studiohandle.stallcount = 9;
        buf_usage_1.studiohandle.stalltime = 10;
        
        var buf = __fml_buffers_buffer_usage;
        buffer_seek(buf, buffer_seek_start, 0);
        FMOD_STUDIO_BUFFER_USAGE_serialize(buf_usage_1, buf);
        var buf_usage_2 = new FMOD_STUDIO_BUFFER_USAGE();
        buffer_seek(buf, buffer_seek_start, 0);
        FMOD_STUDIO_BUFFER_USAGE_deserialize(buf_usage_2, buf);
        
        ASSERT_STRUCT_DEEP_EQUALS(buf_usage_1, buf_usage_2);
        
    });
    
    suite.add_test("FMOD_STUDIO_MEMORY_USAGE_serialization", function() {
        
        var mem_usage_1 = new FMOD_STUDIO_MEMORY_USAGE();
        mem_usage_1.exclusive = 1;
        mem_usage_1.inclusive = 2;
        mem_usage_1.sampledata = 3;
        
        var buf = __fml_buffers_studio_memory_usage;
        buffer_seek(buf, buffer_seek_start, 0);
        FMOD_STUDIO_MEMORY_USAGE_serialize(mem_usage_1, buf);
        var mem_usage_2 = new FMOD_STUDIO_MEMORY_USAGE();
        buffer_seek(buf, buffer_seek_start, 0);
        FMOD_STUDIO_MEMORY_USAGE_deserialize(mem_usage_2, buf);
        
        ASSERT_STRUCT_DEEP_EQUALS(mem_usage_1, mem_usage_2);
        
    });
    
    suite.add_test("FMOD_STUDIO_PARAMETER_DESCRIPTION_serialization", function() {
        
        var param_desc_1 = new FMOD_STUDIO_PARAMETER_DESCRIPTION();
        param_desc_1.name = "abcdefg";
        param_desc_1.id.data1 = int64(1);
        param_desc_1.id.data2 = int64(2);
        param_desc_1.minimum = 3;
        param_desc_1.maximum = 4;
        param_desc_1.defaultvalue = 5;
        param_desc_1.type = FMOD_STUDIO_PARAMETER_TYPE.AUTOMATIC_SPEED;
        param_desc_1.flags = int64(7);
        param_desc_1.guid.Data1 = int64(8);
        param_desc_1.guid.Data2 = int64(9);
        param_desc_1.guid.Data3 = int64(10);
        for (var i = 0; i < array_length(param_desc_1.guid.Data4); ++i) {
            param_desc_1.guid.Data4[@ i] = int64(11 + i);
        }
        
        var buf = buffer_create(0, buffer_grow, 1);
        FMOD_STUDIO_PARAMETER_DESCRIPTION_serialize(param_desc_1, buf);
        var param_desc_2 = new FMOD_STUDIO_PARAMETER_DESCRIPTION();
        buffer_seek(buf, buffer_seek_start, 0);
        FMOD_STUDIO_PARAMETER_DESCRIPTION_deserialize(param_desc_2, buf);
        
        ASSERT_STRUCT_DEEP_EQUALS(param_desc_1, param_desc_2);
        
    });
    
    suite.add_test("FMOD_STUDIO_PARAMETER_ID_serialization", function() {
        
        var param_id_1 = new FMOD_STUDIO_PARAMETER_ID();
        param_id_1.data1 = int64(1);
        param_id_1.data2 = int64(2);
        
        var buf = __fml_buffers_parameter_id;
        buffer_seek(buf, buffer_seek_start, 0);
        FMOD_STUDIO_PARAMETER_ID_serialize(param_id_1, buf);
        var param_id_2 = new FMOD_STUDIO_PARAMETER_ID();
        buffer_seek(buf, buffer_seek_start, 0);
        FMOD_STUDIO_PARAMETER_ID_deserialize(param_id_2, buf);
        
        ASSERT_STRUCT_DEEP_EQUALS(param_id_1, param_id_2);
        
    });
    
    suite.add_test("FMOD_STUDIO_USER_PROPERTY_serialization", function() {
        
        var types = [
            FMOD_STUDIO_USER_PROPERTY_TYPE.INTEGER,
            FMOD_STUDIO_USER_PROPERTY_TYPE.BOOLEAN,
            FMOD_STUDIO_USER_PROPERTY_TYPE.FLOAT,
            FMOD_STUDIO_USER_PROPERTY_TYPE.STRING,
        ];
        
        for (var i = 0, len = array_length(types); i < len; ++i) {
            var type = types[@ i];
            var prop_1 = new FMOD_STUDIO_USER_PROPERTY();
            prop_1.name = "abcdefg";
            prop_1.type = type;
            switch (type) {
                case FMOD_STUDIO_USER_PROPERTY_TYPE.INTEGER: prop_1.value = int64(10); break;
                case FMOD_STUDIO_USER_PROPERTY_TYPE.BOOLEAN: prop_1.value = true; break;
                case FMOD_STUDIO_USER_PROPERTY_TYPE.FLOAT: prop_1.value = 123.456; break;
                case FMOD_STUDIO_USER_PROPERTY_TYPE.STRING: prop_1.value = "hijklmn"; break;
            }
            var buf = buffer_create(0, buffer_grow, 1);
            FMOD_STUDIO_USER_PROPERTY_serialize(prop_1, buf);
            var prop_2 = new FMOD_STUDIO_USER_PROPERTY();
            buffer_seek(buf, buffer_seek_start, 0);
            FMOD_STUDIO_USER_PROPERTY_deserialize(prop_2, buf);
            
            ASSERT_STRUCT_DEEP_EQUALS(prop_1, prop_2);
            
            buffer_delete(buf);
        }
        
        
    });
    
    suite.add_test("FMOD_VECTOR_serialization", function() {
        
        var vec_1 = new FMOD_VECTOR(1, 2, 3);
        var buf = __fml_buffers_vector;
        buffer_seek(buf, buffer_seek_start, 0);
        FMOD_VECTOR_serialize(vec_1, buf);
        var vec_2 = new FMOD_VECTOR();
        buffer_seek(buf, buffer_seek_start, 0);
        FMOD_VECTOR_deserialize(vec_2, buf);
        
        ASSERT_STRUCT_DEEP_EQUALS(vec_1, vec_2);
        
    });
    
    return suite;
}
