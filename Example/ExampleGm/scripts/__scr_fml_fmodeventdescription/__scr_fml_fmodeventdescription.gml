
/// https://www.fmod.com/resources/documentation-api?version=2.02&page=studio-api-eventdescription.html
function FmodEventDescription() constructor
{
    event_description_index = 0;    /// @is {int}
    
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=studio-api-eventdescription.html#studio_eventdescription_isvalid
    /// @param {FmlError?} error = undefined
    /// @returns {bool}
    static is_valid = function(error = undefined)
    {
        var out_buf = __fml_buffers_fixed[@ buffer_bool];
        var res = __FML_Studio_EventDescription_isValid(event_description_index, buffer_get_address(out_buf));
        __fml_set_error(error, res);
        return (res == FML_RESULT.OK) ? bool(buffer_peek(out_buf, 0, buffer_bool)) : undefined;
    }
    
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=studio-api-eventdescription.html#studio_eventdescription_getid
    /// @param {FMOD_GUID?} out_guid = undefined
    /// @param {FmlError?} error = undefined
    /// @returns {FMOD_GUID}
    static get_id = function(out_guid = undefined, error = undefined)
    {
        var out_buf = __fml_buffers_guid;
        var res = __FML_Studio_EventDescription_getID(event_description_index, buffer_get_address(out_buf));
        __fml_set_error(error, res);
        if (res == FML_RESULT.OK) {
            if (out_guid == undefined) out_guid = new FMOD_GUID();
            buffer_seek(out_buf, buffer_seek_start, 0);
            FMOD_GUID_deserialize(out_guid, out_buf);
            return out_guid;
        }
        return undefined;
    }
    
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=studio-api-eventdescription.html#studio_eventdescription_getpath
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
            res = __FML_Studio_EventDescription_getPath(event_description_index, buffer_get_address(out_buf));
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
    
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=studio-api-eventdescription.html#studio_eventdescription_getparameterdescriptioncount
    /// @param {FmlError?} error = undefined
    /// @returns {int}
    static get_parameter_description_count = function(error = undefined)
    {
        var out_buf = __fml_buffers_fixed[@ buffer_s32];
        var res = __FML_Studio_EventDescription_getParameterDescriptionCount(event_description_index, buffer_get_address(out_buf));
        __fml_set_error(error, res);
        return (res == FML_RESULT.OK) ? real(buffer_peek(out_buf, 0, buffer_s32)) : undefined;
    }
    
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=studio-api-eventdescription.html#studio_eventdescription_getparameterdescriptionbyindex
    /// @param {int} index
    /// @param {FMOD_STUDIO_PARAMETER_DESCRIPTION?} out_description = undefined
    /// @param {FmlError?} error = undefined
    /// @returns {FMOD_STUDIO_PARAMETER_DESCRIPTION}
    static get_parameter_description_by_index = function(index, out_description = undefined, error = undefined)
    {
        static out_buf = buffer_create(0, buffer_fixed, 1);
        var res = undefined;
        for (var i = 0; i < 8; ++i) {
            var size = 64 * power(2, i);
            buffer_resize(out_buf, size);
            buffer_poke(out_buf, 0, __FML_BUFFER_SIZE_HINT_TYPE, size);
            res = __FML_Studio_EventDescription_getParameterDescriptionByIndex(event_description_index, index, buffer_get_address(out_buf));
            if (res == FML_RESULT.OK) {
                buffer_seek(out_buf, buffer_seek_start, buffer_sizeof(__FML_BUFFER_SIZE_HINT_TYPE));
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
    
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=studio-api-eventdescription.html#studio_eventdescription_getparameterdescriptionbyname
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
            res = __FML_Studio_EventDescription_getParameterDescriptionByName(event_description_index, name, buffer_get_address(out_buf));
            if (res == FML_RESULT.OK) {
                buffer_seek(out_buf, buffer_seek_start, buffer_sizeof(__FML_BUFFER_SIZE_HINT_TYPE));
                if (out_description == undefined) out_description = new FMOD_STUDIO_PARAMETER_DESCRIPTION();
                FMOD_STUDIO_PARAMETER_DESCRIPTION_deserialize(out_description, out_buf);
                __fml_set_error(error, res);
                return out_description;
            }
            else if (res != FML_RESULT.BUFFER_TOO_SMALL) {
                break;
            }
        }
        __fml_set_error(error, res);
        return undefined;
    }
    
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=studio-api-eventdescription.html#studio_eventdescription_getparameterdescriptionbyid
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
            buffer_poke(out_buf, 0, __FML_BUFFER_SIZE_HINT_TYPE, size);
            var param_id_buf_ptr = FMOD_STUDIO_PARAMETER_ID_as_buf_ptr(param_id);
            res = __FML_Studio_EventDescription_getParameterDescriptionByID(event_description_index, param_id_buf_ptr, buffer_get_address(out_buf));
            if (res == FML_RESULT.OK) {
                buffer_seek(out_buf, buffer_seek_start, buffer_sizeof(__FML_BUFFER_SIZE_HINT_TYPE));
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
    
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=studio-api-eventdescription.html#studio_eventdescription_getparameterlabelbyindex
    /// @param {int} index
    /// @param {int} label_index
    /// @param {FmlError?} error = undefined
    /// @returns {string}
    static get_parameter_label_by_index = function(index, label_index, error = undefined)
    {
        static out_buf = buffer_create(0, buffer_fixed, 1);
        var res = undefined;
        for (var i = 0; i < 8; ++i) {
            var size = 32 * power(2, i);
            buffer_resize(out_buf, size);
            buffer_poke(out_buf, 0, __FML_BUFFER_SIZE_HINT_TYPE, size);
            res = __FML_Studio_EventDescription_getParameterLabelByIndex(event_description_index, index, label_index, buffer_get_address(out_buf));
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
    
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=studio-api-eventdescription.html#studio_eventdescription_getparameterlabelbyname
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
            res = __FML_Studio_EventDescription_getParameterLabelByName(event_description_index, name, label_index, buffer_get_address(out_buf));
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
    
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=studio-api-eventdescription.html#studio_eventdescription_getparameterlabelbyid
    /// @param {FMOD_STUDIO_PARAMETER_ID} param_id
    /// @param {int} label_index
    /// @param {FmlError?} error = undefined
    /// @returns {string}
    static get_parameter_label_by_id = function(param_id, label_index, error = undefined)
    {
        static out_buf = buffer_create(0, buffer_fixed, 1);
        var res = undefined;
        for (var i = 0; i < 8; ++i) {
            var size = 32 * power(2, i);
            buffer_resize(out_buf, size);
            buffer_poke(out_buf, 0, __FML_BUFFER_SIZE_HINT_TYPE, size);
            var param_id_buf_ptr = FMOD_STUDIO_PARAMETER_ID_as_buf_ptr(param_id);
            res = __FML_Studio_EventDescription_getParameterLabelByID(event_description_index, param_id_buf_ptr, label_index, buffer_get_address(out_buf));
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
    
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=studio-api-eventdescription.html#studio_eventdescription_getuserpropertycount
    /// @param {FmlError?} error = undefined
    /// @returns {int}
    static get_user_property_count = function(error = undefined)
    {
        var out_buf = __fml_buffers_fixed[@ buffer_s32];
        var res = __FML_Studio_EventDescription_getUserPropertyCount(event_description_index, buffer_get_address(out_buf));
        __fml_set_error(error, res);
        return (res == FML_RESULT.OK) ? buffer_peek(out_buf, 0, buffer_s32) : undefined;
    }
    
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=studio-api-eventdescription.html#studio_eventdescription_getuserpropertybyindex
    /// @param {int} index
    /// @param {FMOD_STUDIO_USER_PROPERTY?} out_property = undefined
    /// @param {FmlError?} error = undefined
    /// @returns {FMOD_STUDIO_USER_PROPERTY}
    static get_user_property_by_index = function(index, out_property = undefined, error = undefined)
    {
        static out_buf = buffer_create(0, buffer_fixed, 1);
        var res = undefined;
        for (var i = 0; i < 8; ++i) {
            var size = 64 * power(2, i);
            buffer_resize(out_buf, size);
            buffer_poke(out_buf, 0, __FML_BUFFER_SIZE_HINT_TYPE, size);
            res = __FML_Studio_EventDescription_getUserPropertyByIndex(event_description_index, index, buffer_get_address(out_buf));
            if (res == FML_RESULT.OK) {
                buffer_seek(out_buf, buffer_seek_start, buffer_sizeof(__FML_BUFFER_SIZE_HINT_TYPE));
                if (out_property == undefined) out_property = new FMOD_STUDIO_USER_PROPERTY();
                FMOD_STUDIO_USER_PROPERTY_deserialize(out_property, out_buf);
                __fml_set_error(error, res);
                return out_property;
            }
            else if (res != FML_RESULT.BUFFER_TOO_SMALL) {
                break;
            }
        }
        __fml_set_error(error, res);
        return undefined;
    }
    
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=studio-api-eventdescription.html#studio_eventdescription_getuserproperty
    /// @param {string} name
    /// @param {FMOD_STUDIO_USER_PROPERTY?} out_property = undefined
    /// @param {FmlError?} error = undefined
    /// @returns {FMOD_STUDIO_USER_PROPERTY}
    static get_user_property = function(name, out_property = undefined, error = undefined)
    {
        static out_buf = buffer_create(0, buffer_fixed, 1);
        var res = undefined;
        for (var i = 0; i < 8; ++i) {
            var size = 64 * power(2, i);
            buffer_resize(out_buf, size);
            buffer_poke(out_buf, 0, __FML_BUFFER_SIZE_HINT_TYPE, size);
            res = __FML_Studio_EventDescription_getUserProperty(event_description_index, name, buffer_get_address(out_buf));
            if (res == FML_RESULT.OK) {
                buffer_seek(out_buf, buffer_seek_start, buffer_sizeof(__FML_BUFFER_SIZE_HINT_TYPE));
                if (out_property == undefined) out_property = new FMOD_STUDIO_USER_PROPERTY();
                FMOD_STUDIO_USER_PROPERTY_deserialize(out_property, out_buf);
                __fml_set_error(error, res);
                return out_property;
            }
            else if (res != FML_RESULT.BUFFER_TOO_SMALL) {
                break;
            }
        }
        __fml_set_error(error, res);
        return undefined;
    }
    
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=studio-api-eventdescription.html#studio_eventdescription_getlength
    /// @param {FmlError?} error = undefined
    /// @returns {int}
    static get_length = function(error = undefined)
    {
        var out_buf = __fml_buffers_fixed[@ buffer_s32];
        var res = __FML_Studio_EventDescription_getLength(event_description_index, buffer_get_address(out_buf));
        __fml_set_error(error, res);
        return (res == FML_RESULT.OK) ? real(buffer_peek(out_buf, 0, buffer_s32)) : undefined;
    }
    
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=studio-api-eventdescription.html#studio_eventdescription_getminmaxdistance
    /// @param {struct?} out_struct = undefined
    /// @param {FmlError?} error = undefined
    /// @returns {struct}
    static get_min_max_distance = function(out_struct = undefined, error = undefined)
    {
        var out_buf = buffer_create(buffer_sizeof(buffer_f32) * 2, buffer_fixed, buffer_sizeof(buffer_f32));
        var res = __FML_Studio_EventDescription_getMinMaxDistance(event_description_index, buffer_get_address(out_buf));
        __fml_set_error(error, res);
        var minValue = buffer_read(out_buf, buffer_f32);
        var maxValue = buffer_read(out_buf, buffer_f32);
        buffer_delete(out_buf);
        if (res == FML_RESULT.OK) {
            if (out_struct == undefined) out_struct = {};
            out_struct.min = minValue;
            out_struct.max = maxValue;
            return out_struct;
        }
        return undefined;
    }
    
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=studio-api-eventdescription.html#studio_eventdescription_getsoundsize
    /// @param {FmlError?} error = undefined
    /// @returns {number}
    static get_sound_size = function(error = undefined)
    {
        var out_buf = __fml_buffers_fixed[@ buffer_f32];
        var res = __FML_Studio_EventDescription_getSoundSize(event_description_index, buffer_get_address(out_buf));
        __fml_set_error(error, res);
        return (res == FML_RESULT.OK) ? buffer_peek(out_buf, 0, buffer_f32) : undefined;
    }
    
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=studio-api-eventdescription.html#studio_eventdescription_issnapshot
    /// @param {FmlError?} error = undefined
    /// @returns {bool}
    static is_snapshot = function(error = undefined)
    {
        var out_buf = __fml_buffers_fixed[@ buffer_bool];
        var res = __FML_Studio_EventDescription_isSnapshot(event_description_index, buffer_get_address(out_buf));
        __fml_set_error(error, res);
        return (res == FML_RESULT.OK) ? bool(buffer_peek(out_buf, 0, buffer_bool)) : undefined;
    }
    
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=studio-api-eventdescription.html#studio_eventdescription_isoneshot
    /// @param {FmlError?} error = undefined
    /// @returns {bool}
    static is_oneshot = function(error = undefined)
    {
        var out_buf = __fml_buffers_fixed[@ buffer_bool];
        var res = __FML_Studio_EventDescription_isOneshot(event_description_index, buffer_get_address(out_buf));
        __fml_set_error(error, res);
        return (res == FML_RESULT.OK) ? bool(buffer_peek(out_buf, 0, buffer_bool)) : undefined;
    }
    
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=studio-api-eventdescription.html#studio_eventdescription_isstream
    /// @param {FmlError?} error = undefined
    /// @returns {bool}
    static is_stream = function(error = undefined)
    {
        var out_buf = __fml_buffers_fixed[@ buffer_bool];
        var res = __FML_Studio_EventDescription_isStream(event_description_index, buffer_get_address(out_buf));
        __fml_set_error(error, res);
        return (res == FML_RESULT.OK) ? bool(buffer_peek(out_buf, 0, buffer_bool)) : undefined;
    }
    
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=studio-api-eventdescription.html#studio_eventdescription_is3d
    /// @param {FmlError?} error = undefined
    /// @returns {bool}
    static is_3d = function(error = undefined)
    {
        var out_buf = __fml_buffers_fixed[@ buffer_bool];
        var res = __FML_Studio_EventDescription_is3D(event_description_index, buffer_get_address(out_buf));
        __fml_set_error(error, res);
        return (res == FML_RESULT.OK) ? bool(buffer_peek(out_buf, 0, buffer_bool)) : undefined;
    }
    
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=studio-api-eventdescription.html#studio_eventdescription_isdopplerenabled
    /// @param {FmlError?} error = undefined
    /// @returns {bool}
    static is_doppler_enabled = function(error = undefined)
    {
        var out_buf = __fml_buffers_fixed[@ buffer_bool];
        var res = __FML_Studio_EventDescription_isDopplerEnabled(event_description_index, buffer_get_address(out_buf));
        __fml_set_error(error, res);
        return (res == FML_RESULT.OK) ? bool(buffer_peek(out_buf, 0, buffer_bool)) : undefined;
    }
    
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=studio-api-eventdescription.html#studio_eventdescription_hassustainpoint
    /// @param {FmlError?} error = undefined
    /// @returns {bool}
    static has_sustain_point = function(error = undefined)
    {
        var out_buf = __fml_buffers_fixed[@ buffer_bool];
        var res = __FML_Studio_EventDescription_hasSustainPoint(event_description_index, buffer_get_address(out_buf));
        __fml_set_error(error, res);
        return (res == FML_RESULT.OK) ? bool(buffer_peek(out_buf, 0, buffer_bool)) : undefined;
    }
    
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=studio-api-eventdescription.html#studio_eventdescription_createinstance
    /// @param {FmodEventInstance?} out_event_instance = undefined
    /// @param {FmlError?} error = undefined
    /// @returns {FmodEventInstance}
    static create_instance = function(out_event_instance = undefined, error = undefined)
    {
        var out_buf = __fml_buffers_fixed[@ buffer_u64];
        var res = __FML_Studio_EventDescription_createInstance(event_description_index, buffer_get_address(out_buf));
        __fml_set_error(error, res);
        if (res == FML_RESULT.OK) {
            if (out_event_instance == undefined) out_event_instance = new FmodEventInstance();
            out_event_instance.event_instance_index = real(buffer_peek(out_buf, 0, buffer_u64));
            return out_event_instance;
        }
        return undefined;
    }
    
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=studio-api-eventdescription.html#studio_eventdescription_getinstancecount
    /// @param {FmlError?} error = undefined
    /// @returns {int}
    static get_instance_count = function(error = undefined)
    {
        var out_buf = __fml_buffers_fixed[@ buffer_s32];
        var res = __FML_Studio_EventDescription_getInstanceCount(event_description_index, buffer_get_address(out_buf));
        __fml_set_error(error, res);
        return (res == FML_RESULT.OK) ? real(buffer_peek(out_buf, 0, buffer_s32)) : undefined;
    }
    
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=studio-api-eventdescription.html#studio_eventdescription_getinstancelist
    /// @param {FmlError?} error = undefined
    /// @returns {FmodEventInstance[]}
    static get_instance_list = function(error = undefined)
    {
        var inst_count = get_instance_count(error);
        if (inst_count == undefined) {
            return undefined;
        }
        if (inst_count <= 0) {
            return [];
        }
        var count_out_buf = __fml_buffers_fixed[buffer_s32];
        var instances_out_buf_size = buffer_sizeof(__FML_BUFFER_SIZE_HINT_TYPE) + buffer_sizeof(buffer_u64) * inst_count;
        var instances_out_buf = buffer_create(instances_out_buf_size, buffer_fixed, 1);
        buffer_write(instances_out_buf, __FML_BUFFER_SIZE_HINT_TYPE, instances_out_buf_size);
        var res = __FML_Studio_EventDescription_getInstanceList(event_description_index, buffer_get_address(instances_out_buf), buffer_get_address(count_out_buf));
        __fml_set_error(error, res);
        if (res == FML_RESULT.OK) {
            var count = buffer_peek(count_out_buf, 0, buffer_s32);
            var instances = array_create(count);
            for (var i = 0; i < count; ++i) {
                var inst = new FmodEventInstance();
                inst.event_instance_index = real(buffer_read(instances_out_buf, buffer_u64));
                instances[@ i] = inst;
            }
            buffer_delete(instances_out_buf);
            return instances;
        }
        buffer_delete(instances_out_buf);
        return undefined;
    }
    
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=studio-api-eventdescription.html#studio_eventdescription_loadsampledata
    /// @param {FmlError?} error = undefined
    /// @returns {bool}
    static load_sample_data = function(error = undefined)
    {
        var res = __FML_Studio_EventDescription_loadSampleData(event_description_index);
        __fml_set_error(error, res);
        return (res == FML_RESULT.OK);
    }
    
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=studio-api-eventdescription.html#studio_eventdescription_unloadsampledata
    /// @param {FmlError?} error = undefined
    /// @returns {bool}
    static unload_sample_data = function(error = undefined)
    {
        var res = __FML_Studio_EventDescription_unloadSampleData(event_description_index);
        __fml_set_error(error, res);
        return (res == FML_RESULT.OK);
    }
    
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=studio-api-eventdescription.html#studio_eventdescription_getsampleloadingstate
    /// @param {FmlError?} error = undefined
    /// @returns {FMOD_STUDIO_LOADING_STATE}
    static get_sample_loading_state = function(error = undefined)
    {
        var out_buf = __fml_buffers_fixed[@ buffer_s32];
        var res = __FML_Studio_EventDescription_getSampleLoadingState(event_description_index, buffer_get_address(out_buf));
        __fml_set_error(error, res);
        return (res == FML_RESULT.OK) ? buffer_peek(out_buf, 0, buffer_s32) : undefined;
    }
    
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=studio-api-eventdescription.html#studio_eventdescription_releaseallinstances
    /// @param {FmlError?} error = undefined
    /// @returns {bool}
    static release_all_instances = function(error = undefined)
    {
        var res = __FML_Studio_EventDescription_releaseAllInstances(event_description_index);
        __fml_set_error(error, res);
        return (res == FML_RESULT.OK);
    }
    
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=studio-api-eventdescription.html#studio_eventdescription_setcallback
    /// @param {function<int, int, any, void>} callback
    /// @param {int} callback_mask = FMOD_STUDIO_EVENT_CALLBACK_ALL A bitmask of FMOD_STUDIO_EVENT_CALLBACK_xx values.
    /// @param {FmlError?} error = undefined
    /// @returns {bool}
    static set_callback = function(callback, callback_mask = FMOD_STUDIO_EVENT_CALLBACK_ALL, error = undefined)
    {
        var res = __FML_Studio_EventDescription_setCallback(event_description_index, callback_mask);
        __fml_set_error(error, res);
        if (res == FML_RESULT.OK) {
            global.__fml_callbacks[? event_description_index] = callback;
            return true;
        }
        return false;
    }
    
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=studio-api-eventdescription.html#studio_eventdescription_getuserdata
    static _get_user_data = function() {}
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=studio-api-eventdescription.html#studio_eventdescription_setuserdata
    static _set_user_data = function() {}
}
