#pragma once

#include "internal_common.hpp"

EXT double FML_Studio_Vca_isValid(double vcaIndex, char* isValidOutBuf);
EXT double FML_Studio_Vca_getID(double vcaIndex, char* idOutBuf);
EXT double FML_Studio_Vca_getPath(double vcaIndex, char* pathOutBuf);
EXT double FML_Studio_Vca_getVolume(double vcaIndex, char* volumeAndFinalVolumeOutBuf);
EXT double FML_Studio_Vca_setVolume(double vcaIndex, double volume);
