#pragma once

#include "internal_common.hpp"

EXT double FML_Studio_Bus_isValid(double busIndex, char* isValidOutBuf);
EXT double FML_Studio_Bus_getID(double busIndex, char* idOutBuf);
EXT double FML_Studio_Bus_getPath(double busIndex, char* pathOutBuf);
EXT double FML_Studio_Bus_getVolume(double busIndex, char* volumeAndFinalVolumeOutBuf);
EXT double FML_Studio_Bus_setVolume(double busIndex, double volume);
EXT double FML_Studio_Bus_getPaused(double busIndex, char* pausedOutBuf);
EXT double FML_Studio_Bus_setPaused(double busIndex, double paused);
EXT double FML_Studio_Bus_getMute(double busIndex, char* muteOutBuf);
EXT double FML_Studio_Bus_setMute(double busIndex, double mute);
EXT double FML_Studio_Bus_stopAllEvents(double busIndex, double mode);
EXT double FML_Studio_Bus_getPortIndex(double busIndex, char* portIndexOutBuf);
EXT double FML_Studio_Bus_setPortIndex(double busIndex, double portIndex);
EXT double FML_Studio_Bus_lockChannelGroup(double busIndex);
EXT double FML_Studio_Bus_unlockChannelGroup(double busIndex);
EXT double FML_Studio_Bus_getChannelGroup(double busIndex, char* channelGroupIndexOutBuf);
EXT double FML_Studio_Bus_getCPUUsage(double busIndex, char* outBuf);
EXT double FML_Studio_Bus_getMemoryUsage(double busIndex, char* memoryUsageOutBuf);
