
/// @param {FML_RESULT} result = FML_RESULT.OK
function FmlError(_result = FML_RESULT.OK) constructor
{
    result = _result;   /// @is {FML_RESULT}
    
    /// @returns {string}
    static toString = function()
    {
        return __FML_UTIL_errorString(result);
    }
}

/// @param {function<FML_RESULT, void>?} callback
/// @returns {function<FML_RESULT, void>?}  The previously set callback or undefined if there wasn't one.
function fml_set_error_callback(callback)
{
    var previous_callback = global.__fml_error_callback;
    global.__fml_error_callback = callback;
    return previous_callback;
}

/// @param {FML_RESULT} result
/// @returns {string}
function fml_get_result_string(result)
{
    return (result < 0) ? __FML_UTIL_errorString(result) : __FML_ErrorString(result);
}
