
var buffer_types = [
    buffer_u8,
    buffer_s8,
    buffer_u16,
    buffer_s16,
    buffer_u32,
    buffer_s32,
    buffer_u64,
    buffer_f16,
    buffer_f32,
    buffer_f64,
    buffer_bool,
];
globalvar __fml_buffers_fixed; /// @is {buffer[]}
__fml_buffers_fixed = [];
for (var i = 0; i < array_length(buffer_types); ++i) {
    var type = buffer_types[@ i];
    __fml_buffers_fixed[@ type] = buffer_create(buffer_sizeof(type), buffer_fixed, buffer_sizeof(type));
}

globalvar __fml_buffers_guid;  /// @is {buffer}
__fml_buffers_guid = buffer_create(16, buffer_fixed, 1);

globalvar __fml_buffers_parameter_id;   /// @is {buffer}
__fml_buffers_parameter_id = buffer_create(4 * 2, buffer_fixed, buffer_sizeof(buffer_u32));

globalvar __fml_buffers_vector; /// @is {buffer}
__fml_buffers_vector = buffer_create(4 * 3, buffer_fixed, buffer_sizeof(buffer_f32));

globalvar __fml_buffers_3d_attributes; /// @is {buffer}
__fml_buffers_3d_attributes = buffer_create(4 * 3 * 4, buffer_fixed, buffer_sizeof(buffer_f32));

globalvar __fml_buffers_buffer_usage; /// @is {buffer}
__fml_buffers_buffer_usage = buffer_create(4 * 20 * 2, buffer_fixed, 4);

globalvar __fml_buffers_buffer_info; /// @is {buffer}
__fml_buffers_buffer_info = buffer_create(4 * 20 * 2, buffer_fixed, 4);

globalvar __fml_buffers_studio_cpu_usage;   /// @is {buffer}
__fml_buffers_studio_cpu_usage = buffer_create(4 * 5, buffer_fixed, 4);

globalvar __fml_buffers_core_cpu_usage;   /// @is {buffer}
__fml_buffers_core_cpu_usage = buffer_create(4 * 6, buffer_fixed, 4);

globalvar __fml_buffers_studio_memory_usage;   /// @is {buffer}
__fml_buffers_studio_memory_usage = buffer_create(4 * 3, buffer_fixed, 4);




global.__fml_error_callback = undefined;    /// @is {function<FML_RESULT, void>?}

/// @param {FmlError?}   error
/// @param {FML_RESULT?} result
function __fml_set_error(error, result)
{
    if (error != undefined) {
        error.result = result;
    }
    if (global.__fml_error_callback != undefined) {
        global.__fml_error_callback(result);
    }
}
