
/// https://www.fmod.com/resources/documentation-api?version=2.02&page=studio-api-vca.html
function FmodVca() constructor
{
    vca_index = 0;  /// @is {int}
    
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=studio-api-vca.html#studio_vca_isvalid
    /// @param {FmlError?} error = undefined
    /// @returns {bool}
    static is_valid = function(error = undefined)
    {
        var out_buf = __fml_buffers_fixed[@ buffer_bool];
        var res = __FML_Studio_Vca_isValid(vca_index, buffer_get_address(out_buf));
        __fml_set_error(error, res);
        return (res == FML_RESULT.OK) ? bool(buffer_peek(out_buf, 0, buffer_bool)) : undefined;
    }
    
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=studio-api-vca.html#studio_vca_getid
    /// @param {FMOD_GUID?} out_guid = undefined
    /// @param {FmlError?} error = undefined
    /// @returns {FMOD_GUID}
    static get_id = function(out_guid = undefined, error = undefined)
    {
        var out_buf = __fml_buffers_guid;
        var res = __FML_Studio_Vca_getID(vca_index, buffer_get_address(out_buf));
        __fml_set_error(error, res);
        if (res == FML_RESULT.OK) {
            if (out_guid == undefined) out_guid = new FMOD_GUID();
            buffer_seek(out_buf, buffer_seek_start, 0);
            FMOD_GUID_deserialize(out_guid, out_buf);
            return out_guid;
        }
        return undefined;
    }
    
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=studio-api-vca.html#studio_vca_getpath
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
            res = __FML_Studio_Vca_getPath(vca_index, buffer_get_address(out_buf));
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
    
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=studio-api-vca.html#studio_vca_getvolume
    /// @param {struct?} out_struct = undefined
    /// @param {FmlError?} error = undefined
    /// @returns {struct}
    static get_volume = function(out_struct = undefined, error = undefined)
    {
        var out_buf = buffer_create(buffer_sizeof(buffer_f32) * 2, buffer_fixed, buffer_sizeof(buffer_f32));
        var res = __FML_Studio_Vca_getVolume(vca_index, buffer_get_address(out_buf));
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
    
    /// https://www.fmod.com/resources/documentation-api?version=2.02&page=studio-api-vca.html#studio_vca_setvolume
    /// @param {number} volume
    /// @param {FmlError?} error = undefined
    /// @returns {bool}
    static set_volume = function(volume, error = undefined)
    {
        var res = __FML_Studio_Vca_setVolume(vca_index, volume);
        __fml_set_error(error, res);
        return (res == FML_RESULT.OK);
    }
}
