#pragma once

#include "internal_common.hpp"

EXT double FML_Studio_System_create(double headerVersion, char* systemIndexOutBuf);
EXT double FML_Studio_System_setAdvancedSettings(double studioSystemIndex, const char* settings);
EXT double FML_Studio_System_getAdvancedSettings(double studioSystemIndex, char* settingsOutBuf);
EXT double FML_Studio_System_initialize(double studioSystemIndex, double maxChannels, double studioFlags, double coreFlags);
EXT double FML_Studio_System_release(double studioSystemIndex);
EXT double FML_Studio_System_isValid(double studioSystemIndex, char* isValidOutBuf);
EXT double FML_Studio_System_update(double studioSystemIndex);
EXT double FML_Studio_System_flushCommands(double studioSystemIndex);
EXT double FML_Studio_System_flushSampleLoading(double studioSystemIndex);
EXT double FML_Studio_System_getCoreSystem(double studioSystemIndex, char* coreSystemIndexOutBuf);
EXT double FML_Studio_System_getEvent(double studioSystemIndex, const char* path, char* eventIndexOutBuf);
EXT double FML_Studio_System_getBus(double studioSystemIndex, const char* path, char* busIndexOutBuf);
EXT double FML_Studio_System_getVCA(double studioSystemIndex, const char* path, char* vcaIndexOutBuf);
EXT double FML_Studio_System_getBank(double studioSystemIndex, const char* path, char* bankIndexOutBuf);
EXT double FML_Studio_System_getEventByID(double studioSystemIndex, const char* id, char* eventIndexOutBuf);
EXT double FML_Studio_System_getBusByID(double studioSystemIndex, const char* id, char* busIndexOutBuf);
EXT double FML_Studio_System_getVCAByID(double studioSystemIndex, const char* id, char* vcaIndexOutBuf);
EXT double FML_Studio_System_getBankByID(double studioSystemIndex, const char* id, char* bankIndexOutBuf);

// FMOD_RESULT F_API getSoundInfo(const char* key, FMOD_STUDIO_SOUND_INFO* info) const;

EXT double FML_Studio_System_getParameterDescriptionByName(double studioSystemIndex, const char* name, char* descriptionOutBuf);
EXT double FML_Studio_System_getParameterDescriptionByID(double studioSystemIndex, const char *idBuffer, char* descriptionOutBuf);
EXT double FML_Studio_System_getParameterLabelByName(double studioSystemIndex, const char* name, double labelindex, char* labelOutBuf);
EXT double FML_Studio_System_getParameterLabelByID(double studioSystemIndex, const char* parameterIdBuf, double labelIndex, char* labelOutBuf);
EXT double FML_Studio_System_getParameterByID(double studioSystemIndex, const char* parameterIdBuf, char* valueAndFinalValueOutBuf);
EXT double FML_Studio_System_setParameterByID(double studioSystemIndex, const char* parameterIdBuf, double value, double ignoreSeekSpeed);
EXT double FML_Studio_System_setParameterByIDWithLabel(double studioSystemIndex, const char* parameterIdBuf, const char* label, double ignoreSeekSpeed);
EXT double FML_Studio_System_setParametersByIDs(double studioSystemIndex, const char* parameterIdsAndValuesBuf, double count, double ignoreSeekSpeed);
EXT double FML_Studio_System_getParameterByName(double studioSystemIndex, const char* name, char* valueAndFinalValueOutBuf);
EXT double FML_Studio_System_setParameterByName(double studioSystemIndex, const char* name, double value, double ignoreSeekSpeed);
EXT double FML_Studio_System_setParameterByNameWithLabel(double studioSystemIndex, const char* name, const char* label, double ignoreSeekSpeed);
EXT double FML_Studio_System_lookupID(double studioSystemIndex, const char* path, char* idOutBuf);
EXT double FML_Studio_System_lookupPath(double studioSystemIndex, const char* id, char* pathOutBuf);
EXT double FML_Studio_System_getNumListeners(double studioSystemIndex, char* numListenersOutBuf);
EXT double FML_Studio_System_setNumListeners(double studioSystemIndex, double numlisteners);
EXT double FML_Studio_System_getListenerAttributes(double studioSystemIndex, double listener, char* attributesOutBuf, char* attenuationPositionOutBuf);
EXT double FML_Studio_System_setListenerAttributes(double studioSystemIndex, double listener, const char* attributesBuf, const char* attenuationPositionBuf);
EXT double FML_Studio_System_getListenerWeight(double studioSystemIndex, double listener, char* weightOutBuf);
EXT double FML_Studio_System_setListenerWeight(double studioSystemIndex, double listener, double weight);
EXT double FML_Studio_System_loadBankFile(double studioSystemIndex, const char* filename, double flags, char* bankIndexOutBuf);
EXT double FML_Studio_System_loadBankMemory(double studioSystemIndex, const char* bankBuffer, const char* argsBuffer, char* bankIndexOutBuf);

// FMOD_RESULT F_API loadBankCustom(const FMOD_STUDIO_BANK_INFO* info, FMOD_STUDIO_LOAD_BANK_FLAGS flags, Bank** bank);

EXT double FML_Studio_System_unloadAll(double studioSystemIndex);
EXT double FML_Studio_System_getBufferUsage(double studioSystemIndex, char* usageOutBuf);
EXT double FML_Studio_System_resetBufferUsage(double studioSystemIndex);

// FMOD_RESULT F_API registerPlugin(const FMOD_DSP_DESCRIPTION* description);

EXT double FML_Studio_System_unregisterPlugin(double studioSystemIndex, const char* name);
EXT double FML_Studio_System_getBankCount(double studioSystemIndex, char* countOutBuf);
EXT double FML_Studio_System_getBankList(double studioSystemIndex, char* bankIndicesOutBuf, char* countOutBuf);
EXT double FML_Studio_System_getParameterDescriptionCount(double studioSystemIndex, char* countOutBuf);
EXT double FML_Studio_System_getParameterDescriptionList(double studioSystemIndex, char* descriptionsOutBuf, char* countOutBuf);
EXT double FML_Studio_System_startCommandCapture(double studioSystemIndex, const char* filename, double flags);
EXT double FML_Studio_System_stopCommandCapture(double studioSystemIndex);
EXT double FML_Studio_System_loadCommandReplay(double studioSystemIndex, const char* filename, double flags, char* replayIndexOutBuf);
EXT double FML_Studio_System_setCallback(double studioSystemIndex, double callbackMask);

// FMOD_RESULT F_API getUserData(void** userdata) const;
// FMOD_RESULT F_API setUserData(void* userdata);

EXT double FML_Studio_System_getCPUUsage(double studioSystemIndex, char* studioUsageOutBuf, char* coreUsageOutBuf);
EXT double FML_Studio_System_getMemoryUsage(double studioSystemIndex, char* memoryUsageOutBuf);

