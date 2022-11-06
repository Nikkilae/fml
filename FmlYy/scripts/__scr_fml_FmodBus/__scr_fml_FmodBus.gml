
/// https://www.fmod.com/docs/2.02/api/studio-api-bus.html
function FmodBus() constructor
{
    bus_index = 0;  /// @is {int}
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-bus.html#studio_bus_isvalid
    /// @param {FmlError?} error = undefined
    /// @returns {bool}
    static is_valid = function(error = undefined)
    {
        var out_buf = __fml_buffers_fixed[@ buffer_bool];
        var res = __FML_Studio_Bus_isValid(bus_index, buffer_get_address(out_buf));
        __fml_set_error(error, res);
        return (res == FML_RESULT.OK) ? bool(buffer_peek(out_buf, 0, buffer_bool)) : undefined;
    }
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-bus.html#studio_bus_getid
    /// @param {FMOD_GUID?} out_guid = undefined
    /// @param {FmlError?} error = undefined
    /// @returns {FMOD_GUID}
    static get_id = function(out_guid = undefined, error = undefined)
    {
        var out_buf = __fml_buffers_guid;
        var res = __FML_Studio_Bus_getID(bus_index, buffer_get_address(out_buf));
        __fml_set_error(error, res);
        if (res == FML_RESULT.OK) {
            if (out_guid == undefined) out_guid = new FMOD_GUID();
            buffer_seek(out_buf, buffer_seek_start, 0);
            FMOD_GUID_deserialize(out_guid, out_buf);
            return out_guid;
        }
        return undefined;
    }
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-bus.html#studio_bus_getpath
    /// @param {FmlError?} error = undefined
    /// @returns {string}
    static get_path = function(error = undefined)
    {
        static out_buf = buffer_create(0, buffer_fixed, 1);
        var res = undefined;
        for (var i = 0; i < 8; ++i) {
            var size = 32 * power(2, i);
            buffer_resize(out_buf, size);
            buffer_poke(out_buf, 0, __FML_BUFFER_SIZE_HINT_TYPE, size);
            res = __FML_Studio_Bus_getPath(bus_index, buffer_get_address(out_buf));
            if (res == FML_RESULT.OK) {
                __fml_set_error(error, res);
                return buffer_peek(out_buf, buffer_sizeof(__FML_BUFFER_SIZE_HINT_TYPE), buffer_string);
            }
            else if (res != FML_RESULT.TRUNCATED) {
                break;
            }
        }
        __fml_set_error(error, res);
        return undefined;
    }
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-bus.html#studio_bus_getvolume
    /// @param {struct?} out_struct = undefined
    /// @param {FmlError?} error = undefined
    /// @returns {struct}
    static get_volume = function(out_struct = undefined, error = undefined)
    {
        var out_buf = buffer_create(buffer_sizeof(buffer_f32) * 2, buffer_fixed, buffer_sizeof(buffer_f32));
        var res = __FML_Studio_Bus_getVolume(bus_index, buffer_get_address(out_buf));
        __fml_set_error(error, res);
        var volume = buffer_read(out_buf, buffer_f32);
        var final_volume = buffer_read(out_buf, buffer_f32);
        buffer_delete(out_buf);
        if (res == FML_RESULT.OK) {
            if (out_struct == undefined) out_struct = {};
            out_struct.volume = volume;
            out_struct.final_volume = final_volume;
            return out_struct;
        }
        return undefined;
    }
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-bus.html#studio_bus_setvolume
    /// @param {number} volume
    /// @param {FmlError?} error = undefined
    /// @returns {bool}
    static set_volume = function(volume, error = undefined)
    {
        var res = __FML_Studio_Bus_setVolume(bus_index, volume);
        __fml_set_error(error, res);
        return (res == FML_RESULT.OK);
    }
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-bus.html#studio_bus_getpaused
    /// @param {FmlError?} error = undefined
    /// @returns {bool}
    static get_paused = function(error = undefined)
    {
        var out_buf = __fml_buffers_fixed[@ buffer_bool];
        var res = __FML_Studio_Bus_getPaused(bus_index, buffer_get_address(out_buf));
        __fml_set_error(error, res);
        return (res == FML_RESULT.OK) ? bool(buffer_peek(out_buf, 0, buffer_bool)) : undefined;
    }
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-bus.html#studio_bus_setpaused
    /// @param {bool} paused
    /// @param {FmlError?} error = undefined
    /// @returns {bool}
    static set_paused = function(paused, error = undefined)
    {
        var res = __FML_Studio_Bus_setPaused(bus_index, paused);
        __fml_set_error(error, res);
        return (res == FML_RESULT.OK);
    }
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-bus.html#studio_bus_getmute
    /// @param {FmlError?} error = undefined
    /// @returns {bool}
    static get_mute = function(error = undefined)
    {
        var out_buf = __fml_buffers_fixed[@ buffer_bool];
        var res = __FML_Studio_Bus_getMute(bus_index, buffer_get_address(out_buf));
        __fml_set_error(error, res);
        return (res == FML_RESULT.OK) ? bool(buffer_peek(out_buf, 0, buffer_bool)) : undefined;
    }
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-bus.html#studio_bus_setmute
    /// @param {bool} mute
    /// @param {FmlError?} error = undefined
    /// @returns {bool}
    static set_mute = function(mute, error = undefined)
    {
        var res = __FML_Studio_Bus_setMute(bus_index, mute);
        __fml_set_error(error, res);
        return (res == FML_RESULT.OK);
    }
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-bus.html#studio_bus_stopallevents
    /// @param {FMOD_STUDIO_STOP_MODE} mode
    /// @param {FmlError?} error = undefined
    /// @returns {bool}
    static stop_all_events = function(mode, error = undefined)
    {
        var res = __FML_Studio_Bus_stopAllEvents(bus_index, mode);
        __fml_set_error(error, res);
        return (res == FML_RESULT.OK);
    }
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-bus.html#studio_bus_getportindex
    /// @param {FmlError?} error = undefined
    /// @returns {int}
    static get_port_index = function(error = undefined)
    {
        var out_buf = __fml_buffers_fixed[@ buffer_u64];
        var res = __FML_Studio_Bus_getPortIndex(bus_index, buffer_get_address(out_buf));
        __fml_set_error(error, res);
        return (res == FML_RESULT.OK) ? buffer_peek(out_buf, 0, buffer_u64) : undefined;
    }
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-bus.html#studio_bus_setportindex
    /// @param {int} index
    /// @param {FmlError?} error = undefined
    /// @returns {bool}
    static set_port_index = function(index, error = undefined)
    {
        var res = __FML_Studio_Bus_setPortIndex(bus_index, index);
        __fml_set_error(error, res);
        return (res == FML_RESULT.OK);
    }
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-bus.html#studio_bus_lockchannelgroup
    /// @param {FmlError?} error = undefined
    /// @returns {bool}
    static lock_channel_group = function(error = undefined)
    {
        var res = __FML_Studio_Bus_lockChannelGroup(bus_index);
        __fml_set_error(error, res);
        return (res == FML_RESULT.OK);
    }
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-bus.html#studio_bus_unlockchannelgroup
    /// @param {FmlError?} error = undefined
    /// @returns {bool}
    static unlock_channel_group = function(error = undefined)
    {
        var res = __FML_Studio_Bus_unlockChannelGroup(bus_index);
        __fml_set_error(error, res);
        return (res == FML_RESULT.OK);
    }
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-bus.html#studio_bus_getchannelgroup
    /// @param {FmodChannelGroup?} out_channel_group = undefined
    /// @param {FmlError?} error = undefined
    /// @returns {FmodChannelGroup}
    static get_channel_group = function(out_channel_group = undefined, error = undefined)
    {
        var out_buf = __fml_buffers_fixed[@ buffer_u64];
        var res = __FML_Studio_Bus_getChannelGroup(bus_index, buffer_get_address(out_buf));
        __fml_set_error(error, res);
        if (res == FML_RESULT.OK) {
            if (out_channel_group == undefined) out_channel_group = new FmodChannelGroup();
            out_channel_group.channel_group_index = buffer_peek(out_buf, 0, buffer_u64);
            return out_channel_group;
        }
        return undefined;
    }
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-bus.html#studio_bus_getcpuusage
    /// @param {struct?} out_struct = undefined
    /// @param {FmlError?} error = undefined
    /// @returns {struct}
    static get_cpu_usage = function(out_struct = undefined, error = undefined)
    {
        var out_buf = buffer_create(buffer_sizeof(buffer_u32) * 2, buffer_fixed, buffer_sizeof(buffer_u32));
        var res = __FML_Studio_Bus_getCPUUsage(bus_index, buffer_get_address(out_buf));
        __fml_set_error(error, res);
        var exclusive = buffer_read(out_buf, buffer_u32);
        var inclusive = buffer_read(out_buf, buffer_u32);
        buffer_delete(out_buf);
        if (res == FML_RESULT.OK) {
            if (out_struct == undefined) out_struct = {};
            out_struct.exclusive = exclusive;
            out_struct.inclusive = inclusive;
            return out_struct;
        }
        return undefined;
    }
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-bus.html#studio_bus_getmemoryusage
    /// @param {FMOD_STUDIO_MEMORY_USAGE?} out_usage = undefined
    /// @param {FmlError?} error = undefined
    /// @returns {FMOD_STUDIO_MEMORY_USAGE}
    static get_memory_usage = function(out_usage = undefined, error = undefined)
    {
        var out_buf = __fml_buffers_studio_memory_usage;
        var res = __FML_Studio_Bus_getMemoryUsage(bus_index, buffer_get_address(out_buf));
        __fml_set_error(error, res);
        if (res == FML_RESULT.OK) {
            buffer_seek(out_buf, buffer_seek_start, 0);
            if (out_usage == undefined) out_usage = new FMOD_STUDIO_MEMORY_USAGE();
            FMOD_STUDIO_MEMORY_USAGE_deserialize(out_usage, out_buf);
            return out_usage;
        }
        return undefined;
    }
}
