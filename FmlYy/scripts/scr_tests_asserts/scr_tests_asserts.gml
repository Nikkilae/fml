
// In the current version of GMS2, there are issues with bool() and is_bool()
// in YYC builds, so let's temporarily replace it with is_numeric in YYC builds.
// This macro should be removed as soon as this project is migrated to a new 
// version of GMS2 in which the issue has been fixed.
#macro __builtin_is_bool is_bool
#macro is_bool __is_bool_override
function __is_bool_override(value)
{
    return code_is_compiled() ? is_numeric(value) : __builtin_is_bool(value);
}

/// @param {bool} condition
function ASSERT_TRUE(condition)
{
    if (!is_bool(condition)) {
        throw new AssertionFailedException("Expected boolean true but got a " + typeof(condition) + " " + string(condition) + ".");
    }
    if (!condition) {
        throw new AssertionFailedException("Expected boolean true but got false.");
    }
}

/// @param {bool} condition
function ASSERT_FALSE(condition)
{
    if (!is_bool(condition)) {
        throw new AssertionFailedException("Expected boolean false but got a " + typeof(condition) + " " + string(condition) + ".");
    }
    if (condition) {
        throw new AssertionFailedException("Expected boolean false but got true.");
    }
}

/// @param {any} value
function ASSERT_UNDEFINED(value)
{
    if (value != undefined) {
        throw new AssertionFailedException("Expected value to be undefined but it instead it was " + string(value) + ".");
    }
}

/// @param {any} value
function ASSERT_DEFINED(value)
{
    if (value == undefined) {
        throw new AssertionFailedException("Expected value to be defined but it instead it was undefined.");
    }
}

/// @param {any} v1
/// @param {any} v2
function ASSERT_EQUALS(v1, v2)
{
    if (v1 != v2) {
        throw new AssertionFailedException("Expected values to be equal but instead they were " + string(v1) + " and " + string(v2) + ".");
    }
}

/// @param {FmlError} error
function ASSERT_NO_FML_ERROR(error)
{
    if (error.result != FML_RESULT.OK) {
        throw new AssertionFailedException("Expected no error but found this error: [" + string(error.result) + "] \"" + error.toString() + "\"");
    }
}

/// @param {FmlError} error
/// @param {FML_RESULT?} result = undefined
function ASSERT_FML_ERROR(error, result = undefined)
{
    if (result != undefined) {
        if (error.result != result) {
            throw new AssertionFailedException("Expected error " + string(result) + " but instead got result " + string(error.result) + ".");
        }
    }
    else {
        if (error.result == FML_RESULT.OK) {
            throw new AssertionFailedException("Expected an error but instead got an OK result.");
        }
    }
}

/// @param {any} v1
/// @param {any} v2
function ASSERT_NOT_EQUALS(v1, v2)
{
    if (v1 == v2) {
        throw new AssertionFailedException("Expected values to not be equal but instead they were " + string(v1) + " and " + string(v2) + ".");
    }
}

/// @param {array} a1
/// @param {array} a2
function ASSERT_ARRAY_EQUALS(a1, a2)
{
    if (!array_equals(a1, a2)) {
        throw new AssertionFailedException("Expected arrays to be equal but they weren't.");
    }
}

/// @param {struct} s_1
/// @param {struct} s_2
function ASSERT_STRUCT_DEEP_EQUALS(s_1, s_2)
{
    if (s_1 == s_2) {
        throw new AssertionFailedException("The two given references point to the same struct.");
    }
    
    if (instanceof(s_1) != instanceof(s_2)) {
        throw new AssertionFailedException("The instanceof() of the two structs aren't the same.");
    }
    
    var names_1 = variable_struct_get_names(s_1);
    var names_2 = variable_struct_get_names(s_2);
    var num_names_1 = array_length(names_1);
    var num_names_2 = array_length(names_2);
    if (num_names_1 != num_names_2) {
        throw new AssertionFailedException("The two structs have a different amount of variables in them.");
    }
    for (var i = 0; i < num_names_1; ++i) {
        var name = names_1[@ i];
        if (!variable_struct_exists(s_2, name)) {
            throw new AssertionFailedException("The second struct doesn't have the variable \"" + name + "\" in it.");
        }
        var value_1 = s_1[$ name];
        var value_2 = s_2[$ name];
        var type_1 = typeof(value_1);
        var type_2 = typeof(value_2);
        if (type_1 != type_2) {
            throw new AssertionFailedException("The types of variable \"" + name + "\" are not the same with the two structs (" + type_1 + " and " + type_2 + ").");
        }
        if (type_1 == "array") {
            ASSERT_ARRAY_DEEP_EQUALS(value_1, value_2);
        }
        else if (type_1 == "struct") {
            ASSERT_STRUCT_DEEP_EQUALS(value_1, value_2);
        }
        else {
            if (value_1 != value_2) {
                throw new AssertionFailedException("The values of variable\"" + name + "\" aren't the same with the two structs (" + string(value_1) + " and " + string(value_2) + ").");
            }
        }
    }
}

/// @param {array} a_1
/// @param {array} a_2
function ASSERT_ARRAY_DEEP_EQUALS(a_1, a_2)
{
    if (a_1 == a_2) {
        throw new AssertionFailedException("The two given references point to the same array.");
    }
    
    var len_1 = array_length(a_1);
    var len_2 = array_length(a_2);
    if (len_1 != len_2) {
        throw new AssertionFailedException("The lengths of the two arrays are not the same.");
    }
    for (var i = 0; i < len_1; ++i) {
        var value_1 = a_1[@ i];
        var value_2 = a_2[@ i];
        var type_1 = typeof(value_1);
        var type_2 = typeof(value_2);
        if (type_1 != type_2) {
            throw new AssertionFailedException("The types of values at index " + string(i) + " are not the same with the two arrays (" + type_1 + " and " + type_2 + ").");
        }
        if (type_1 == "array") {
            ASSERT_ARRAY_DEEP_EQUALS(value_1, value_2);
        }
        else if (type_1 == "struct") {
            ASSERT_STRUCT_DEEP_EQUALS(value_1, value_2);
        }
        else {
            if (value_1 != value_2) {
                throw new AssertionFailedException("The values at index " + string(i) + " aren't the same with the two arrays (" + string(value_1) + " and " + string(value_2) + ").");
            }
        }
    }
}

/// @param {any}    value
/// @param {string} type
function ASSERT_TYPEOF(value, type)
{
    var actual_type = typeof(value);
    if (actual_type != type) {
        throw new AssertionFailedException("Expected typeof(value) to be \"" + type + "\" but it was \"" + actual_type + "\".");
    }
}

/// @param {any}    value
/// @param {string} type
function ASSERT_INSTANCEOF(value, type)
{
    var actual_type = instanceof(value);
    if (actual_type != type) {
        throw new AssertionFailedException("Expected instanceof(value) to be \"" + type + "\" but it was \"" + string(actual_type) + "\".");
    }
}
