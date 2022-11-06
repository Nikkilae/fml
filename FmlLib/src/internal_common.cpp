
#include <mutex>

#include "internal_common.hpp"

#include "fmod_studio_common.h"
#include "fmod_errors.h"

namespace internal
{
    OBJECT_INDEX objectCounter = 1;
    std::unordered_map<OBJECT_INDEX, void*> fmodObjects = std::unordered_map<OBJECT_INDEX, void*>();
    FMOD_RESULT lastFmodError = FMOD_RESULT::FMOD_OK;

    OBJECT_INDEX objectFindIndex(void* object)
    {
        // TODO: Optimize this unnecessarily linear search.
        for (const auto& p : fmodObjects) {
            if (p.second == object) {
                return p.first;
            }
        }
        return 0;
    }

    void objectRemove(OBJECT_INDEX index)
    {
        fmodObjects.erase(index);
    }

    bool objectExists(OBJECT_INDEX index)
    {
        return index >= 1.0 || index < objectCounter;
    }

    FMOD_GUID read_guid_from_buffer(BufReader& bufReader)
    {
        FMOD_GUID guid;
        guid.Data1 = bufReader.read<buffer_u32>();
        guid.Data2 = bufReader.read<buffer_u16>();
        guid.Data3 = bufReader.read<buffer_u16>();
        // I guess you could optimize this a bit by reading Data4 in one big chunk.
        for (size_t i = 0; i < 8; ++i) {
            guid.Data4[i] = bufReader.read<buffer_u8>();
        }
        return guid;
    }

    void write_guid_to_buffer(const FMOD_GUID& guid, BufWriter& bufWriter)
    {
        bufWriter.write<buffer_u32>(guid.Data1);
        bufWriter.write<buffer_u16>(guid.Data2);
        bufWriter.write<buffer_u16>(guid.Data3);
        // I guess you could optimize this a bit by writing Data4 in one big chunk.
        for (size_t i = 0; i < 8; ++i) {
            bufWriter.write<buffer_u8>(guid.Data4[i]);
        }
    }

    void write_guid_to_dynamic_buffer(const FMOD_GUID& guid, DynamicBuffer& buffer)
    {
        buffer.write<buffer_u32>(guid.Data1);
        buffer.write<buffer_u16>(guid.Data2);
        buffer.write<buffer_u16>(guid.Data3);
        // I guess you could optimize this a bit by writing Data4 in one big chunk.
        for (size_t i = 0; i < 8; ++i) {
            buffer.write<buffer_u8>(guid.Data4[i]);
        }
    }

    FMOD_STUDIO_PARAMETER_ID read_studio_parameter_id_from_buffer(BufReader& bufReader)
    {
        FMOD_STUDIO_PARAMETER_ID id;
        id.data1 = bufReader.read<buffer_u32>();
        id.data2 = bufReader.read<buffer_u32>();
        return id;
    }

    void write_studio_parameter_id_to_buffer(const FMOD_STUDIO_PARAMETER_ID& id, BufWriter& bufWriter)
    {
        bufWriter.write<buffer_u32>(id.data1);
        bufWriter.write<buffer_u32>(id.data2);
    }

    FMOD_3D_ATTRIBUTES read_3d_attributes_from_buffer(BufReader& bufReader)
    {
        FMOD_3D_ATTRIBUTES attributes;
        attributes.position = read_vector_from_buffer(bufReader);
        attributes.velocity = read_vector_from_buffer(bufReader);
        attributes.forward = read_vector_from_buffer(bufReader);
        attributes.up = read_vector_from_buffer(bufReader);
        return attributes;
    }

    void write_3d_attributes_to_buffer(const FMOD_3D_ATTRIBUTES& attributes, BufWriter& bufWriter)
    {
        write_vector_to_buffer(attributes.position, bufWriter);
        write_vector_to_buffer(attributes.velocity, bufWriter);
        write_vector_to_buffer(attributes.forward, bufWriter);
        write_vector_to_buffer(attributes.up, bufWriter);
    }

    FMOD_VECTOR read_vector_from_buffer(BufReader& bufReader)
    {
        FMOD_VECTOR vector;
        vector.x = bufReader.read<float>();
        vector.y = bufReader.read<float>();
        vector.z = bufReader.read<float>();
        return vector;
    }

    void write_vector_to_buffer(const FMOD_VECTOR& vector, BufWriter& bufWriter)
    {
        bufWriter.write(vector.x);
        bufWriter.write(vector.y);
        bufWriter.write(vector.z);
    }

    void write_buffer_usage_to_buffer(const FMOD_STUDIO_BUFFER_USAGE& usage, BufWriter& bufWriter)
    {
        write_buffer_info_to_buffer(usage.studiocommandqueue, bufWriter);
        write_buffer_info_to_buffer(usage.studiohandle, bufWriter);
    }

    void write_buffer_info_to_buffer(const FMOD_STUDIO_BUFFER_INFO& info, BufWriter& bufWriter)
    {
        bufWriter.write<buffer_s32>(info.currentusage);
        bufWriter.write<buffer_s32>(info.peakusage);
        bufWriter.write<buffer_s32>(info.capacity);
        bufWriter.write<buffer_s32>(info.stallcount);
        bufWriter.write<buffer_f32>(info.stalltime);
    }

    void write_core_cpu_usage_to_buffer(const FMOD_CPU_USAGE& usage, BufWriter& bufWriter)
    {
        bufWriter.write<buffer_f32>(usage.dsp);
        bufWriter.write<buffer_f32>(usage.stream);
        bufWriter.write<buffer_f32>(usage.geometry);
        bufWriter.write<buffer_f32>(usage.update);
        bufWriter.write<buffer_f32>(usage.convolution1);
        bufWriter.write<buffer_f32>(usage.convolution2);
    }

    void write_studio_cpu_usage_to_buffer(const FMOD_STUDIO_CPU_USAGE& usage, BufWriter& bufWriter)
    {
        bufWriter.write<buffer_f32>(usage.update);
    }

    void write_studio_memory_usage_to_buffer(const FMOD_STUDIO_MEMORY_USAGE& usage, BufWriter& bufWriter)
    {
        bufWriter.write<buffer_s32>(usage.exclusive);
        bufWriter.write<buffer_s32>(usage.inclusive);
        bufWriter.write<buffer_s32>(usage.sampledata);
    }

    void write_studio_parameter_description_to_buffer(const FMOD_STUDIO_PARAMETER_DESCRIPTION& description, BufWriter& bufWriter)
    {
        bufWriter.write_str(description.name);
        write_studio_parameter_id_to_buffer(description.id, bufWriter);
        bufWriter.write<buffer_f32>(description.minimum);
        bufWriter.write<buffer_f32>(description.maximum);
        bufWriter.write<buffer_f32>(description.defaultvalue);
        bufWriter.write<buffer_s32>(description.type);
        bufWriter.write<buffer_s32>(description.flags);
        write_guid_to_buffer(description.guid, bufWriter);
    }

    size_t get_parameter_description_required_buffer_size(const FMOD_STUDIO_PARAMETER_DESCRIPTION& description)
    {
        return strlen(description.name) + 1 + 44;
    }

    void write_studio_user_property_to_buffer(const FMOD_STUDIO_USER_PROPERTY& property, BufWriter& bufWriter)
    {
        bufWriter.write_str(property.name);
        bufWriter.write<buffer_s32>(property.type);
        switch (property.type) {
            case FMOD_STUDIO_USER_PROPERTY_TYPE_INTEGER: bufWriter.write<buffer_s32>(property.intvalue); break;
            case FMOD_STUDIO_USER_PROPERTY_TYPE_BOOLEAN: bufWriter.write<buffer_s32>(property.boolvalue); break;
            case FMOD_STUDIO_USER_PROPERTY_TYPE_FLOAT:   bufWriter.write<buffer_f32>(property.floatvalue); break;
            case FMOD_STUDIO_USER_PROPERTY_TYPE_STRING:  bufWriter.write_str(property.stringvalue); break;
        }
    }

    size_t get_studio_user_property_required_buffer_size(const FMOD_STUDIO_USER_PROPERTY& property)
    {
        size_t size = 4 + strlen(property.name) + 1;
        if (property.type == FMOD_STUDIO_USER_PROPERTY_TYPE_STRING) {
            size += strlen(property.stringvalue) + 1;
        }
        else {
            size += 4;
        }
        return size;
    }

    FMOD_STUDIO_ADVANCEDSETTINGS read_studio_advanced_settings_from_buffer(BufReader& bufReader)
    {
        FMOD_STUDIO_ADVANCEDSETTINGS settings;
        settings.cbsize = sizeof(FMOD_STUDIO_ADVANCEDSETTINGS);
        settings.commandqueuesize       = bufReader.read<buffer_u32>();
        settings.handleinitialsize      = bufReader.read<buffer_u32>();
        settings.studioupdateperiod     = bufReader.read<buffer_s32>();
        settings.idlesampledatapoolsize = bufReader.read<buffer_s32>();
        settings.streamingscheduledelay = bufReader.read<buffer_u32>();
        settings.encryptionkey          = bufReader.read_str();
        return settings;
    }

    void write_studio_advanced_settings_to_buffer(const FMOD_STUDIO_ADVANCEDSETTINGS& settings, BufWriter& bufWriter)
    {
        bufWriter.write<buffer_u32>(settings.commandqueuesize);
        bufWriter.write<buffer_u32>(settings.handleinitialsize);
        bufWriter.write<buffer_s32>(settings.studioupdateperiod);
        bufWriter.write<buffer_s32>(settings.idlesampledatapoolsize);
        bufWriter.write<buffer_u32>(settings.streamingscheduledelay);
        bufWriter.write_str(settings.encryptionkey != nullptr ? settings.encryptionkey : "");
    }

    size_t get_studio_advanced_settings_required_buffer_size(const FMOD_STUDIO_ADVANCEDSETTINGS& settings)
    {
        size_t size = 21;
        if (settings.encryptionkey != nullptr) {
            size += strlen(settings.encryptionkey);
        }
        return size;
    }

    void write_fml_driver_info_to_buffer(const char* name, const FMOD_GUID& guid, int systemRate, FMOD_SPEAKERMODE speakerMode, int speakerModeChannels, BufWriter& bufWriter)
    {
        bufWriter.write_str(name);
        write_guid_to_buffer(guid, bufWriter);
        bufWriter.write<buffer_s32>(systemRate);
        bufWriter.write<buffer_s32>(speakerMode);
        bufWriter.write<buffer_s32>(speakerModeChannels);
    }

    void write_studio_timeline_beat_properties_to_buffer(const FMOD_STUDIO_TIMELINE_BEAT_PROPERTIES& properties, DynamicBuffer& buffer)
    {
        buffer.write<buffer_s32>(properties.bar);
        buffer.write<buffer_s32>(properties.beat);
        buffer.write<buffer_s32>(properties.position);
        buffer.write<buffer_f32>(properties.tempo);
        buffer.write<buffer_s32>(properties.timesignatureupper);
        buffer.write<buffer_s32>(properties.timesignaturelower);
    }

    void write_studio_timeline_nested_beat_properties_to_buffer(const FMOD_STUDIO_TIMELINE_NESTED_BEAT_PROPERTIES& properties, DynamicBuffer& buffer)
    {
        write_guid_to_dynamic_buffer(properties.eventid, buffer);
        write_studio_timeline_beat_properties_to_buffer(properties.properties, buffer);
    }

    void write_studio_timeline_marker_properties_to_buffer(const FMOD_STUDIO_TIMELINE_MARKER_PROPERTIES& properties, DynamicBuffer& buffer)
    {
        buffer.write_str(properties.name);
        buffer.write<buffer_s32>(properties.position);
    }


    namespace
    {
        constexpr size_t callbackQueueInitialSize = 64;
        void checkCallbackQueueSize()
        {
            constexpr size_t maxSize = 65536;
            if (callbackQueue.tell() > maxSize) {
                callbackQueue.reset(callbackQueueInitialSize);
            }
        }
    }

    // A dynamically growing buffer used as an output of FMOD callback parameters.
    DynamicBuffer callbackQueue = DynamicBuffer(callbackQueueInitialSize);
    // A mutex that should be locked by all functions that use the callbackQueue buffer.
    // This is needed because FMOD may dispatch events in non-main threads.
    std::mutex callbackQueueMutex;

    FMOD_RESULT studioSystemCallback(FMOD_STUDIO_SYSTEM* system, FMOD_STUDIO_SYSTEM_CALLBACK_TYPE type, void* commanddata, void* userdata)
    {
        const std::lock_guard<std::mutex> lock(callbackQueueMutex);
        checkCallbackQueueSize();
        
        callbackQueue.write(FML_CALLBACK::STUDIO_SYSTEM);
        callbackQueue.write<buffer_u32>(type);
        callbackQueue.write<OBJECT_INDEX>(FIND(system));
        if (type == FMOD_STUDIO_SYSTEM_CALLBACK_BANK_UNLOAD) {
            callbackQueue.write<OBJECT_INDEX>(FIND(commanddata));
        }
        // TODO: userdata
        return FMOD_OK;
    }

    FMOD_RESULT coreSystemCallback(FMOD_SYSTEM* system, FMOD_SYSTEM_CALLBACK_TYPE type, void* commanddata1, void* commanddata2, void* userdata)
    {
        const std::lock_guard<std::mutex> lock(callbackQueueMutex);
        checkCallbackQueueSize();

        callbackQueue.write(FML_CALLBACK::CORE_SYSTEM);
        callbackQueue.write<buffer_u32>(type);
        callbackQueue.write<OBJECT_INDEX>(FIND(system));
        // TODO: commanddata1, commanddata2
        // TODO: userdata
        return FMOD_OK;
    }

    FMOD_RESULT eventCallback(FMOD_STUDIO_EVENT_CALLBACK_TYPE type, FMOD_STUDIO_EVENTINSTANCE* event, void* parameters)
    {
        const std::lock_guard<std::mutex> lock(callbackQueueMutex);
        checkCallbackQueueSize();

        callbackQueue.write(FML_CALLBACK::EVENT);
        callbackQueue.write<buffer_u32>(type);
        callbackQueue.write<OBJECT_INDEX>(FIND(event));
        
        switch (type) {
            case FMOD_STUDIO_EVENT_CALLBACK_CREATED:
            case FMOD_STUDIO_EVENT_CALLBACK_DESTROYED:
            case FMOD_STUDIO_EVENT_CALLBACK_STARTING:
            case FMOD_STUDIO_EVENT_CALLBACK_STARTED:
            case FMOD_STUDIO_EVENT_CALLBACK_RESTARTED:
            case FMOD_STUDIO_EVENT_CALLBACK_STOPPED:
            case FMOD_STUDIO_EVENT_CALLBACK_START_FAILED: {
                // No parameters.
                break;
            }
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
                auto properties = (FMOD_STUDIO_TIMELINE_MARKER_PROPERTIES*)parameters;
                write_studio_timeline_marker_properties_to_buffer(*properties, callbackQueue);
                break;
            }
            case FMOD_STUDIO_EVENT_CALLBACK_TIMELINE_BEAT: {
                auto properties = (FMOD_STUDIO_TIMELINE_BEAT_PROPERTIES*)parameters;
                write_studio_timeline_beat_properties_to_buffer(*properties, callbackQueue);
                break;
            }
            case FMOD_STUDIO_EVENT_CALLBACK_SOUND_PLAYED:
            case FMOD_STUDIO_EVENT_CALLBACK_SOUND_STOPPED:
            case FMOD_STUDIO_EVENT_CALLBACK_REAL_TO_VIRTUAL:
            case FMOD_STUDIO_EVENT_CALLBACK_VIRTUAL_TO_REAL: {
                // No parameters.
                break;
            }
            case FMOD_STUDIO_EVENT_CALLBACK_START_EVENT_COMMAND: {
                // TODO: Parameters: Studio::EventInstance
                break;
            }
            case FMOD_STUDIO_EVENT_CALLBACK_NESTED_TIMELINE_BEAT: {
                auto properties = (FMOD_STUDIO_TIMELINE_NESTED_BEAT_PROPERTIES*)parameters;
                write_studio_timeline_nested_beat_properties_to_buffer(*properties, callbackQueue);
                break;
            }
        }

        return FMOD_OK;
    }

}
