
#macro FML_VERSION "1.0.0"

/// @param {int} product
/// @param {int} major
/// @param {int} minor
/// @returns {int}
function fml_fmod_version_from_parts(product, major, minor)
{
    return minor | (major << 8) | (product << 16);
}

/// @param {int} version_number
/// @returns {int}
function fml_fmod_version_get_product(version_number)
{
    return version_number >> 16;
}

/// @param {int} version_number
/// @returns {int}
function fml_fmod_version_get_major(version_number)
{
    return version_number << 48 >> 56;
}

/// @param {int} version_number
/// @returns {int}
function fml_fmod_version_get_minor(version_number)
{
    return version_number << 56 >> 56;
}

/// @param {int} version_number
/// @returns {string}
function fml_fmod_version_to_string(version_number)
{
    var product_version = version_number >> 16;
    var major_version   = version_number << 48 >> 56;
    var minor_version   = version_number << 56 >> 56;
    
    static buf = buffer_create(9, buffer_grow, 1);
    buffer_seek(buf, buffer_seek_start, 0);
    buffer_write(buf, buffer_text, product_version);
    buffer_write(buf, buffer_text, ".");
    if (major_version < 10) {
        buffer_write(buf, buffer_text, "0");
    }
    buffer_write(buf, buffer_text, major_version);
    buffer_write(buf, buffer_text, ".");
    if (minor_version < 10) {
        buffer_write(buf, buffer_text, "0");
    }
    buffer_write(buf, buffer_string, minor_version);
    return buffer_peek(buf, 0, buffer_string);
}

global.__fml_callbacks = ds_map_create();   /// @is {ds_map<int, function>}

function fml_update_callbacks()
{
    static initial_buf_size = 128;
    static buf = buffer_create(initial_buf_size, buffer_fixed, 1);
    
    // Read the callback data into the buffer.
    // If necessary, grow the buffer until the incoming data would fit in it.
    var data_size = 0;
    while (true) {
        data_size = __FML_UTIL_getCallbacks(buffer_get_address(buf), buffer_get_size(buf));
        if (data_size > buffer_get_size(buf)) {
            buffer_resize(buf, data_size * 2);
        }
        else {
            break;
        }
    }
    
    buffer_seek(buf, buffer_seek_start, 0);
    
    while (buffer_tell(buf) < data_size) {
        
        var cb = buffer_read(buf, buffer_s32);
        var successfully_read = true;
        
        switch (cb) {
            
            case __FML_CALLBACK.STUDIO_SYSTEM: {
                var type = buffer_read(buf, buffer_u32);
                var studio_system_index = buffer_read(buf, buffer_u64);
                var bank_index = (type == FMOD_STUDIO_SYSTEM_CALLBACK_BANK_UNLOAD) ? real(buffer_read(buf, buffer_u64)) : undefined;
                if (ds_map_exists(global.__fml_callbacks, studio_system_index)) {
                    global.__fml_callbacks[? studio_system_index](type, studio_system_index, bank_index);
                }
                break;
            }
            
            case __FML_CALLBACK.CORE_SYSTEM: {
                var type = buffer_read(buf, buffer_u32);
                var core_system_index = buffer_read(buf, buffer_u64);
                if (ds_map_exists(global.__fml_callbacks, core_system_index)) {
                    global.__fml_callbacks[? core_system_index](type, core_system_index);
                }
                break;
            }
            
            case __FML_CALLBACK.EVENT: {
                var type = buffer_read(buf, buffer_u32);
                var event_instance_index = buffer_read(buf, buffer_u64);
                var parameters = __fml_read_event_callback_parameters(type, buf);
                // Imitate the behavior of event callbacks in the actual FMOD API:
                // If a callback was set for an event instance, use that callback.
                // If not, see if a callback was set for its event description and use that callback instead.
                if (ds_map_exists(global.__fml_callbacks, event_instance_index)) {
                    global.__fml_callbacks[? event_instance_index](type, event_instance_index, parameters);
                }
                else {
                    var ed_out_buf = __fml_buffers_fixed[@ buffer_u64];
                    if (__FML_Studio_EventInstance_getDescription(event_instance_index, buffer_get_address(ed_out_buf)) == FML_RESULT.OK) {
                        var event_description_index = buffer_peek(ed_out_buf, 0, buffer_u64);
                        if (ds_map_exists(global.__fml_callbacks, event_description_index)) {
                            global.__fml_callbacks[? event_description_index](type, event_instance_index, parameters);
                        }
                    }
                }
                break;
            }
            
            default: {
                // Unexpected event type. Need to abort reading because we don't
                // know what data to expect next.
                successfully_read = false;
                break;
            }
        }
        if (!successfully_read) {
            __fml_log_warning("Failed to read FML callbacks: Unexpected callback event type " + string(cb) + ".");
            break;
        }
    }
    
    var max_buf_size = 65536;
    var buf_size = buffer_get_size(buf);
    if (buf_size > max_buf_size) {
        buffer_resize(buf, initial_buf_size);
        __fml_log_warning("Callback buffer grew to an excessive size (" + string(buf_size) + ") and had to be shrunk back down.");
    }
}

/// @param {int} type
/// @param {buffer} buf
/// @returns {any}
function __fml_read_event_callback_parameters(type, buf)
{
    switch (type) {
        case FMOD_STUDIO_EVENT_CALLBACK_CREATE_PROGRAMMER_SOUND:
        case FMOD_STUDIO_EVENT_CALLBACK_DESTROY_PROGRAMMER_SOUND: {
            // TODO: Parameters: FMOD_STUDIO_PROGRAMMER_SOUND_PROPERTIES
            break;
        }
        case FMOD_STUDIO_EVENT_CALLBACK_PLUGIN_CREATED:
        case FMOD_STUDIO_EVENT_CALLBACK_PLUGIN_DESTROYED: {
            // TODO: Parameters: FMOD_STUDIO_PLUGIN_INSTANCE_PROPERTIES
            break;
        }
        case FMOD_STUDIO_EVENT_CALLBACK_TIMELINE_MARKER: {
            var marker_properties = new FMOD_STUDIO_TIMELINE_MARKER_PROPERTIES();
            FMOD_STUDIO_TIMELINE_MARKER_PROPERTIES_deserialize(marker_properties, buf);
            return marker_properties;
        }
        case FMOD_STUDIO_EVENT_CALLBACK_TIMELINE_BEAT: {
            var beat_properties = new FMOD_STUDIO_TIMELINE_BEAT_PROPERTIES();
            FMOD_STUDIO_TIMELINE_BEAT_PROPERTIES_deserialize(beat_properties, buf);
            return beat_properties;
        }
        case FMOD_STUDIO_EVENT_CALLBACK_START_EVENT_COMMAND: {
            // TODO: Parameters: Studio::EventInstance
            break;
        }
        case FMOD_STUDIO_EVENT_CALLBACK_NESTED_TIMELINE_BEAT: {
            var nested_beat_properties = new FMOD_STUDIO_TIMELINE_NESTED_BEAT_PROPERTIES();
            FMOD_STUDIO_TIMELINE_NESTED_BEAT_PROPERTIES_deserialize(nested_beat_properties, buf);
            return nested_beat_properties;
        }
    }
    return undefined;
}
