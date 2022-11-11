
/// https://www.fmod.com/docs/2.02/api/core-api-common.html#fmod_guid
function FMOD_GUID() constructor
{
    Data1 = 0;                  /// @is {int}
    Data2 = 0;                  /// @is {int}
    Data3 = 0;                  /// @is {int}
    Data4 = array_create(8, 0); /// @is {int[]}
    
    /// @returns {string}
    static toString = function()
    {
        return __FML_UTIL_guidToString(__FMOD_GUID_as_buf_ptr(self));
    }
}

/// @param {string} guid_string
/// @param {FMOD_GUID} out_guid = undefined
/// @param {FmlError?} error = undefined
/// @returns {FMOD_GUID}
function FMOD_GUID_from_string(guid_string, out_guid = undefined, error = undefined)
{
    var out_buf = __fml_buffers_guid;
    var res = __FML_Studio_ParseID(guid_string, buffer_get_address(out_buf));
    __fml_set_error(error, res);
    if (res == FML_RESULT.OK) {
        if (out_guid == undefined) out_guid = new FMOD_GUID();
        buffer_seek(out_buf, buffer_seek_start, 0);
        __FMOD_GUID_deserialize(out_guid, out_buf);
        return out_guid;
    }
    return undefined;
}

/// @param {FMOD_GUID} guid
/// @param {buffer} buf
function __FMOD_GUID_serialize(guid, buf)
{
    buffer_write(buf, buffer_u32, guid.Data1);
    buffer_write(buf, buffer_u16, guid.Data2);
    buffer_write(buf, buffer_u16, guid.Data3);
    for (var i = 0; i < 8; ++i) {
        buffer_write(buf, buffer_u8, guid.Data4[@ i]);
    }
}

/// @param {FMOD_GUID} guid
/// @param {buffer} buf
function __FMOD_GUID_deserialize(guid, buf)
{
    guid.Data1 = int64(buffer_read(buf, buffer_u32));
    guid.Data2 = int64(buffer_read(buf, buffer_u16));
    guid.Data3 = int64(buffer_read(buf, buffer_u16));
    for (var i = 0; i < 8; ++i) {
        guid.Data4[@ i] = int64(buffer_read(buf, buffer_u8));
    }
}

/// @param {FMOD_GUID} guid
/// @returns {pointer}
function __FMOD_GUID_as_buf_ptr(guid)
{
    var buf = __fml_buffers_guid;
    buffer_seek(buf, buffer_seek_start, 0);
    __FMOD_GUID_serialize(guid, buf);
    return buffer_get_address(buf);
}
