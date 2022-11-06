event_inherited();

var error = new FmlError();
sys = __tests_create_system(error);  /// @is {FmodStudioSystem}
var event = sys.get_event("event:/Beats");
event.set_callback(function(type/*: int*/, event_instance_index/*: int*/, parameters/*: any*/) {
    switch (type) {
        case FMOD_STUDIO_EVENT_CALLBACK_TIMELINE_BEAT: {
            show_debug_message("FMOD_STUDIO_EVENT_CALLBACK_TIMELINE_BEAT");
            break;
        }
        case FMOD_STUDIO_EVENT_CALLBACK_NESTED_TIMELINE_BEAT: {
            show_debug_message("FMOD_STUDIO_EVENT_CALLBACK_NESTED_TIMELINE_BEAT");
            break;
        }
        case FMOD_STUDIO_EVENT_CALLBACK_TIMELINE_MARKER: {
            show_debug_message("FMOD_STUDIO_EVENT_CALLBACK_TIMELINE_MARKER");
            break;
        }
        default: {
            return;
        }
    }
    show_debug_message(parameters);
}, FMOD_STUDIO_EVENT_CALLBACK_ALL);
var event_instance = event.create_instance();
event_instance.start();