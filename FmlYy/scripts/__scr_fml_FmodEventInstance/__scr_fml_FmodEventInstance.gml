
/// https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html
function FmodEventInstance() constructor
{
    event_instance_index = 0;   /// @is {int}
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_isvalid
    /// @param {FmlError?} error = undefined
    /// @returns {bool}
    static is_valid = function(error = undefined)
    {
        var out_buf = __fml_buffers_fixed[@ buffer_bool];
        var res = __FML_Studio_EventInstance_isValid(event_instance_index, buffer_get_address(out_buf));
        __fml_set_error(error, res);
        return (res == FML_RESULT.OK) ? bool(buffer_peek(out_buf, 0, buffer_bool)) : undefined;
    }
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_getdescription
    /// @param {FmodEventDescription?} out_description = undefined
    /// @param {FmlError?} error = undefined
    /// @returns {FmodEventDescription}
    static get_description = function(out_description = undefined, error = undefined)
    {
        var out_buf = __fml_buffers_fixed[@ buffer_u64];
        var res = __FML_Studio_EventInstance_getDescription(event_instance_index, buffer_get_address(out_buf));
        __fml_set_error(error, res);
        if (res == FML_RESULT.OK) {
            if (out_description == undefined) out_description = new FmodEventDescription();
            out_description.event_description_index = buffer_peek(out_buf, 0, buffer_u64);
            return out_description;
        }
        return undefined;
    }
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_getvolume
    /// @param {struct?} out_struct = undefined
    /// @param {FmlError?} error = undefined
    /// @returns {struct}
    static get_volume = function(out_struct = undefined, error = undefined)
    {
        var out_buf = buffer_create(buffer_sizeof(buffer_f32) * 2, buffer_fixed, buffer_sizeof(buffer_f32));
        var res = __FML_Studio_EventInstance_getVolume(event_instance_index, buffer_get_address(out_buf));
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
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_setvolume
    /// @param {number} volume
    /// @param {FmlError?} error = undefined
    /// @returns {bool}
    static set_volume = function(volume, error = undefined)
    {
        var res = __FML_Studio_EventInstance_setVolume(event_instance_index, volume);
        __fml_set_error(error, res);
        return (res == FML_RESULT.OK);
    }
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_getpitch
    /// @param {struct?} out_struct = undefined
    /// @param {FmlError?} error = undefined
    /// @returns {struct}
    static get_pitch = function(out_struct = undefined, error = undefined)
    {
        var out_buf = buffer_create(buffer_sizeof(buffer_f32) * 2, buffer_fixed, buffer_sizeof(buffer_f32));
        var res = __FML_Studio_EventInstance_getPitch(event_instance_index, buffer_get_address(out_buf));
        __fml_set_error(error, res);
        var pitch = buffer_read(out_buf, buffer_f32);
        var final_pitch = buffer_read(out_buf, buffer_f32);
        buffer_delete(out_buf);
        if (res == FML_RESULT.OK) {
            if (out_struct == undefined) out_struct = {};
            out_struct.pitch = pitch;
            out_struct.final_pitch = final_pitch;
            return out_struct;
        }
        return undefined;
    }
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_setpitch
    /// @param {number} pitch
    /// @param {FmlError?} error = undefined
    /// @returns {bool}
    static set_pitch = function(pitch, error = undefined)
    {
        var res = __FML_Studio_EventInstance_setPitch(event_instance_index, pitch);
        __fml_set_error(error, res);
        return (res == FML_RESULT.OK);
    }
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_get3dattributes
    /// @param {FMOD_3D_ATTRIBUTES?} out_attributes = undefined
    /// @param {FmlError?} error = undefined
    /// @returns {FMOD_3D_ATTRIBUTES}
    static get_3d_attributes = function(out_attributes = undefined, error = undefined)
    {
        var out_buf = __fml_buffers_3d_attributes;
        var res = __FML_Studio_EventInstance_get3DAttributes(event_instance_index, buffer_get_address(out_buf));
        __fml_set_error(error, res);
        if (res == FML_RESULT.OK) {
            if (out_attributes == undefined) out_attributes = new FMOD_3D_ATTRIBUTES();
            buffer_seek(out_buf, buffer_seek_start, 0);
            __FMOD_3D_ATTRIBUTES_deserialize(out_attributes, out_buf);
            return out_attributes;
        }
        return undefined;
    }
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_set3dattributes
    /// @param {FMOD_3D_ATTRIBUTES} attributes
    /// @param {FmlError?} error = undefined
    /// @returns {bool}
    static set_3d_attributes = function(attributes, error = undefined)
    {
        var attributes_buf_ptr = __FMOD_3D_ATTRIBUTES_as_buf_ptr(attributes);
        var res = __FML_Studio_EventInstance_set3DAttributes(event_instance_index, attributes_buf_ptr);
        __fml_set_error(error, res);
        return (res == FML_RESULT.OK);
    }
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_getlistenermask
    /// @param {FmlError?} error = undefined
    /// @returns {int}
    static get_listener_mask = function(error = undefined)
    {
        var out_buf = __fml_buffers_fixed[@ buffer_u32];
        var res = __FML_Studio_EventInstance_getListenerMask(event_instance_index, buffer_get_address(out_buf));
        __fml_set_error(error, res);
        return (res == FML_RESULT.OK) ? buffer_peek(out_buf, 0, buffer_u32) : undefined;
    }
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_setlistenermask
    /// @param {int} mask
    /// @param {FmlError?} error = undefined
    /// @returns {bool}
    static set_listener_mask = function(mask, error = undefined)
    {
        var res = __FML_Studio_EventInstance_setListenerMask(event_instance_index, mask);
        __fml_set_error(error, res);
        return (res == FML_RESULT.OK);
    }
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_getproperty
    /// @param {FMOD_STUDIO_EVENT_PROPERTY} property
    /// @param {FmlError?} error = undefined
    /// @returns {number}
    static get_property = function(property, error = undefined)
    {
        var out_buf = __fml_buffers_fixed[@ buffer_f32];
        var res = __FML_Studio_EventInstance_getProperty(event_instance_index, property, buffer_get_address(out_buf));
        __fml_set_error(error, res);
        return (res == FML_RESULT.OK) ? buffer_peek(out_buf, 0, buffer_f32) : undefined;
    }
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_setproperty
    /// @param {FMOD_STUDIO_EVENT_PROPERTY} property
    /// @param {number} value
    /// @param {FmlError?} error = undefined
    /// @returns {bool}
    static set_property = function(property, value, error = undefined)
    {
        var res = __FML_Studio_EventInstance_setProperty(event_instance_index, property, value);
        __fml_set_error(error, res);
        return (res == FML_RESULT.OK);
    }
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_getreverblevel
    /// @param {int} index
    /// @param {FmlError?} error = undefined
    /// @returns {number}
    static get_reverb_level = function(index, error = undefined)
    {
        var out_buf = __fml_buffers_fixed[@ buffer_f32];
        var res = __FML_Studio_EventInstance_getReverbLevel(event_instance_index, index, buffer_get_address(out_buf));
        __fml_set_error(error, res);
        return (res == FML_RESULT.OK) ? buffer_peek(out_buf, 0, buffer_f32) : undefined;
    }
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_setreverblevel
    /// @param {int} index
    /// @param {number} level
    /// @param {FmlError?} error = undefined
    /// @returns {bool}
    static set_reverb_level = function(index, level, error = undefined)
    {
        var res = __FML_Studio_EventInstance_setReverbLevel(event_instance_index, index, level);
        __fml_set_error(error, res);
        return (res == FML_RESULT.OK);
    }
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_getpaused
    /// @param {FmlError?} error = undefined
    /// @returns {bool}
    static get_paused = function(error = undefined)
    {
        var out_buf = __fml_buffers_fixed[@ buffer_bool];
        var res = __FML_Studio_EventInstance_getPaused(event_instance_index, buffer_get_address(out_buf));
        __fml_set_error(error, res);
        return (res == FML_RESULT.OK) ? bool(buffer_peek(out_buf, 0, buffer_bool)) : undefined;
    }
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_setpaused
    /// @param {bool} paused
    /// @param {FmlError?} error = undefined
    /// @returns {bool}
    static set_paused = function(paused, error = undefined)
    {
        var res = __FML_Studio_EventInstance_setPaused(event_instance_index, paused);
        __fml_set_error(error, res);
        return (res == FML_RESULT.OK);
    }
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_start
    /// @param {FmlError?} error = undefined
    /// @returns {bool}
    static start = function(error = undefined)
    {
        var res = __FML_Studio_EventInstance_start(event_instance_index);
        __fml_set_error(error, res);
        return (res == FML_RESULT.OK);
    }
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_stop
    /// @param {FMOD_STUDIO_STOP_MODE} mode
    /// @param {FmlError?} error = undefined
    /// @returns {bool}
    static stop = function(mode, error = undefined)
    {
        var res = __FML_Studio_EventInstance_stop(event_instance_index, mode);
        __fml_set_error(error, res);
        return (res == FML_RESULT.OK);
    }
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_gettimelineposition
    /// @param {FmlError?} error = undefined
    /// @returns {number}
    static get_timeline_position = function(error = undefined)
    {
        var out_buf = __fml_buffers_fixed[@ buffer_s32];
        var res = __FML_Studio_EventInstance_getTimelinePosition(event_instance_index, buffer_get_address(out_buf));
        __fml_set_error(error, res);
        return (res == FML_RESULT.OK) ? buffer_peek(out_buf, 0, buffer_s32) : undefined;
    }
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_settimelineposition
    /// @param {number} position
    /// @param {FmlError?} error = undefined
    /// @returns {bool}
    static set_timeline_position = function(position, error = undefined)
    {
        var res = __FML_Studio_EventInstance_setTimelinePosition(event_instance_index, position);
        __fml_set_error(error, res);
        return (res == FML_RESULT.OK);
    }
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_getplaybackstate
    /// @param {FmlError?} error = undefined
    /// @returns {FMOD_STUDIO_PLAYBACK_STATE}
    static get_playback_state = function(error = undefined)
    {
        var out_buf = __fml_buffers_fixed[@ buffer_s32];
        var res = __FML_Studio_EventInstance_getPlaybackState(event_instance_index, buffer_get_address(out_buf));
        __fml_set_error(error, res);
        return (res == FML_RESULT.OK) ? buffer_peek(out_buf, 0, buffer_s32) : undefined;
    }
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_getchannelgroup
    /// @param {FmodChannelGroup?} out_channel_group = undefined
    /// @param {FmlError?} error = undefined
    /// @returns {FmodChannelGroup}
    static get_channel_group = function(out_channel_group = undefined, error = undefined)
    {
        var out_buf = __fml_buffers_fixed[@ buffer_u64];
        var res = __FML_Studio_EventInstance_getChannelGroup(event_instance_index, buffer_get_address(out_buf));
        __fml_set_error(error, res);
        if (res == FML_RESULT.OK) {
            if (out_channel_group == undefined) out_channel_group = new FmodChannelGroup();
            out_channel_group.channel_group_index = buffer_peek(out_buf, 0, buffer_u64);
            return out_channel_group;
        }
        return undefined;
    }
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_getminmaxdistance
    /// @param {struct?} out_struct = undefined
    /// @param {FmlError?} error = undefined
    /// @returns {struct}
    static get_min_max_distance = function(out_struct = undefined, error = undefined)
    {
        var out_buf = buffer_create(8, buffer_fixed, 4);
        var res = __FML_Studio_EventInstance_getMinMaxDistance(event_instance_index, buffer_get_address(out_buf));
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
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_release
    /// @param {FmlError?} error = undefined
    /// @returns {bool}
    static release = function(error = undefined)
    {
        var res = __FML_Studio_EventInstance_release(event_instance_index);
        __fml_set_error(error, res);
        return (res == FML_RESULT.OK);
    }
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_isvirtual
    /// @param {FmlError?} error = undefined
    /// @returns {bool}
    static is_virtual = function(error = undefined)
    {
        var out_buf = __fml_buffers_fixed[@ buffer_bool];
        var res = __FML_Studio_EventInstance_isVirtual(event_instance_index, buffer_get_address(out_buf));
        __fml_set_error(error, res);
        return (res == FML_RESULT.OK) ? bool(buffer_peek(out_buf, 0, buffer_bool)) : undefined;
    }
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_getparameterbyid
    /// @param {FMOD_STUDIO_PARAMETER_ID} parameter_id
    /// @param {struct?} out_struct = undefined
    /// @param {FmlError?} error = undefined
    /// @returns {struct}
    static get_parameter_by_id = function(parameter_id, out_struct = undefined, error = undefined)
    {
        var out_buf = buffer_create(8, buffer_fixed, 4);
        var id_buf_ptr = __FMOD_STUDIO_PARAMETER_ID_as_buf_ptr(parameter_id);
        var res = __FML_Studio_EventInstance_getParameterByID(event_instance_index, id_buf_ptr, buffer_get_address(out_buf));
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
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_setparameterbyid
    /// @param {FMOD_STUDIO_PARAMETER_ID} parameter_id
    /// @param {number} value
    /// @param {bool?} ignore_seek_speed = false
    /// @param {FmlError?} error = undefined
    /// @returns {bool}
    static set_parameter_by_id = function(parameter_id, value, ignore_seek_speed = false, error = undefined)
    {
        var id_buf_ptr = __FMOD_STUDIO_PARAMETER_ID_as_buf_ptr(parameter_id);
        var res = __FML_Studio_EventInstance_setParameterByID(event_instance_index, id_buf_ptr, value, ignore_seek_speed);
        __fml_set_error(error, res);
        return (res == FML_RESULT.OK);
    }
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_setparameterbyidwithlabel
    /// @param {FMOD_STUDIO_PARAMETER_ID} parameter_id
    /// @param {string} label
    /// @param {bool?} ignore_seek_speed = false
    /// @param {FmlError?} error = undefined
    /// @returns {bool}
    static set_parameter_by_id_with_label = function(parameter_id, label, ignore_seek_speed = false, error = undefined)
    {
        var id_buf_ptr = __FMOD_STUDIO_PARAMETER_ID_as_buf_ptr(parameter_id);
        var res = __FML_Studio_EventInstance_setParameterByIDWithLabel(event_instance_index, id_buf_ptr, label, ignore_seek_speed);
        __fml_set_error(error, res);
        return (res == FML_RESULT.OK);
    }
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_setparametersbyids
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
            __FMOD_STUDIO_PARAMETER_ID_serialize(parameter_ids[@ i], ids_and_values_buf);
            buffer_write(ids_and_values_buf, buffer_f32, values[@ i]);
        }
        var res = __FML_Studio_EventInstance_setParametersByIDs(event_instance_index, buffer_get_address(ids_and_values_buf), count, ignore_seek_speed);
        __fml_set_error(error, res);
        buffer_delete(ids_and_values_buf);
        return (res == FML_RESULT.OK);
    }
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_getparameterbyname
    /// @param {string} name
    /// @param {struct?} out_struct = undefined
    /// @param {FmlError?} error = undefined
    /// @returns {struct}
    static get_parameter_by_name = function(name, out_struct = undefined, error = undefined)
    {
        var out_buf = buffer_create(8, buffer_fixed, 4);
        var res = __FML_Studio_EventInstance_getParameterByName(event_instance_index, name, buffer_get_address(out_buf));
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
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_setparameterbyname
    /// @param {string} name
    /// @param {number} value
    /// @param {bool?} ignore_seek_speed = false
    /// @param {FmlError?} error = undefined
    /// @returns {bool}
    static set_parameter_by_name = function(name, value, ignore_seek_speed = false, error = undefined)
    {
        var res = __FML_Studio_EventInstance_setParameterByName(event_instance_index, name, value, ignore_seek_speed);
        __fml_set_error(error, res);
        return (res == FML_RESULT.OK);
    }
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_setparameterbynamewithlabel
    /// @param {string} name
    /// @param {string} label
    /// @param {bool?} ignore_seek_speed = false
    /// @param {FmlError?} error = undefined
    /// @returns {bool}
    static set_parameter_by_name_with_label = function(name, label, ignore_seek_speed = false, error = undefined)
    {
        var res = __FML_Studio_EventInstance_setParameterByNameWithLabel(event_instance_index, name, label, ignore_seek_speed);
        __fml_set_error(error, res);
        return (res == FML_RESULT.OK);
    }
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_keyoff
    /// @param {FmlError?} error = undefined
    /// @returns {bool}
    static key_off = function(error = undefined)
    {
        var res = __FML_Studio_EventInstance_keyOff(event_instance_index);
        __fml_set_error(error, res);
        return (res == FML_RESULT.OK);
    }
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_getcpuusage
    /// @param {struct?} out_struct = undefined
    /// @param {FmlError?} error = undefined
    /// @returns {struct}
    static get_cpu_usage = function(out_struct = undefined, error = undefined)
    {
        var out_buf = buffer_create(buffer_sizeof(buffer_u32) * 2, buffer_fixed, buffer_sizeof(buffer_u32));
        var res = __FML_Studio_EventInstance_getCPUUsage(event_instance_index, buffer_get_address(out_buf));
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
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_getmemoryusage
    /// @param {FMOD_STUDIO_MEMORY_USAGE?} out_usage = undefined
    /// @param {FmlError?} error = undefined
    /// @returns {FMOD_STUDIO_MEMORY_USAGE}
    static get_memory_usage = function(out_usage = undefined, error = undefined)
    {
        var out_buf = __fml_buffers_studio_memory_usage;
        var res = __FML_Studio_EventInstance_getMemoryUsage(event_instance_index, buffer_get_address(out_buf));
        __fml_set_error(error, res);
        if (res == FML_RESULT.OK) {
            buffer_seek(out_buf, buffer_seek_start, 0);
            if (out_usage == undefined) out_usage = new FMOD_STUDIO_MEMORY_USAGE();
            __FMOD_STUDIO_MEMORY_USAGE_deserialize(out_usage, out_buf);
            return out_usage;
        }
        return undefined;
    }
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_setcallback
    /// @param {function<int, int, any, void>} callback
    /// @param {int} callback_mask = FMOD_STUDIO_EVENT_CALLBACK_ALL A bitmask of FMOD_STUDIO_EVENT_CALLBACK_xx values.
    /// @param {FmlError?} error = undefined
    /// @returns {bool}
    static set_callback = function(callback, callback_mask = FMOD_STUDIO_EVENT_CALLBACK_ALL, error = undefined)
    {
        var res = __FML_Studio_EventInstance_setCallback(event_instance_index, callback_mask);
        __fml_set_error(error, res);
        if (res == FML_RESULT.OK) {
            global.__fml_callbacks[? event_instance_index] = callback;
            return true;
        }
        return false;
    }
    
    /// https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_getuserdata
    static _get_user_data = function() {}
    /// https://www.fmod.com/docs/2.02/api/studio-api-eventinstance.html#studio_eventinstance_setuserdata
    static _set_user_data = function() {}
}
