
/// https://www.fmod.com/docs/2.02/api/studio-api-system.html#studio_system_create
/// @param {int?} header_version = FMOD_VERSION
/// @param {FmodStudioSystem?} out_studio_system = undefined
/// @param {FmlError?} error = undefined
/// @returns {FmodStudioSystem}
function FmodStudioSystem_Create(header_version = FMOD_VERSION, out_studio_system = undefined, error = undefined)
{
    var out_buf = __fml_buffers_fixed[@ buffer_u64];
    var res = __FML_Studio_System_create(header_version, buffer_get_address(out_buf));
    __fml_set_error(error, res);
    if (res == FML_RESULT.OK) {
        if (out_studio_system == undefined) out_studio_system = new FmodStudioSystem();
        out_studio_system.studio_system_index = real(buffer_peek(out_buf, 0, buffer_u64));
        return out_studio_system;
    }
    return undefined;
}

/// https://www.fmod.com/docs/2.02/api/studio-api-system.html
function FmodStudioSystem() constructor
{
    studio_system_index = 0;  /// @is {int}
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-system.html#studio_system_setadvancedsettings
    /// @param {FMOD_STUDIO_ADVANCEDSETTINGS} settings
    /// @param {FmlError?} error = undefined
    /// @returns {bool}
    static set_advanced_settings = function(settings, error = undefined)
    {
        var buf_ptr = FMOD_STUDIO_ADVANCEDSETTINGS_as_buf_ptr(settings);
        var res = __FML_Studio_System_setAdvancedSettings(studio_system_index, buf_ptr);
        __fml_set_error(error, res);
        return (res == FML_RESULT.OK);
    }
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-system.html#studio_system_getadvancedsettings
    /// @param {FMOD_STUDIO_ADVANCEDSETTINGS?} out_settings = undefined
    /// @param {FmlError?} error = undefined
    /// @returns {FMOD_STUDIO_ADVANCEDSETTINGS}
    static get_advanced_settings = function(out_settings = undefined, error = undefined)
    {
        static out_buf = buffer_create(0, buffer_fixed, 1);
        var res = undefined;
        for (var i = 0; i < 8; ++i) {
            var size = 32 * power(2, i);
            buffer_resize(out_buf, size);
            buffer_poke(out_buf, 0, __FML_BUFFER_SIZE_HINT_TYPE, size);
            res = __FML_Studio_System_getAdvancedSettings(studio_system_index, buffer_get_address(out_buf));
            if (res == FML_RESULT.OK) {
                buffer_seek(out_buf, buffer_seek_start, 0);
                if (out_settings == undefined) out_settings = new FMOD_STUDIO_ADVANCEDSETTINGS();
                FMOD_STUDIO_ADVANCEDSETTINGS_deserialize(out_settings, out_buf);
                __fml_set_error(error, res);
                return out_settings;
            }
            else if (res != FML_RESULT.BUFFER_TOO_SMALL) {
                break;
            }
        }
        __fml_set_error(error, res);
        return undefined;
    }
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-system.html#studio_system_initialize
    /// @param {int} max_channels
    /// @param {int} studio_flags   A bitmask of FMOD_STUDIO_INIT_xx values.
    /// @param {int} core_flags     A bitmask of FMOD_INIT_xx values.
    /// @param {FmlError?} error = undefined
    /// @returns {bool}
    static initialize = function(max_channels, studio_flags, core_flags, error = undefined)
    {
        var res = __FML_Studio_System_initialize(studio_system_index, max_channels, studio_flags, core_flags);
        __fml_set_error(error, res);
        return (res == FML_RESULT.OK);
    }
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-system.html#studio_system_release
    /// @param {FmlError?} error = undefined
    /// @returns {bool}
    static release = function(error = undefined)
    {
        var res = __FML_Studio_System_release(studio_system_index);
        __fml_set_error(error, res);
        return (res == FML_RESULT.OK);
    }
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-system.html#studio_system_isvalid
    /// @param {FmlError?} error = undefined
    /// @returns {bool}
    static is_valid = function(error = undefined)
    {
        var out_buf = __fml_buffers_fixed[@ buffer_bool];
        var res = __FML_Studio_System_isValid(studio_system_index, buffer_get_address(out_buf));
        __fml_set_error(error, res);
        return (res == FML_RESULT.OK) ? bool(buffer_peek(out_buf, 0, buffer_bool)) : undefined;
    }
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-system.html#studio_system_update
    /// @param {FmlError?} error = undefined
    /// @returns {bool}
    static update = function(error = undefined)
    {
        var res = __FML_Studio_System_update(studio_system_index);
        __fml_set_error(error, res);
        return (res == FML_RESULT.OK);
    }
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-system.html#studio_system_flushcommands
    /// @param {FmlError?} error = undefined
    /// @returns {bool}
    static flush_commands = function(error = undefined)
    {
        var res = __FML_Studio_System_flushCommands(studio_system_index);
        __fml_set_error(error, res);
        return (res == FML_RESULT.OK);
    }
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-system.html#studio_system_flushsampleloading
    /// @param {FmlError?} error = undefined
    /// @returns {bool}
    static flush_sample_loading = function(error = undefined)
    {
        var res = __FML_Studio_System_flushSampleLoading(studio_system_index);
        __fml_set_error(error, res);
        return (res == FML_RESULT.OK);
    }
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-system.html#studio_system_getcoresystem
    /// @param {FmodSystem} out_system = undefined
    /// @param {FmlError?} error = undefined
    /// @returns {FmodSystem}
    static get_core_system = function(out_system = undefined, error = undefined)
    {
        var out_buf = __fml_buffers_fixed[@ buffer_u64];
        var res = __FML_Studio_System_getCoreSystem(studio_system_index, buffer_get_address(out_buf));
        __fml_set_error(error, res);
        if (res == FML_RESULT.OK) {
            if (out_system == undefined) out_system = new FmodSystem();
            out_system.core_system_index = real(buffer_peek(out_buf, 0, buffer_u64));
            return out_system;
        }
        return undefined;
    }
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-system.html#studio_system_getevent
    /// @param {string} path
    /// @param {FmodEventDescription?} out_event_description = undefined
    /// @param {FmlError?} error = undefined
    /// @returns {FmodEventDescription}
    static get_event = function(path, out_event_description = undefined, error = undefined)
    {
        var out_buf = __fml_buffers_fixed[@ buffer_u64];
        var res = __FML_Studio_System_getEvent(studio_system_index, path, buffer_get_address(out_buf));
        __fml_set_error(error, res);
        if (res == FML_RESULT.OK) {
            if (out_event_description == undefined) out_event_description = new FmodEventDescription();
            out_event_description.event_description_index = real(buffer_peek(out_buf, 0, buffer_u64));
            return out_event_description;
        }
        return undefined;
    }
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-system.html#studio_system_getbus
    /// @param {string} path
    /// @param {FmodBus?} out_bus = undefined
    /// @param {FmlError?} error = undefined
    /// @returns {FmodBus}
    static get_bus = function(path, out_bus = undefined, error = undefined)
    {
        var out_buf = __fml_buffers_fixed[@ buffer_u64];
        var res = __FML_Studio_System_getBus(studio_system_index, path, buffer_get_address(out_buf));
        __fml_set_error(error, res);
        if (res == FML_RESULT.OK) {
            if (out_bus == undefined) out_bus = new FmodBus();
            out_bus.bus_index = real(buffer_peek(out_buf, 0, buffer_u64));
            return out_bus;
        }
        return undefined;
    }
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-system.html#studio_system_getvca
    /// @param {string} path
    /// @param {FmodVca?} out_vca = undefined
    /// @param {FmlError?} error = undefined
    /// @returns {FmodVca}
    static get_vca = function(path, out_vca = undefined, error = undefined)
    {
        var out_buf = __fml_buffers_fixed[@ buffer_u64];
        var res = __FML_Studio_System_getVCA(studio_system_index, path, buffer_get_address(out_buf));
        __fml_set_error(error, res);
        if (res == FML_RESULT.OK) {
            if (out_vca == undefined) out_vca = new FmodVca();
            out_vca.vca_index = real(buffer_peek(out_buf, 0, buffer_u64));
            return out_vca;
        }
        return undefined;
    }
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-system.html#studio_system_getbank
    /// @param {string} path
    /// @param {FmodBank?} out_bank = undefined
    /// @param {FmlError?} error = undefined
    /// @returns {FmodBank}
    static get_bank = function(path, out_bank = undefined, error = undefined)
    {
        var out_buf = __fml_buffers_fixed[@ buffer_u64];
        var res = __FML_Studio_System_getBank(studio_system_index, path, buffer_get_address(out_buf));
        __fml_set_error(error, res);
        if (res == FML_RESULT.OK) {
            if (out_bank == undefined) out_bank = new FmodBank();
            out_bank.bank_index = real(buffer_peek(out_buf, 0, buffer_u64));
            return out_bank;
        }
        return undefined;
    }
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-system.html#studio_system_geteventbyid
    /// @param {FMOD_GUID} guid
    /// @param {FmodEventDescription?} out_event_description = undefined
    /// @param {FmlError?} error = undefined
    /// @returns {FmodEventDescription}
    static get_event_by_id = function(guid, out_event_description = undefined, error = undefined)
    {
        var out_buf = __fml_buffers_fixed[@ buffer_u64];
        var res = __FML_Studio_System_getEventByID(studio_system_index, FMOD_GUID_as_buf_ptr(guid), buffer_get_address(out_buf));
        __fml_set_error(error, res);
        if (res == FML_RESULT.OK) {
            if (out_event_description == undefined) out_event_description = new FmodEventDescription();
            out_event_description.event_description_index = real(buffer_peek(out_buf, 0, buffer_u64));
            return out_event_description;
        }
        return undefined;
    }
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-system.html#studio_system_getbusbyid
    /// @param {FMOD_GUID} guid
    /// @param {FmodBus?} out_bus = undefined
    /// @param {FmlError?} error = undefined
    /// @returns {FmodBus}
    static get_bus_by_id = function(guid, out_bus = undefined, error = undefined)
    {
        var out_buf = __fml_buffers_fixed[@ buffer_u64];
        var res = __FML_Studio_System_getBusByID(studio_system_index, FMOD_GUID_as_buf_ptr(guid), buffer_get_address(out_buf));
        __fml_set_error(error, res);
        if (res == FML_RESULT.OK) {
            if (out_bus == undefined) out_bus = new FmodBus();
            out_bus.bus_index = real(buffer_peek(out_buf, 0, buffer_u64));
            return out_bus;
        }
        return undefined;
    }
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-system.html#studio_system_getvcabyid
    /// @param {FMOD_GUID} guid
    /// @param {FmodVca?} out_vca = undefined
    /// @param {FmlError?} error = undefined
    /// @returns {FmodVca}
    static get_vca_by_id = function(guid, out_vca = undefined, error = undefined)
    {
        var out_buf = __fml_buffers_fixed[@ buffer_u64];
        var res = __FML_Studio_System_getVCAByID(studio_system_index, FMOD_GUID_as_buf_ptr(guid), buffer_get_address(out_buf));
        __fml_set_error(error, res);
        if (res == FML_RESULT.OK) {
            if (out_vca == undefined) out_vca = new FmodVca();
            out_vca.vca_index = real(buffer_peek(out_buf, 0, buffer_u64));
            return out_vca;
        }
        return undefined;
    }
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-system.html#studio_system_getbankbyid
    /// @param {FMOD_GUID} guid
    /// @param {FmodBank?} out_bank = undefined
    /// @param {FmlError?} error = undefined
    /// @returns {FmodBank}
    static get_bank_by_id = function(guid, out_bank = undefined, error = undefined)
    {
        var out_buf = __fml_buffers_fixed[@ buffer_u64];
        var res = __FML_Studio_System_getBankByID(studio_system_index, FMOD_GUID_as_buf_ptr(guid), buffer_get_address(out_buf));
        __fml_set_error(error, res);
        if (res == FML_RESULT.OK) {
            if (out_bank == undefined) out_bank = new FmodBank();
            out_bank.bank_index = real(buffer_peek(out_buf, 0, buffer_u64));
            return out_bank;
        }
        return undefined;
    }
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-system.html#studio_system_getsoundinfo
    static _get_sound_info = function() {}
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-system.html#studio_system_getparameterdescriptionbyname
    /// @param {string} name
    /// @param {FMOD_STUDIO_PARAMETER_DESCRIPTION?} out_description = undefined
    /// @param {FmlError?} error = undefined
    /// @returns {FMOD_STUDIO_PARAMETER_DESCRIPTION}
    static get_parameter_description_by_name = function(name, out_description = undefined, error = undefined)
    {
        static out_buf = buffer_create(0, buffer_fixed, 1);
        var res = undefined;
        for (var i = 0; i < 8; ++i) {
            var size = 64 * power(2, i);
            buffer_resize(out_buf, size);
            buffer_poke(out_buf, 0, __FML_BUFFER_SIZE_HINT_TYPE, size);
            res = __FML_Studio_System_getParameterDescriptionByName(studio_system_index, name, buffer_get_address(out_buf));
            if (res == FML_RESULT.OK) {
                buffer_seek(out_buf, buffer_seek_start, 0);
                if (out_description == undefined) out_description = new FMOD_STUDIO_PARAMETER_DESCRIPTION();
                FMOD_STUDIO_PARAMETER_DESCRIPTION_deserialize(out_description, out_buf);
                __fml_set_error(error, res);
                return out_description;
            }
            else if (res != FML_RESULT.TRUNCATED && res != FML_RESULT.BUFFER_TOO_SMALL) {
                break;
            }
        }
        __fml_set_error(error, res);
        return undefined;
    }
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-system.html#studio_system_getparameterdescriptionbyid
    /// @param {FMOD_STUDIO_PARAMETER_ID} param_id
    /// @param {FMOD_STUDIO_PARAMETER_DESCRIPTION?} out_description = undefined
    /// @param {FmlError?} error = undefined
    /// @returns {FMOD_STUDIO_PARAMETER_DESCRIPTION}
    static get_parameter_description_by_id = function(param_id, out_description = undefined, error = undefined)
    {
        static out_buf = buffer_create(0, buffer_fixed, 1);
        var res = undefined;
        for (var i = 0; i < 8; ++i) {
            var size = 64 * power(2, i);
            buffer_resize(out_buf, size);
            buffer_seek(out_buf, buffer_seek_start, 0);
            buffer_poke(out_buf, 0, __FML_BUFFER_SIZE_HINT_TYPE, size);
            var param_id_buf_ptr = FMOD_STUDIO_PARAMETER_ID_as_buf_ptr(param_id);
            res = __FML_Studio_System_getParameterDescriptionByID(studio_system_index, param_id_buf_ptr, buffer_get_address(out_buf));
            if (res == FML_RESULT.OK) {
                buffer_seek(out_buf, buffer_seek_start, 0);
                if (out_description == undefined) out_description = new FMOD_STUDIO_PARAMETER_DESCRIPTION();
                FMOD_STUDIO_PARAMETER_DESCRIPTION_deserialize(out_description, out_buf);
                __fml_set_error(error, res);
                return out_description;
            }
            else if (res != FML_RESULT.TRUNCATED && res != FML_RESULT.BUFFER_TOO_SMALL) {
                break;
            }
        }
        __fml_set_error(error, res);
        return undefined;
    }
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-system.html#studio_system_getparameterlabelbyname
    /// @param {string} name
    /// @param {int} label_index
    /// @param {FmlError?} error = undefined
    /// @returns {string}
    static get_parameter_label_by_name = function(name, label_index, error = undefined)
    {
        static out_buf = buffer_create(0, buffer_fixed, 1);
        var res = undefined;
        for (var i = 0; i < 8; ++i) {
            var size = 32 * power(2, i);
            buffer_resize(out_buf, size);
            buffer_poke(out_buf, 0, __FML_BUFFER_SIZE_HINT_TYPE, size);
            res = __FML_Studio_System_getParameterLabelByName(studio_system_index, name, label_index, buffer_get_address(out_buf));
            if (res == FML_RESULT.OK) {
                __fml_set_error(error, res);
                return buffer_peek(out_buf, 0, buffer_string);
            }
            else if (res != FML_RESULT.TRUNCATED) {
                break;
            }
        }
        __fml_set_error(error, res);
        return undefined;
    }
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-system.html#studio_system_getparameterlabelbyid
    /// @param {FMOD_STUDIO_PARAMETER_ID} parameter_id
    /// @param {int} label_index
    /// @param {FmlError?} error = undefined
    /// @returns {string}
    static get_parameter_label_by_id = function(parameter_id, label_index, error = undefined)
    {
        static out_buf = buffer_create(0, buffer_fixed, 1);
        var id_buf_ptr = FMOD_STUDIO_PARAMETER_ID_as_buf_ptr(parameter_id);
        var res = undefined;
        for (var i = 0; i < 8; ++i) {
            var size = 32 * power(2, i);
            buffer_resize(out_buf, size);
            buffer_poke(out_buf, 0, __FML_BUFFER_SIZE_HINT_TYPE, size);
            res = __FML_Studio_System_getParameterLabelByID(studio_system_index, id_buf_ptr, label_index, buffer_get_address(out_buf));
            if (res == FML_RESULT.OK) {
                __fml_set_error(error, res);
                return buffer_peek(out_buf, 0, buffer_string);
            }
            else if (res != FML_RESULT.TRUNCATED) {
                break;
            }
        }
        __fml_set_error(error, res);
        return undefined;
    }
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-system.html#studio_system_getparameterbyid
    /// @param {FMOD_STUDIO_PARAMETER_ID} parameter_id
    /// @param {struct?} out_struct = undefined
    /// @param {FmlError?} error = undefined
    /// @returns {struct}
    static get_parameter_by_id = function(parameter_id, out_struct = undefined, error = undefined)
    {
        var out_buf = buffer_create(8, buffer_fixed, 4);
        var id_buf_ptr = FMOD_STUDIO_PARAMETER_ID_as_buf_ptr(parameter_id);
        var res = __FML_Studio_System_getParameterByID(studio_system_index, id_buf_ptr, buffer_get_address(out_buf));
        __fml_set_error(error, res);
        var value = buffer_read(out_buf, buffer_f32);
        var final_value = buffer_read(out_buf, buffer_f32);
        buffer_delete(out_buf);
        if (res == FML_RESULT.OK) {
            if (out_struct == undefined) out_struct = {};
            out_struct.value = value;
            out_struct.final_value = final_value;
            return out_struct;
        }
        return undefined;
    }
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-system.html#studio_system_setparameterbyid
    /// @param {FMOD_STUDIO_PARAMETER_ID} parameter_id
    /// @param {number} value
    /// @param {bool?} ignore_seek_speed = false
    /// @param {FmlError?} error = undefined
    /// @returns {bool}
    static set_parameter_by_id = function(parameter_id, value, ignore_seek_speed = false, error = undefined)
    {
        var id_buf_ptr = FMOD_STUDIO_PARAMETER_ID_as_buf_ptr(parameter_id);
        var res = __FML_Studio_System_setParameterByID(studio_system_index, id_buf_ptr, value, ignore_seek_speed);
        __fml_set_error(error, res);
        return (res == FML_RESULT.OK);
    }
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-system.html#studio_system_setparameterbyidwithlabel
    /// @param {FMOD_STUDIO_PARAMETER_ID} parameter_id
    /// @param {string} label
    /// @param {bool?} ignore_seek_speed = false
    /// @param {FmlError?} error = undefined
    /// @returns {bool}
    static set_parameter_by_id_with_label = function(parameter_id, label, ignore_seek_speed = false, error = undefined)
    {
        var id_buf_ptr = FMOD_STUDIO_PARAMETER_ID_as_buf_ptr(parameter_id);
        var res = __FML_Studio_System_setParameterByIDWithLabel(studio_system_index, id_buf_ptr, label, ignore_seek_speed);
        __fml_set_error(error, res);
        return (res == FML_RESULT.OK);
    }
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-system.html#studio_system_setparametersbyids
    /// @param {FMOD_STUDIO_PARAMETER_ID[]} parameter_ids
    /// @param {number[]} values
    /// @param {bool?} ignore_seek_speed = false
    /// @param {FmlError?} error = undefined
    /// @returns {bool}
    static set_parameters_by_ids = function(parameter_ids, values, ignore_seek_speed = false, error = undefined)
    {
        var count = min(array_length(parameter_ids), array_length(values));
        var buf_size = count * (8 + 4); // count times size of parameter id and size of value
        var ids_and_values_buf = buffer_create(buf_size, buffer_fixed, 4);
        for (var i = 0; i < count; ++i) {
            FMOD_STUDIO_PARAMETER_ID_serialize(parameter_ids[@ i], ids_and_values_buf);
            buffer_write(ids_and_values_buf, buffer_f32, values[@ i]);
        }
        var res = __FML_Studio_System_setParametersByIDs(studio_system_index, buffer_get_address(ids_and_values_buf), count, ignore_seek_speed);
        __fml_set_error(error, res);
        buffer_delete(ids_and_values_buf);
        return (res == FML_RESULT.OK);
    }
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-system.html#studio_system_getparameterbyname
    /// @param {string} name
    /// @param {struct?} out_struct = undefined
    /// @param {FmlError?} error = undefined
    /// @returns {struct}
    static get_parameter_by_name = function(name, out_struct = undefined, error = undefined)
    {
        var out_buf = buffer_create(8, buffer_fixed, 4);
        var res = __FML_Studio_System_getParameterByName(studio_system_index, name, buffer_get_address(out_buf));
        __fml_set_error(error, res);
        var value = buffer_read(out_buf, buffer_f32);
        var final_value = buffer_read(out_buf, buffer_f32);
        buffer_delete(out_buf);
        if (res == FML_RESULT.OK) {
            if (out_struct == undefined) out_struct = {};
            out_struct.value = value;
            out_struct.final_value = final_value;
            return out_struct;
        }
        return undefined;
    }
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-system.html#studio_system_setparameterbyname
    /// @param {string} name
    /// @param {number} value
    /// @param {bool?} ignore_seek_speed = false
    /// @param {FmlError?} error = undefined
    /// @returns {bool}
    static set_parameter_by_name = function(name, value, ignore_seek_speed = false, error = undefined)
    {
        var res = __FML_Studio_System_setParameterByName(studio_system_index, name, value, ignore_seek_speed);
        __fml_set_error(error, res);
        return (res == FML_RESULT.OK);
    }
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-system.html#studio_system_setparameterbynamewithlabel
    /// @param {string} name
    /// @param {string} label
    /// @param {bool?} ignore_seek_speed = false
    /// @param {FmlError?} error = undefined
    /// @returns {bool}
    static set_parameter_by_name_with_label = function(name, label, ignore_seek_speed = false, error = undefined)
    {
        var res = __FML_Studio_System_setParameterByNameWithLabel(studio_system_index, name, label, ignore_seek_speed);
        __fml_set_error(error, res);
        return (res == FML_RESULT.OK);
    }
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-system.html#studio_system_lookupid
    /// @param {string} path
    /// @param {FMOD_GUID?} out_guid = undefined
    /// @param {FmlError?} error = undefined
    /// @returns {FMOD_GUID}
    static lookup_id = function(path, out_guid = undefined, error = undefined)
    {
        var out_buf = __fml_buffers_guid;
        var res = __FML_Studio_System_lookupID(studio_system_index, path, buffer_get_address(out_buf));
        __fml_set_error(error, res);
        if (res == FML_RESULT.OK) {
            if (out_guid == undefined) out_guid = new FMOD_GUID();
            buffer_seek(out_buf, buffer_seek_start, 0);
            FMOD_GUID_deserialize(out_guid, out_buf);
            return out_guid;
        }
        return undefined;
    }
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-system.html#studio_system_lookuppath
    /// @param {FMOD_GUID} guid
    /// @param {FmlError?} error = undefined
    /// @returns {string}
    static lookup_path = function(guid, error = undefined)
    {
        static out_buf = buffer_create(0, buffer_fixed, 1);
        var res = undefined;
        for (var i = 0; i < 8; ++i) {
            var size = 32 * power(2, i);
            buffer_resize(out_buf, size);
            buffer_poke(out_buf, 0, __FML_BUFFER_SIZE_HINT_TYPE, size);
            res = __FML_Studio_System_lookupPath(studio_system_index, FMOD_GUID_as_buf_ptr(guid), buffer_get_address(out_buf));
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
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-system.html#studio_system_getnumlisteners
    /// @param {FmlError?} error = undefined
    /// @returns {int}
    static get_num_listeners = function(error = undefined)
    {
        var out_buf = __fml_buffers_fixed[@ buffer_u64];
        var res = __FML_Studio_System_getNumListeners(studio_system_index, buffer_get_address(out_buf));
        __fml_set_error(error, res);
        return (res == FML_RESULT.OK) ? real(buffer_peek(out_buf, 0, buffer_u64)) : undefined;
    }
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-system.html#studio_system_setnumlisteners
    /// @param {int} num_listeners
    /// @param {FmlError?} error = undefined
    /// @returns {bool}
    static set_num_listeners = function(num_listeners, error = undefined)
    {
        var res = __FML_Studio_System_setNumListeners(studio_system_index, num_listeners);
        __fml_set_error(error, res);
        return (res == FML_RESULT.OK);
    }
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-system.html#studio_system_getlistenerattributes
    /// @param {int} listener
    /// @param {FMOD_3D_ATTRIBUTES?} out_attributes = undefined
    /// @param {FMOD_VECTOR?} out_attenuation_position = undefined
    /// @param {FmlError?} error = undefined
    /// @returns {FMOD_3D_ATTRIBUTES}
    static get_listener_attributes = function(listener, out_attributes = undefined, out_attenuation_position = undefined, error = undefined)
    {
        var attr_out_buf = __fml_buffers_3d_attributes;
        var atte_out_buf = __fml_buffers_vector;
        var res = __FML_Studio_System_getListenerAttributes(studio_system_index, listener, buffer_get_address(attr_out_buf), buffer_get_address(atte_out_buf));
        __fml_set_error(error, res);
        if (res == FML_RESULT.OK) {
            if (out_attributes == undefined) out_attributes = new FMOD_3D_ATTRIBUTES();
            buffer_seek(attr_out_buf, buffer_seek_start, 0);
            FMOD_3D_ATTRIBUTES_deserialize(out_attributes, attr_out_buf);
            if (out_attenuation_position == undefined) out_attenuation_position = new FMOD_VECTOR();
            buffer_seek(atte_out_buf, buffer_seek_start, 0);
            FMOD_VECTOR_deserialize(out_attenuation_position, atte_out_buf);
            return out_attributes;
        }
        return undefined;
    }
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-system.html#studio_system_setlistenerattributes
    /// @param {int} listener
    /// @param {FMOD_3D_ATTRIBUTES} attributes
    /// @param {FMOD_VECTOR?} attenuation_position
    /// @param {FmlError?} error = undefined
    /// @returns {bool}
    static set_listener_attributes = function(listener, attributes, attenuation_position, error = undefined)
    {
        var attr_buf_ptr = FMOD_3D_ATTRIBUTES_as_buf_ptr(attributes);
        var atte_buf_ptr = FMOD_VECTOR_as_buf_ptr(attenuation_position);
        var res = __FML_Studio_System_setListenerAttributes(studio_system_index, listener, attr_buf_ptr, atte_buf_ptr);
        __fml_set_error(error, res);
        return (res == FML_RESULT.OK);
    }
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-system.html#studio_system_getlistenerweight
    /// @param {int} listener
    /// @param {FmlError?} error = undefined
    /// @returns {number}
    static get_listener_weight = function(listener, error = undefined)
    {
        var out_buf = __fml_buffers_fixed[@ buffer_f32];
        var res = __FML_Studio_System_getListenerWeight(studio_system_index, listener, buffer_get_address(out_buf));
        __fml_set_error(error, res);
        return (res == FML_RESULT.OK) ? buffer_peek(out_buf, 0, buffer_f32) : undefined;
    }
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-system.html#studio_system_setlistenerweight
    /// @param {int} listener
    /// @param {number} weight
    /// @param {FmlError?} error = undefined
    /// @returns {bool}
    static set_listener_weight = function(listener, weight, error = undefined)
    {
        var res = __FML_Studio_System_setListenerWeight(studio_system_index, listener, weight);
        __fml_set_error(error, res);
        return (res == FML_RESULT.OK);
    }
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-system.html#studio_system_loadbankfile
    /// @param {string}         filename
    /// @param {int}            flags  A bitmask of FMOD_STUDIO_LOAD_BANK_xx values.
    /// @param {FmodBank?}      out_bank = undefined
    /// @param {FmlError?}  error = undefined
    /// @returns {FmodBank}
    static load_bank_file = function(filename, flags, out_bank = undefined, error = undefined)
    {
        var out_buf = __fml_buffers_fixed[@ buffer_u64];
        var res = __FML_Studio_System_loadBankFile(studio_system_index, filename, flags, buffer_get_address(out_buf));
        __fml_set_error(error, res);
        if (res == FML_RESULT.OK) {
            if (out_bank == undefined) out_bank = new FmodBank();
            out_bank.bank_index = buffer_peek(out_buf, 0, buffer_u64);
            return out_bank;
        }
        return undefined;
    }
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-system.html#studio_system_loadbankmemory
    /// @param {buffer} bank_buffer
    /// @param {int} buffer_length
    /// @param {FMOD_STUDIO_LOAD_MEMORY_MODE} mode
    /// @param {int} flags A bitmask of FMOD_STUDIO_LOAD_BANK_xx values.
    /// @param {FmodBank?} out_bank = undefined
    /// @param {FmlError?} error = undefined
    /// @returns {FmodBank}
    static load_bank_memory = function(bank_buffer, buffer_length, mode, flags, out_bank = undefined, error = undefined)
    {
        var out_buf = __fml_buffers_fixed[@ buffer_u64];
        var args_buffer = buffer_create(12, buffer_fixed, 4);
        buffer_write(args_buffer, buffer_s32, buffer_length);
        buffer_write(args_buffer, buffer_s32, mode);
        buffer_write(args_buffer, buffer_u32, flags);
        var res = __FML_Studio_System_loadBankMemory(studio_system_index, buffer_get_address(bank_buffer), buffer_get_address(args_buffer), buffer_get_address(out_buf));
        __fml_set_error(error, res);
        if (res == FML_RESULT.OK) {
            if (out_bank == undefined) out_bank = new FmodBank();
            out_bank.bank_index = buffer_peek(out_buf, 0, buffer_u64);
            return out_bank;
        }
        return undefined;
    }
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-system.html#studio_system_loadbankcustom
    static _load_bank_custom = function() {}
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-system.html#studio_system_unloadall
    /// @param {FmlError?} error = undefined
    /// @returns {FmodBank}
    static unload_all = function(error = undefined)
    {
        var res = __FML_Studio_System_unloadAll(studio_system_index);
        __fml_set_error(error, res);
        return (res == FML_RESULT.OK);
    }
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-system.html#studio_system_getbufferusage
    /// @param {FMOD_STUDIO_BUFFER_USAGE?} out_usage = undefined
    /// @param {FmlError?} error = undefined
    /// @returns {FMOD_STUDIO_BUFFER_USAGE}
    static get_buffer_usage = function(out_usage = undefined, error = undefined)
    {
        var out_buf = __fml_buffers_buffer_usage;
        var res = __FML_Studio_System_getBufferUsage(studio_system_index, buffer_get_address(out_buf));
        __fml_set_error(error, res);
        if (res == FML_RESULT.OK) {
            buffer_seek(out_buf, buffer_seek_start, 0);
            if (out_usage == undefined) out_usage = new FMOD_STUDIO_BUFFER_USAGE();
            FMOD_STUDIO_BUFFER_USAGE_deserialize(out_usage, out_buf);
            return out_usage;
        }
        return undefined;
    }
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-system.html#studio_system_resetbufferusage
    /// @param {FmlError?} error = undefined
    /// @returns {bool}
    static reset_buffer_usage = function(error = undefined)
    {
        var res = __FML_Studio_System_resetBufferUsage(studio_system_index);
        __fml_set_error(error, res);
        return (res == FML_RESULT.OK);
    }
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-system.html#studio_system_registerplugin
    static _register_plugin = function() {}
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-system.html#studio_system_unregisterplugin
    /// @param {string} name
    /// @param {FmlError?} error = undefined
    /// @returns {bool}
    static unregister_plugin = function(name, error = undefined)
    {
        var res = __FML_Studio_System_unregisterPlugin(studio_system_index, name);
        __fml_set_error(error, res);
        return (res == FML_RESULT.OK);
    }
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-system.html#studio_system_getbankcount
    /// @param {FmlError?} error = undefined
    /// @returns {int}
    static get_bank_count = function(error = undefined)
    {
        var out_buf = __fml_buffers_fixed[@ buffer_u64];
        var res = __FML_Studio_System_getBankCount(studio_system_index, buffer_get_address(out_buf));
        __fml_set_error(error, res);
        return (res == FML_RESULT.OK) ? real(buffer_peek(out_buf, 0, buffer_u64)) : undefined;
    }
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-system.html#studio_system_getbanklist
    /// @param {FmlError?} error = undefined
    /// @returns {FmodBank[]}
    static get_bank_list = function(error = undefined)
    {
        var bank_count = get_bank_count();
        if (bank_count <= 0) {
            return [];
        }
        var count_out_buf = __fml_buffers_fixed[buffer_s32];
        var banks_out_buf_size = buffer_sizeof(__FML_BUFFER_SIZE_HINT_TYPE) + buffer_sizeof(buffer_u64) * bank_count;
        var banks_out_buf = buffer_create(banks_out_buf_size, buffer_fixed, 1);
        buffer_write(banks_out_buf, __FML_BUFFER_SIZE_HINT_TYPE, banks_out_buf_size);
        var res = __FML_Studio_System_getBankList(studio_system_index, buffer_get_address(banks_out_buf), buffer_get_address(count_out_buf));
        __fml_set_error(error, res);
        if (res == FML_RESULT.OK) {
            var count = buffer_peek(count_out_buf, 0, buffer_s32);
            var banks = array_create(count);
            for (var i = 0; i < count; ++i) {
                var bank = new FmodBank();
                bank.bank_index = real(buffer_read(banks_out_buf, buffer_u64));
                banks[@ i] = bank;
            }
            buffer_delete(banks_out_buf);
            return banks;
        }
        buffer_delete(banks_out_buf);
        return undefined;
    }
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-system.html#studio_system_getparameterdescriptioncount
    /// @param {FmlError?} error = undefined
    /// @returns {int}
    static get_parameter_description_count = function(error = undefined)
    {
        var out_buf = __fml_buffers_fixed[@ buffer_u64];
        var res = __FML_Studio_System_getParameterDescriptionCount(studio_system_index, buffer_get_address(out_buf));
        __fml_set_error(error, res);
        return (res == FML_RESULT.OK) ? real(buffer_peek(out_buf, 0, buffer_u64)) : undefined;
    }
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-system.html#studio_system_getparameterdescriptionlist
    /// @param {FmlError?} error = undefined
    /// @returns {FMOD_STUDIO_PARAMETER_DESCRIPTION[]}
    static get_parameter_description_list = function(error = undefined)
    {
        static descriptions_out_buf = buffer_create(0, buffer_fixed, 1);
        static count_out_buf = __fml_buffers_fixed[buffer_s32];
        var res = undefined;
        for (var i = 0; i < 8; ++i) {
            var size = 128 * power(2, i);
            buffer_resize(descriptions_out_buf, size);
            buffer_poke(descriptions_out_buf, 0, __FML_BUFFER_SIZE_HINT_TYPE, size);
            res = __FML_Studio_System_getParameterDescriptionList(studio_system_index, buffer_get_address(descriptions_out_buf), buffer_get_address(count_out_buf));
            if (res == FML_RESULT.OK) {
                __fml_set_error(error, res);
                var count = buffer_peek(count_out_buf, 0, buffer_s32);
                buffer_seek(descriptions_out_buf, buffer_seek_start, buffer_sizeof(__FML_BUFFER_SIZE_HINT_TYPE));
                var descriptions = array_create(count);
                for (var j = 0; j < count; ++j) {
                    var description = new FMOD_STUDIO_PARAMETER_DESCRIPTION();
                    FMOD_STUDIO_PARAMETER_DESCRIPTION_deserialize(description, descriptions_out_buf);
                    descriptions[@ j] = description;
                }
                return descriptions;
            }
            else if (res != FML_RESULT.BUFFER_TOO_SMALL && res != FML_RESULT.TRUNCATED) {
                break;
            }
        }
        __fml_set_error(error, res);
        return undefined;
    }
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-system.html#studio_system_startcommandcapture
    /// @param {string} filename
    /// @param {int} flags
    /// @param {FmlError?} error = undefined
    /// @returns {bool}
    static start_command_capture = function(filename, flags, error = undefined)
    {
        var res = __FML_Studio_System_startCommandCapture(studio_system_index, filename, flags);
        __fml_set_error(error, res);
        return (res == FML_RESULT.OK);
    }
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-system.html#studio_system_stopcommandcapture
    /// @param {FmlError?} error = undefined
    /// @returns {bool}
    static stop_command_capture = function(error = undefined)
    {
        var res = __FML_Studio_System_stopCommandCapture(studio_system_index);
        __fml_set_error(error, res);
        return (res == FML_RESULT.OK);
    }
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-system.html#studio_system_loadcommandreplay
    /// @param {string} error = undefined
    /// @param {int} flags
    /// @param {FmodCommandReplay?} out_command_replay = undefined
    /// @param {FmlError?} error = undefined
    /// @returns {FmodCommandReplay}
    static load_command_replay = function(filename, flags, out_command_replay = undefined, error = undefined)
    {
        var out_buf = __fml_buffers_fixed[@ buffer_u64];
        var res = __FML_Studio_System_loadCommandReplay(studio_system_index, filename, flags, buffer_get_address(out_buf));
        __fml_set_error(error, res);
        if (res == FML_RESULT.OK) {
            if (out_command_replay == undefined) out_command_replay = new FmodCommandReplay();
            out_command_replay.command_replay_index = real(buffer_peek(out_buf, 0, buffer_u64));
            return out_command_replay;
        }
        return undefined;
    }
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-system.html#studio_system_setcallback
    /// @param {function<int, int, int?, void>} callback
    /// @param {int} callback_mask = FMOD_STUDIO_SYSTEM_CALLBACK_ALL A bitmask of FMOD_STUDIO_SYSTEM_CALLBACK_xx values.
    /// @param {FmlError?} error = undefined
    /// @returns {bool}
    static set_callback = function(callback, callback_mask = FMOD_STUDIO_SYSTEM_CALLBACK_ALL, error = undefined)
    {
        var res = __FML_Studio_System_setCallback(studio_system_index, callback_mask);
        __fml_set_error(error, res);
        if (res == FML_RESULT.OK) {
            global.__fml_callbacks[? studio_system_index] = callback;
            return true;
        }
        return false;
    }
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-system.html#studio_system_getuserdata
    static _get_user_data = function() {}
    /// https://www.fmod.com/docs/2.02/api/studio-api-system.html#studio_system_setuserdata
    static _set_user_data = function() {}
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-system.html#studio_system_getcpuusage
    /// @param {FMOD_STUDIO_CPU_USAGE?} out_studio_usage = undefined
    /// @param {FMOD_CPU_USAGE?} out_core_usage = undefined
    /// @param {FmlError?} error = undefined
    /// @returns {bool}
    static get_cpu_usage = function(out_studio_usage = undefined, out_core_usage = undefined, error = undefined)
    {
        var studio_buf = __fml_buffers_studio_cpu_usage;
        var core_buf = __fml_buffers_core_cpu_usage;
        var res = __FML_Studio_System_getCPUUsage(studio_system_index, buffer_get_address(studio_buf), buffer_get_address(core_buf));
        __fml_set_error(error, res);
        if (res == FML_RESULT.OK) {
            if (out_studio_usage != undefined) {
                buffer_seek(studio_buf, buffer_seek_start, 0);
                FMOD_STUDIO_CPU_USAGE_deserialize(out_studio_usage, studio_buf);
            }
            if (out_core_usage != undefined) {
                buffer_seek(core_buf, buffer_seek_start, 0);
                FMOD_CPU_USAGE_deserialize(out_core_usage, core_buf);
            }
            return true;
        }
        return false;
    }
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-system.html#studio_system_getmemoryusage
    /// @param {FMOD_STUDIO_MEMORY_USAGE?} out_usage = undefined
    /// @param {FmlError?} error = undefined
    /// @returns {FMOD_STUDIO_MEMORY_USAGE}
    static get_memory_usage = function(out_usage = undefined, error = undefined)
    {
        var out_buf = __fml_buffers_studio_memory_usage;
        var res = __FML_Studio_System_getMemoryUsage(studio_system_index, buffer_get_address(out_buf));
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
