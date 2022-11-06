#pragma once

#include "internal_common.hpp"

EXT double FML_Studio_Bank_isValid(double bankIndex, char* isValidOutBuf);
EXT double FML_Studio_Bank_getID(double bankIndex, char* idOutBuf);
EXT double FML_Studio_Bank_getPath(double bankIndex, char* pathOutBuf);
EXT double FML_Studio_Bank_unload(double bankIndex);
EXT double FML_Studio_Bank_loadSampleData(double bankIndex);
EXT double FML_Studio_Bank_unloadSampleData(double bankIndex);
EXT double FML_Studio_Bank_getLoadingState(double bankIndex, char* stateOutBuf);
EXT double FML_Studio_Bank_getSampleLoadingState(double bankIndex, char* stateOutBuf);
EXT double FML_Studio_Bank_getStringCount(double bankIndex, char* countOutBuf);
EXT double FML_Studio_Bank_getStringInfo(double bankIndex, double index, char* guidOutBuf, char* pathOutBuf);
EXT double FML_Studio_Bank_getEventCount(double bankIndex, char* countOutBuf);
EXT double FML_Studio_Bank_getEventList(double bankIndex, char* eventIndicesOutBuf, char* countOutBuf);
EXT double FML_Studio_Bank_getBusCount(double bankIndex, char* countOutBuf);
EXT double FML_Studio_Bank_getBusList(double bankIndex, char* bankIndicesOutBuf, char* countOutBuf);
EXT double FML_Studio_Bank_getVCACount(double bankIndex, char* countOutBuf);
EXT double FML_Studio_Bank_getVCAList(double bankIndex, char* vcaIndicesOutBuf, char* countOutBuf);

//FMOD_RESULT F_API getUserData(void** userdata) const;
//FMOD_RESULT F_API setUserData(void* userdata);
