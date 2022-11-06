#pragma once

#include "internal_common.hpp"

EXT double FML_Studio_EventDescription_isValid(double eventDescriptionIndex, char* isValidOutBuf);
EXT double FML_Studio_EventDescription_getID(double eventDescriptionIndex, char* idOutBuf);
EXT double FML_Studio_EventDescription_getPath(double eventDescriptionIndex, char* pathOutBuf);
EXT double FML_Studio_EventDescription_getParameterDescriptionCount(double eventDescriptionIndex, char* countOutBuf);
EXT double FML_Studio_EventDescription_getParameterDescriptionByIndex(double eventDescriptionIndex, double index, char* paramOutBuf);
EXT double FML_Studio_EventDescription_getParameterDescriptionByName(double eventDescriptionIndex, const char* name, char* paramOutBuf);
EXT double FML_Studio_EventDescription_getParameterDescriptionByID(double eventDescriptionIndex, const char* paramIdBuf, char* paramOutBuf);
EXT double FML_Studio_EventDescription_getParameterLabelByIndex(double eventDescriptionIndex, double index, double labelIndex, char* labelOutBuf);
EXT double FML_Studio_EventDescription_getParameterLabelByName(double eventDescriptionIndex, const char* name, double labelIndex, char* labelOutBuf);
EXT double FML_Studio_EventDescription_getParameterLabelByID(double eventDescriptionIndex, const char* paramIdBuf, double labelIndex, char* labelOutBuf);
EXT double FML_Studio_EventDescription_getUserPropertyCount(double eventDescriptionIndex, char* countOutBuf);
EXT double FML_Studio_EventDescription_getUserPropertyByIndex(double eventDescriptionIndex, double index, char* propertyOutBuf);
EXT double FML_Studio_EventDescription_getUserProperty(double eventDescriptionIndex, const char* name, char* propertyOutBuf);
EXT double FML_Studio_EventDescription_getLength(double eventDescriptionIndex, char* lengthOutBuf);
EXT double FML_Studio_EventDescription_getMinMaxDistance(double eventDescriptionIndex, char* minAndMaxOutBuf);
EXT double FML_Studio_EventDescription_getSoundSize(double eventDescriptionIndex, char* sizeOutBuf);
EXT double FML_Studio_EventDescription_isSnapshot(double eventDescriptionIndex, char* isSnapshotOutBuf);
EXT double FML_Studio_EventDescription_isOneshot(double eventDescriptionIndex, char* isOneshotOutBuf);
EXT double FML_Studio_EventDescription_isStream(double eventDescriptionIndex, char* isStreamOutBuf);
EXT double FML_Studio_EventDescription_is3D(double eventDescriptionIndex, char* is3dOutBuf);
EXT double FML_Studio_EventDescription_isDopplerEnabled(double eventDescriptionIndex, char* isDopplerEnabledOutBuf);
EXT double FML_Studio_EventDescription_hasSustainPoint(double eventDescriptionIndex, char* hasSustainPointOutBuf);
EXT double FML_Studio_EventDescription_createInstance(double eventDescriptionIndex, char* eventInstanceIndexOutBuf);
EXT double FML_Studio_EventDescription_getInstanceCount(double eventDescriptionIndex, char* countOutBuf);
EXT double FML_Studio_EventDescription_getInstanceList(double eventDescriptionIndex, char* instanceIndicesOutBuf, char* countOutBuf);
EXT double FML_Studio_EventDescription_loadSampleData(double eventDescriptionIndex);
EXT double FML_Studio_EventDescription_unloadSampleData(double eventDescriptionIndex);
EXT double FML_Studio_EventDescription_getSampleLoadingState(double eventDescriptionIndex, char* stateOutBuf);
EXT double FML_Studio_EventDescription_releaseAllInstances(double eventDescriptionIndex);
EXT double FML_Studio_EventDescription_setCallback(double eventDescriptionIndex, double callbackMask);

// FMOD_RESULT F_API getUserData(void** userdata) const;
// FMOD_RESULT F_API setUserData(void* userdata);
