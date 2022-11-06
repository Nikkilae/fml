#pragma once

#include <unordered_map>
#include <string>
#include <cstring>
#include <mutex>
#include <algorithm>

#include "fmod_common.h"
#include "fmod_studio_common.h"

#define FML_VERSION "1.0.0"

#ifdef FML_IS_UBUNTU
    #define EXT extern "C"
#else
    #define EXT extern "C" __declspec(dllexport)
#endif

using buffer_f32  = float;
using buffer_f64  = double;
using buffer_s8   = int8_t;
using buffer_s16  = int16_t;
using buffer_s32  = int32_t;
using buffer_s64  = int64_t;
using buffer_u8   = uint8_t;
using buffer_u16  = uint16_t;
using buffer_u32  = uint32_t;
using buffer_u64  = uint64_t;
using buffer_bool = bool;

using __FML_BUFFER_SIZE_HINT_TYPE = buffer_s32;
using BSHT = __FML_BUFFER_SIZE_HINT_TYPE;

using OBJECT_INDEX = buffer_u64;

#define GET internal::objectGet
#define ADD internal::objectAdd
#define FIND internal::objectFindIndex
#define CHECK_OBJECT_INDEX(index) { if (index < 1 || index >= internal::objectCounter) { return static_cast<double>(FML_ERROR::OBJECT_DOESNT_EXIST); } }

enum class FML_ERROR
{
    BUFFER_TOO_SMALL = -2,
    OBJECT_DOESNT_EXIST = -1,
};

enum class FML_CALLBACK : buffer_s32
{
    STUDIO_SYSTEM = 0,
    CORE_SYSTEM,
    EVENT,
};

namespace internal
{

    extern OBJECT_INDEX objectCounter;
    extern std::unordered_map<OBJECT_INDEX, void*> fmodObjects;
    extern FMOD_RESULT lastFmodError;


    template<typename T>
    T* objectGet(OBJECT_INDEX index)
    {
        return static_cast<T*>(fmodObjects.at(index));
    }

    OBJECT_INDEX objectFindIndex(void* object);

    template <typename T>
    OBJECT_INDEX objectAdd(T* object)
    {
        // See if this pointer has already been added to the map and return its key if it has.
        OBJECT_INDEX existingId = objectFindIndex(object);
        if (existingId > 0) {
            return existingId;
        }
        OBJECT_INDEX id = objectCounter++;
        fmodObjects.insert({ id, static_cast<void*>(object) });
        return id;
    }

    void objectRemove(OBJECT_INDEX index);
    bool objectExists(OBJECT_INDEX index);

    class BufReader
    {
    private:
        const char* buffer;
    public:
        explicit BufReader(const char* buffer) : buffer(buffer)
        { }
        template<typename T>
        T read()
        {
            T value = *(T*)buffer;
            buffer += sizeof(T);
            return value;
        }
        const char* read_str()
        {
            const char* str = buffer;
            buffer += strlen(str) + 1;
            return str;
        }
    };

    class BufWriter
    {
    private:
        char* buffer;
    public:
        explicit BufWriter(char* buffer) : buffer(buffer)
        { }
        template<typename T>
        T read()
        {
            T value = *(T*)buffer;
            buffer += sizeof(T);
            return value;
        }
        const char* read_str()
        {
            const char* str = buffer;
            buffer += strlen(str) + 1;
            return str;
        }
        template<typename T>
        void write(const T& value)
        {
            *(T*)buffer = value;
            buffer += sizeof(T);
        }
        void write_str(const char* str)
        {
            size_t len = strlen(str);
            strcpy(buffer, str);
            buffer += len + 1;
        }
    };

    class DynamicBuffer
    {
    private:

        char* buffer;
        size_t buffer_size;
        size_t pos;

        void double_size()
        {
            size_t new_size = (buffer_size > 0) ? (buffer_size * 2) : 16;
            buffer = static_cast<char*>(realloc(buffer, new_size));
            buffer_size = new_size;
        }

    public:

        DynamicBuffer(size_t size)
        {
            buffer = static_cast<char*>(malloc(size));
            buffer_size = size;
            pos = 0;
        }
        ~DynamicBuffer()
        {
            free(buffer);
        }

        void reset(size_t size)
        {
            buffer = static_cast<char*>(realloc(buffer, size));
            buffer_size = size;
            pos = 0;
        }

        template<typename T>
        void write(const T& value)
        {
            if (buffer_size - pos >= sizeof(T)) {
                *(T*)(buffer + pos) = value;
                pos += sizeof(T);
            }
            else {
                double_size();
                write<T>(value);
            }
        }

        void write_str(const char* str)
        {
            size_t len = strlen(str);
            if (buffer_size - pos >= len + 1) {
                strcpy(buffer + pos, str);
                pos += len + 1;
            }
            else {
                double_size();
                write_str(str);
            }
        }

        const char* data()
        {
            return buffer;
        }
        
        size_t tell()
        {
            return pos;
        }

        void seek(size_t position)
        {
            pos = position;
        }
    };

    FMOD_GUID read_guid_from_buffer(BufReader& bufReader);
    void write_guid_to_buffer(const FMOD_GUID& guid, BufWriter& bufWriter);
    FMOD_STUDIO_PARAMETER_ID read_studio_parameter_id_from_buffer(BufReader& bufReader);
    void write_studio_parameter_id_to_buffer(const FMOD_STUDIO_PARAMETER_ID& id, BufWriter& bufWriter);

    FMOD_3D_ATTRIBUTES read_3d_attributes_from_buffer(BufReader& bufReader);
    void write_3d_attributes_to_buffer(const FMOD_3D_ATTRIBUTES& attributes, BufWriter& bufWriter);

    FMOD_VECTOR read_vector_from_buffer(BufReader& bufReader);
    void write_vector_to_buffer(const FMOD_VECTOR& vector, BufWriter& bufWriter);

    void write_buffer_usage_to_buffer(const FMOD_STUDIO_BUFFER_USAGE& usage, BufWriter& bufWriter);
    
    void write_buffer_info_to_buffer(const FMOD_STUDIO_BUFFER_INFO& info, BufWriter& bufWriter);
    
    void write_core_cpu_usage_to_buffer(const FMOD_CPU_USAGE& usage, BufWriter& bufWriter);

    void write_studio_cpu_usage_to_buffer(const FMOD_STUDIO_CPU_USAGE& usage, BufWriter& bufWriter);

    void write_studio_memory_usage_to_buffer(const FMOD_STUDIO_MEMORY_USAGE& usage, BufWriter& bufWriter);

    void write_studio_parameter_description_to_buffer(const FMOD_STUDIO_PARAMETER_DESCRIPTION& description, BufWriter& bufWriter);
    size_t get_parameter_description_required_buffer_size(const FMOD_STUDIO_PARAMETER_DESCRIPTION& description);

    void write_studio_user_property_to_buffer(const FMOD_STUDIO_USER_PROPERTY& property, BufWriter& bufWriter);
    size_t get_studio_user_property_required_buffer_size(const FMOD_STUDIO_USER_PROPERTY& property);

    FMOD_STUDIO_ADVANCEDSETTINGS read_studio_advanced_settings_from_buffer(BufReader& bufReader);
    void write_studio_advanced_settings_to_buffer(const FMOD_STUDIO_ADVANCEDSETTINGS& settings, BufWriter& bufWriter);
    size_t get_studio_advanced_settings_required_buffer_size(const FMOD_STUDIO_ADVANCEDSETTINGS& settings);

    void write_fml_driver_info_to_buffer(const char* name, const FMOD_GUID& guid, int systemRate, FMOD_SPEAKERMODE speakerMode, int speakerModeChannels, BufWriter& bufWriter);
    
    template<typename T>
    void poke(char* buffer, const T& value)
    {
        *(T*)buffer = value;
    }
    


    extern DynamicBuffer callbackQueue;
    extern std::mutex callbackQueueMutex;

    FMOD_RESULT studioSystemCallback(FMOD_STUDIO_SYSTEM* system, FMOD_STUDIO_SYSTEM_CALLBACK_TYPE type, void* commanddata, void* userdata);
    FMOD_RESULT coreSystemCallback(FMOD_SYSTEM* system, FMOD_SYSTEM_CALLBACK_TYPE type, void* commanddata1, void* commanddata2, void* userdata);
    FMOD_RESULT eventCallback(FMOD_STUDIO_EVENT_CALLBACK_TYPE type, FMOD_STUDIO_EVENTINSTANCE* event, void* parameters);
}
