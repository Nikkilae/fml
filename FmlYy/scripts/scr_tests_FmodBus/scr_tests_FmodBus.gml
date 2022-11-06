
/// @returns {TestSuite}
function make_test_suite_FmodBus()
{
    var suite = new TestSuite("FmodBus");
    suite.is_implemented_func = function(test_name) {
        return variable_struct_exists(new FmodBus(), test_name);
    };
    
    suite.add_test("is_valid", function() {
        var error = new FmlError();
        var sys = __tests_create_system(error);
        var bus = sys.get_bus("bus:/");
        ASSERT_TRUE(bus.is_valid());
        sys.release();
        ASSERT_FALSE(bus.is_valid());
    });
    
    suite.add_test("get_id", function() {
        var error = new FmlError();
        var sys = __tests_create_system(error);
        var bus = sys.get_bus("bus:/");
        {
            ASSERT_EQUALS(bus.get_id(, error).toString(), "{1786d34f-f5b5-48f8-9b3d-668c7805f80e}");
            ASSERT_NO_FML_ERROR(error);
        }
        {
            var out_guid = new FMOD_GUID();
            var guid = bus.get_id(out_guid, error);
            ASSERT_EQUALS(guid, out_guid);
            ASSERT_EQUALS(guid.toString(), "{1786d34f-f5b5-48f8-9b3d-668c7805f80e}");
            ASSERT_NO_FML_ERROR(error);
        }
        sys.release();
        ASSERT_UNDEFINED(bus.get_id(, error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
    });
    
    suite.add_test("get_path", function() {
        var error = new FmlError();
        var sys = __tests_create_system(error);
        var bus = sys.get_bus("bus:/");
        ASSERT_EQUALS(bus.get_path(error), "bus:/");
        ASSERT_NO_FML_ERROR(error);
        sys.release();
        ASSERT_UNDEFINED(bus.get_path(error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
    });
    
    suite.add_test("get_volume", function() {
        var error = new FmlError();
        var sys = __tests_create_system(error);
        var bus = sys.get_bus("bus:/");
        {
            var volume = bus.get_volume(, error);
            ASSERT_NO_FML_ERROR(error);
            ASSERT_EQUALS(volume.volume, 1.0);
            ASSERT_EQUALS(volume.final_volume, 1.0);
        }
        {
            var out_volume = {};
            var volume = bus.get_volume(out_volume, error);
            ASSERT_EQUALS(volume, out_volume);
            ASSERT_NO_FML_ERROR(error);
            ASSERT_EQUALS(volume.volume, 1.0);
            ASSERT_EQUALS(volume.final_volume, 1.0);
        }
        sys.release();
        ASSERT_UNDEFINED(bus.get_volume(, error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
    });
    
    suite.add_test("set_volume", function() {
        var error = new FmlError();
        var sys = __tests_create_system(error);
        var bus = sys.get_bus("bus:/");
        
        ASSERT_TRUE(bus.set_volume(0.5, error));
        ASSERT_NO_FML_ERROR(error);
        ASSERT_EQUALS(bus.get_volume().volume, 0.5);
        
        sys.release();
        ASSERT_FALSE(bus.set_volume(0, error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
    });
    
    suite.add_test("get_paused", function() {
        var error = new FmlError();
        var sys = __tests_create_system(error);
        var bus = sys.get_bus("bus:/");
        
        ASSERT_FALSE(bus.get_paused(error));
        ASSERT_NO_FML_ERROR(error);
        
        sys.release();
        
        ASSERT_UNDEFINED(bus.get_paused(error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
    });
    
    suite.add_test("set_paused", function() {
        var error = new FmlError();
        var sys = __tests_create_system(error);
        var bus = sys.get_bus("bus:/");
        
        ASSERT_TRUE(bus.set_paused(false, error));
        ASSERT_NO_FML_ERROR(error);
        ASSERT_FALSE(bus.get_paused());
        
        ASSERT_TRUE(bus.set_paused(true, error));
        ASSERT_NO_FML_ERROR(error);
        ASSERT_TRUE(bus.get_paused());
        
        sys.release();
        
        ASSERT_FALSE(bus.set_paused(false, error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
    });
    
    suite.add_test("get_mute", function() {
        var error = new FmlError();
        var sys = __tests_create_system(error);
        var bus = sys.get_bus("bus:/");
        
        ASSERT_FALSE(bus.get_mute(error));
        ASSERT_NO_FML_ERROR(error);
        
        sys.release();
        
        ASSERT_UNDEFINED(bus.get_mute(error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
    });
    
    suite.add_test("set_mute", function() {
        var error = new FmlError();
        var sys = __tests_create_system(error);
        var bus = sys.get_bus("bus:/");
        
        ASSERT_TRUE(bus.set_mute(false, error));
        ASSERT_NO_FML_ERROR(error);
        ASSERT_FALSE(bus.get_mute());
        
        ASSERT_TRUE(bus.set_mute(true, error));
        ASSERT_NO_FML_ERROR(error);
        ASSERT_TRUE(bus.get_mute());
        
        sys.release();
        
        ASSERT_FALSE(bus.set_mute(false, error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
    });
    
    suite.add_test("stop_all_events", function() {
        var error = new FmlError();
        var sys = __tests_create_system(error, FMOD_STUDIO_INIT_SYNCHRONOUS_UPDATE);
        var bus = sys.get_bus("bus:/");
        
        var inst1 = sys.get_event("event:/Coin").create_instance();
        var inst2 = sys.get_event("event:/Coin").create_instance();
        inst1.start();
        inst2.start();
        ASSERT_EQUALS(inst1.get_playback_state(), FMOD_STUDIO_PLAYBACK_STATE.STARTING);
        ASSERT_EQUALS(inst2.get_playback_state(), FMOD_STUDIO_PLAYBACK_STATE.STARTING);
        
        ASSERT_TRUE(bus.stop_all_events(FMOD_STUDIO_STOP_MODE.IMMEDIATE, error));
        sys.update();
        ASSERT_NO_FML_ERROR(error);
        ASSERT_EQUALS(inst1.get_playback_state(), FMOD_STUDIO_PLAYBACK_STATE.STOPPED);
        ASSERT_EQUALS(inst2.get_playback_state(), FMOD_STUDIO_PLAYBACK_STATE.STOPPED);
        
        sys.release();
        ASSERT_FALSE(bus.stop_all_events(FMOD_STUDIO_STOP_MODE.IMMEDIATE, error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
    });
    
    suite.add_test("get_port_index", function() {
        var error = new FmlError();
        var sys = __tests_create_system(error);
        var bus = sys.get_bus("bus:/");
        
        // TODO: How to set up the system so that get_port_index
        //       is relevant and returns a valid index?
        ASSERT_UNDEFINED(bus.get_port_index(error));
        ASSERT_FML_ERROR(error, FML_RESULT.UNSUPPORTED);
        
        sys.release();
        
        ASSERT_UNDEFINED(bus.get_port_index(error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
    });
    
    suite.add_test("set_port_index", function() {
        var error = new FmlError();
        var sys = __tests_create_system(error);
        var bus = sys.get_bus("bus:/");
        
        // TODO: How to set up the system so that set_port_index
        //       is relevant and succeeds?
        ASSERT_FALSE(bus.set_port_index(0, error));
        ASSERT_FML_ERROR(error, FML_RESULT.UNSUPPORTED);
        
        sys.release();
        
        ASSERT_FALSE(bus.set_port_index(0, error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
    });
    
    suite.add_test("lock_channel_group", function() {
        var error = new FmlError();
        var sys = __tests_create_system(error, FMOD_STUDIO_INIT_SYNCHRONOUS_UPDATE);
        var bus = sys.get_bus("bus:/");
        
        ASSERT_TRUE(bus.lock_channel_group(error));
        ASSERT_NO_FML_ERROR(error);
        
        sys.release();
        
        ASSERT_FALSE(bus.lock_channel_group(error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
    });
    
    suite.add_test("unlock_channel_group", function() {
        var error = new FmlError();
        var sys = __tests_create_system(error, FMOD_STUDIO_INIT_SYNCHRONOUS_UPDATE);
        var bus = sys.get_bus("bus:/");
        
        ASSERT_FALSE(bus.unlock_channel_group(error));
        ASSERT_FML_ERROR(error, FML_RESULT.NOT_LOCKED);
        
        bus.lock_channel_group();
        
        ASSERT_TRUE(bus.unlock_channel_group(error));
        ASSERT_NO_FML_ERROR(error);
        
        sys.release();
        
        ASSERT_FALSE(bus.unlock_channel_group(error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
    });
    
    suite.add_test("get_channel_group", function() {
        var error = new FmlError();
        var sys = __tests_create_system(error, FMOD_STUDIO_INIT_SYNCHRONOUS_UPDATE);
        var bus = sys.get_bus("bus:/");
        
        sys.update();
        
        {
            var group = bus.get_channel_group(, error);
            ASSERT_NO_FML_ERROR(error);
            ASSERT_TRUE(group.channel_group_index > 0);
        }
        {
            var out_group = new FmodChannelGroup();
            var group = bus.get_channel_group(out_group, error);
            ASSERT_EQUALS(group, out_group);
            ASSERT_NO_FML_ERROR(error);
            ASSERT_TRUE(group.channel_group_index > 0);
        }
        
        sys.release();
        
        ASSERT_UNDEFINED(bus.get_channel_group(, error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
    });
    
    suite.add_test("get_cpu_usage", function() {
        var error = new FmlError();
        var sys = __tests_create_system(error);
        var bus = sys.get_bus("bus:/");
        
        {
            var cpu_usage = bus.get_cpu_usage(, error);
            ASSERT_NO_FML_ERROR(error);
            ASSERT_TRUE(cpu_usage.inclusive >= 0);
            ASSERT_TRUE(cpu_usage.exclusive >= 0);
        }
        {
            var out_cpu_usage = {};
            var cpu_usage = bus.get_cpu_usage(out_cpu_usage, error);
            ASSERT_EQUALS(cpu_usage, out_cpu_usage);
            ASSERT_NO_FML_ERROR(error);
            ASSERT_TRUE(cpu_usage.inclusive >= 0);
            ASSERT_TRUE(cpu_usage.exclusive >= 0);
        }
        
        sys.release();
        
        ASSERT_UNDEFINED(bus.get_cpu_usage(, error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
    });
    
    suite.add_test("get_memory_usage", function() {
        var error = new FmlError();
        var sys = __tests_create_system(error);
        var bus = sys.get_bus("bus:/");
        
        {
            var mem_usage = bus.get_memory_usage(, error);
            ASSERT_NO_FML_ERROR(error);
            ASSERT_TRUE(mem_usage.inclusive >= 0);
            ASSERT_TRUE(mem_usage.exclusive >= 0);
            ASSERT_TRUE(mem_usage.sampledata >= 0);
        }
        {
            var out_mem_usage = new FMOD_STUDIO_MEMORY_USAGE();
            var mem_usage = bus.get_memory_usage(out_mem_usage, error);
            ASSERT_EQUALS(mem_usage, out_mem_usage);
            ASSERT_NO_FML_ERROR(error);
            ASSERT_TRUE(mem_usage.inclusive >= 0);
            ASSERT_TRUE(mem_usage.exclusive >= 0);
            ASSERT_TRUE(mem_usage.sampledata >= 0);
        }
        
        sys.release();
        
        ASSERT_UNDEFINED(bus.get_memory_usage(, error));
        ASSERT_FML_ERROR(error, FML_RESULT.INVALID_HANDLE);
    });
    
    return suite;
}
