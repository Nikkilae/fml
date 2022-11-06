#pragma once

#include "internal_common.hpp"

EXT double FML_Studio_EventInstance_isValid(double eventInstanceIndex, char* isValidOutBuf);
EXT double FML_Studio_EventInstance_getDescription(double eventInstanceIndex, char* descriptionIndexOutBuf);
EXT double FML_Studio_EventInstance_getVolume(double eventInstanceIndex, char* volumeAndFinalVolumeOutBuf);
EXT double FML_Studio_EventInstance_setVolume(double eventInstanceIndex, double volume);
EXT double FML_Studio_EventInstance_getPitch(double eventInstanceIndex, char* pitchAndFinalPitchOutBuf);
EXT double FML_Studio_EventInstance_setPitch(double eventInstanceIndex, double pitch);
EXT double FML_Studio_EventInstance_get3DAttributes(double eventInstanceIndex, char* attributesOutBuf);
EXT double FML_Studio_EventInstance_set3DAttributes(double eventInstanceIndex, const char* attributesBuf);
EXT double FML_Studio_EventInstance_getListenerMask(double eventInstanceIndex, char* maskOutBuf);
EXT double FML_Studio_EventInstance_setListenerMask(double eventInstanceIndex, double mask);
EXT double FML_Studio_EventInstance_getProperty(double eventInstanceIndex, double index, char* valueOutBuf);
EXT double FML_Studio_EventInstance_setProperty(double eventInstanceIndex, double index, double value);
EXT double FML_Studio_EventInstance_getReverbLevel(double eventInstanceIndex, double index, char* levelOutBuf);
EXT double FML_Studio_EventInstance_setReverbLevel(double eventInstanceIndex, double index, double level);
EXT double FML_Studio_EventInstance_getPaused(double eventInstanceIndex, char* pausedOutBuf);
EXT double FML_Studio_EventInstance_setPaused(double eventInstanceIndex, double paused);
EXT double FML_Studio_EventInstance_start(double eventInstanceIndex);
EXT double FML_Studio_EventInstance_stop(double eventInstanceIndex, double mode);
EXT double FML_Studio_EventInstance_getTimelinePosition(double eventInstanceIndex, char* positionOutBuf);
EXT double FML_Studio_EventInstance_setTimelinePosition(double eventInstanceIndex, double position);
EXT double FML_Studio_EventInstance_getPlaybackState(double eventInstanceIndex, char* stateOutBuf);
EXT double FML_Studio_EventInstance_getChannelGroup(double eventInstanceIndex, char* groupIndexOutBuf);
EXT double FML_Studio_EventInstance_getMinMaxDistance(double eventDescriptionIndex, char* minAndMaxOutBuf);
EXT double FML_Studio_EventInstance_release(double eventInstanceIndex);
EXT double FML_Studio_EventInstance_isVirtual(double eventInstanceIndex, char* isVirtualOutBuf);
EXT double FML_Studio_EventInstance_getParameterByID(double eventInstanceIndex, const char* parameterIdBuf, char* valueAndFinalValueOutBuf);
EXT double FML_Studio_EventInstance_setParameterByID(double eventInstanceIndex, const char* parameterIdBuf, double value, double ignoreSeekSpeed);
EXT double FML_Studio_EventInstance_setParameterByIDWithLabel(double eventInstanceIndex, const char* parameterIdBuf, const char* label, double ignoreSeekSpeed);
EXT double FML_Studio_EventInstance_setParametersByIDs(double eventInstanceIndex, const char* parameterIdsAndValuesBuf, double count, double ignoreSeekSpeed);
EXT double FML_Studio_EventInstance_getParameterByName(double eventInstanceIndex, const char* name, char* valueAndFinalValueOutBuf);
EXT double FML_Studio_EventInstance_setParameterByName(double eventInstanceIndex, const char* name, double value, double ignoreSeekSpeed);
EXT double FML_Studio_EventInstance_setParameterByNameWithLabel(double eventInstanceIndex, const char* name, const char* label, double ignoreSeekSpeed);
EXT double FML_Studio_EventInstance_keyOff(double eventInstanceIndex);
EXT double FML_Studio_EventInstance_getCPUUsage(double eventInstanceIndex, char* outBuf);
EXT double FML_Studio_EventInstance_getMemoryUsage(double eventInstanceIndex, char* memoryUsageOutBuf);
EXT double FML_Studio_EventInstance_setCallback(double eventInstanceIndex, double callbackMask);

// FMOD_RESULT F_API getUserData(void** userdata);
// FMOD_RESULT F_API setUserData(void* userdata);
