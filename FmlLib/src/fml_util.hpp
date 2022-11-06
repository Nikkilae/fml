#pragma once

#include "internal_common.hpp"

EXT const char* FML_UTIL_FML_VERSION();

EXT double FML_UTIL_FMOD_VERSION();

EXT const char* FML_UTIL_errorString(double fmlErrorCode);

EXT const char* FML_UTIL_guidToString(const char* guidBuf);

EXT double FML_UTIL_getCallbacks(char* callbacksOutBuf, double bufSize);

EXT double FML_UTIL_sizeOfVoidPtr();
