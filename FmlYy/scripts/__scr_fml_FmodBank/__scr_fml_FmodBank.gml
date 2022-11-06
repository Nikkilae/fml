
/// https://www.fmod.com/resources/documentation-api?version=2.02&page=studio-api-bank.html
function FmodBank() constructor
{
    bank_index = 0; /// @is {int}
    
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=studio-api-bank.html#studio_bank_isvalid
    /// @param {FmlError?} error = undefined
    /// @returns {bool}
    static is_valid = function(error = undefined)
    {
        var out_buf = __fml_buffers_fixed[@ buffer_bool];
        var res = __FML_Studio_Bank_isValid(bank_index, buffer_get_address(out_buf));
        __fml_set_error(error, res);
        return (res == FML_RESULT.OK) ? bool(buffer_peek(out_buf, 0, buffer_bool)) : undefined;
    }
    
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=studio-api-bank.html#studio_bank_getid
    /// @param {FMOD_GUID?} out_guid
    /// @param {FmlError?} error = undefined
    /// @returns {FMOD_GUID}
    static get_id = function(out_guid = undefined, error = undefined)
    {
        var out_buf = __fml_buffers_guid;
        var res = __FML_Studio_Bank_getID(bank_index, buffer_get_address(out_buf));
        __fml_set_error(error, res);
        if (res == FML_RESULT.OK) {
            if (out_guid == undefined) out_guid = new FMOD_GUID();
            buffer_seek(out_buf, buffer_seek_start, 0);
            FMOD_GUID_deserialize(out_guid, out_buf);
            return out_guid;
        }
        return undefined;
    }
    
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=studio-api-bank.html#studio_bank_getpath
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
            res = __FML_Studio_Bank_getPath(bank_index, buffer_get_address(out_buf));
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
    
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=studio-api-bank.html#studio_bank_unload
    /// @param {FmlError?} error = undefined
    /// @returns {bool}
    static unload = function(error = undefined)
    {
        var res = __FML_Studio_Bank_unload(bank_index);
        __fml_set_error(error, res);
        return (res == FML_RESULT.OK);
    }
    
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=studio-api-bank.html#studio_bank_loadsampledata
    /// @param {FmlError?} error = undefined
    /// @returns {bool}
    static load_sample_data = function(error = undefined)
    {
        var res = __FML_Studio_Bank_loadSampleData(bank_index);
        __fml_set_error(error, res);
        return (res == FML_RESULT.OK);
    }
    
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=studio-api-bank.html#studio_bank_unloadsampledata
    /// @param {FmlError?} error = undefined
    /// @returns {bool}
    static unload_sample_data = function(error = undefined)
    {
        var res = __FML_Studio_Bank_unloadSampleData(bank_index);
        __fml_set_error(error, res);
        return (res == FML_RESULT.OK);
    }
    
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=studio-api-bank.html#studio_bank_getloadingstate
    /// @param {FmlError?} error = undefined
    /// @returns {FMOD_STUDIO_LOADING_STATE}
    static get_loading_state = function(error = undefined)
    {
        var out_buf = __fml_buffers_fixed[@ buffer_s32];
        var res = __FML_Studio_Bank_getLoadingState(bank_index, buffer_get_address(out_buf));
        __fml_set_error(error, res);
        if (res == FML_RESULT.OK) {
            return buffer_peek(out_buf, 0, buffer_s32);
        }
        return undefined;
    }
    
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=studio-api-bank.html#studio_bank_getsampleloadingstate
    /// @param {FmlError?} error = undefined
    /// @returns {FMOD_STUDIO_LOADING_STATE}
    static get_sample_loading_state = function(error = undefined)
    {
        var out_buf = __fml_buffers_fixed[@ buffer_s32];
        var res = __FML_Studio_Bank_getSampleLoadingState(bank_index, buffer_get_address(out_buf));
        __fml_set_error(error, res);
        if (res == FML_RESULT.OK) {
            return buffer_peek(out_buf, 0, buffer_s32);
        }
        return undefined;
    }
    
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=studio-api-bank.html#studio_bank_getstringcount
    /// @param {FmlError?} error = undefined
    /// @returns {int}
    static get_string_count = function(error = undefined)
    {
        var out_buf = __fml_buffers_fixed[@ buffer_s32];
        var res = __FML_Studio_Bank_getStringCount(bank_index, buffer_get_address(out_buf));
        __fml_set_error(error, res);
        if (res == FML_RESULT.OK) {
            return buffer_peek(out_buf, 0, buffer_s32);
        }
        return undefined;
    }
    
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=studio-api-bank.html#studio_bank_getstringinfo
    /// @param {int} index
    /// @param {FMOD_GUID?} out_guid = undefined
    /// @param {FmlError?} error = undefined
    /// @returns {string}
    static get_string_info = function(index, out_guid = undefined, error = undefined)
    {
        var guid_out_buf = __fml_buffers_guid;
        var path_out_buf = buffer_create(0, buffer_fixed, 1);
        var res = undefined;
        for (var i = 0; i < 8; ++i) {
            var size = 32 * power(2, i);
            buffer_resize(path_out_buf, size);
            buffer_poke(path_out_buf, 0, __FML_BUFFER_SIZE_HINT_TYPE, size);
            res = __FML_Studio_Bank_getStringInfo(bank_index, index, buffer_get_address(guid_out_buf), buffer_get_address(path_out_buf));
            if (res == FML_RESULT.OK) {
                if (out_guid != undefined) {
                    buffer_seek(guid_out_buf, buffer_seek_start, 0);
                    FMOD_GUID_deserialize(out_guid, guid_out_buf);
                }
                __fml_set_error(error, res);
                return buffer_peek(path_out_buf, buffer_sizeof(__FML_BUFFER_SIZE_HINT_TYPE), buffer_string);
            }
            else if (res != FML_RESULT.TRUNCATED) {
                break;
            }
        }
        __fml_set_error(error, res);
        return undefined;
    }
    
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=studio-api-bank.html#studio_bank_geteventcount
    /// @param {FmlError?} error = undefined
    /// @returns {int}
    static get_event_count = function(error = undefined)
    {
        var out_buf = __fml_buffers_fixed[@ buffer_s32];
        var res = __FML_Studio_Bank_getEventCount(bank_index, buffer_get_address(out_buf));
        __fml_set_error(error, res);
        return (res == FML_RESULT.OK) ? buffer_peek(out_buf, 0, buffer_s32) : undefined;
    }
    
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=studio-api-bank.html#studio_bank_geteventlist
    /// @param {FmlError?} error = undefined
    /// @returns {FmodEventDescription[]}
    static get_event_list = function(error = undefined)
    {
        var event_count = get_event_count(error);
        if (event_count == undefined) {
            return undefined;
        }
        if (event_count == 0) {
            return [];
        }
        var count_out_buf = __fml_buffers_fixed[@ buffer_s32];
        var events_out_buf_size = buffer_sizeof(__FML_BUFFER_SIZE_HINT_TYPE) + buffer_sizeof(buffer_u64) * event_count;
        var events_out_buf = buffer_create(events_out_buf_size, buffer_fixed, 1);
        buffer_write(events_out_buf, __FML_BUFFER_SIZE_HINT_TYPE, events_out_buf_size);
        var res = __FML_Studio_Bank_getEventList(bank_index, buffer_get_address(events_out_buf), buffer_get_address(count_out_buf));
        __fml_set_error(error, res);
        if (res == FML_RESULT.OK) {
            var count = buffer_peek(count_out_buf, 0, buffer_s32);
            var events = array_create(count);
            for (var i = 0; i < count; ++i) {
                var event = new FmodEventDescription();
                event.event_description_index = real(buffer_read(events_out_buf, buffer_u64));
                events[@ i] = event;
            }
            buffer_delete(events_out_buf);
            return events;
        }
        buffer_delete(events_out_buf);
        return undefined;
    }
    
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=studio-api-bank.html#studio_bank_getbuscount
    /// @param {FmlError?} error = undefined
    /// @returns {int}
    static get_bus_count = function(error = undefined)
    {
        var out_buf = __fml_buffers_fixed[@ buffer_s32];
        var res = __FML_Studio_Bank_getBusCount(bank_index, buffer_get_address(out_buf));
        __fml_set_error(error, res);
        return (res == FML_RESULT.OK) ? buffer_peek(out_buf, 0, buffer_s32) : undefined;
    }
    
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=studio-api-bank.html#studio_bank_getbuslist
    /// @param {FmlError?} error = undefined
    /// @returns {FmodBus[]}
    static get_bus_list = function(error = undefined)
    {
        var bus_count = get_event_count(error);
        if (bus_count == undefined) {
            return undefined;
        }
        if (bus_count == 0) {
            return [];
        }
        var count_out_buf = __fml_buffers_fixed[@ buffer_s32];
        var buses_out_buf_size = buffer_sizeof(__FML_BUFFER_SIZE_HINT_TYPE) + buffer_sizeof(buffer_u64) * bus_count;
        var buses_out_buf = buffer_create(buses_out_buf_size, buffer_fixed, 1);
        buffer_write(buses_out_buf, __FML_BUFFER_SIZE_HINT_TYPE, buses_out_buf_size);
        var res = __FML_Studio_Bank_getBusList(bank_index, buffer_get_address(buses_out_buf), buffer_get_address(count_out_buf));
        __fml_set_error(error, res);
        if (res == FML_RESULT.OK) {
            var count = buffer_peek(count_out_buf, 0, buffer_s32);
            var buses = array_create(count);
            for (var i = 0; i < count; ++i) {
                var bus = new FmodBus();
                bus.bus_index = real(buffer_read(buses_out_buf, buffer_u64));
                buses[@ i] = bus;
            }
            buffer_delete(buses_out_buf);
            return buses;
        }
        buffer_delete(buses_out_buf);
        return undefined;
    }
    
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=studio-api-bank.html#studio_bank_getvcacount
    /// @param {FmlError?} error = undefined
    /// @returns {int}
    static get_vca_count = function(error = undefined)
    {
        var out_buf = __fml_buffers_fixed[@ buffer_s32];
        var res = __FML_Studio_Bank_getVCACount(bank_index, buffer_get_address(out_buf));
        __fml_set_error(error, res);
        return (res == FML_RESULT.OK) ? buffer_peek(out_buf, 0, buffer_s32) : undefined;
    }
    
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=studio-api-bank.html#studio_bank_getvcalist
    /// @param {FmlError?} error = undefined
    /// @returns {FmodVca[]}
    static get_vca_list = function(error = undefined)
    {
        var vca_count = get_event_count(error);
        if (vca_count == undefined) {
            return undefined;
        }
        if (vca_count == 0) {
            return [];
        }
        var count_out_buf = __fml_buffers_fixed[@ buffer_s32];
        var vcas_out_buf_size = buffer_sizeof(__FML_BUFFER_SIZE_HINT_TYPE) + buffer_sizeof(buffer_u64) * vca_count;
        var vcas_out_buf = buffer_create(vcas_out_buf_size, buffer_fixed, 1);
        buffer_write(vcas_out_buf, __FML_BUFFER_SIZE_HINT_TYPE, vcas_out_buf_size);
        var res = __FML_Studio_Bank_getVCAList(bank_index, buffer_get_address(vcas_out_buf), buffer_get_address(count_out_buf));
        __fml_set_error(error, res);
        if (res == FML_RESULT.OK) {
            var count = buffer_peek(count_out_buf, 0, buffer_s32);
            var vcas = array_create(count);
            for (var i = 0; i < count; ++i) {
                var vca = new FmodVca();
                vca.vca_index = real(buffer_read(vcas_out_buf, buffer_u64));
                vcas[@ i] = vca;
            }
            buffer_delete(vcas_out_buf);
            return vcas;
        }
        buffer_delete(vcas_out_buf);
        return undefined;
    }
    
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=studio-api-bank.html#studio_bank_getuserdata
    static _get_user_data = function() {}
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=studio-api-bank.html#studio_bank_setuserdata
    static _set_user_data = function() {}
}
