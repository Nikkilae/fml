
function FML_DSP_BUFFER_SIZE() constructor
{
    buffer_length = 0;  /// @is {number}
    num_buffers = 0;    /// @is {number}
}

/// @param {FML_DSP_BUFFER_SIZE} dsp_buffer_size
/// @param {buffer} buf
function __FML_DSP_BUFFER_SIZE_deserialize(dsp_buffer_size, buf)
{
    dsp_buffer_size.buffer_length   = real(buffer_read(buf, buffer_u32));
    dsp_buffer_size.num_buffers     = real(buffer_read(buf, buffer_s32));
}
