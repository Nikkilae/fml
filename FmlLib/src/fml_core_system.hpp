#pragma once

#include "internal_common.hpp"

EXT double FML_Core_System_create(double headerVersion, char* coreSystemIndexOutBuf);
EXT double FML_Core_System_release(double coreSystemIndex);
EXT double FML_Core_System_setOutput(double coreSystemIndex, double output);
EXT double FML_Core_System_getOutput(double coreSystemIndex, char* outputOutBuf);
EXT double FML_Core_System_getNumDrivers(double coreSystemIndex, char* numDriversOutBuf);
EXT double FML_Core_System_getDriverInfo(double coreSystemIndex, double id, char* driverOutBuf);
EXT double FML_Core_System_setDriver(double coreSystemIndex, double driver);
EXT double FML_Core_System_getDriver(double coreSystemIndex, char* driverOutBuf);
EXT double FML_Core_System_setSoftwareChannels(double coreSystemIndex, double numSoftwareChannels);
EXT double FML_Core_System_getSoftwareChannels(double coreSystemIndex, char* numSoftwareChannelsOutBuf);
EXT double FML_Core_System_setSoftwareFormat(double coreSystemIndex, double sampleRate, double speakerMode, double numRawSpeakers);
EXT double FML_Core_System_getSoftwareFormat(double coreSystemIndex, char* outBuf);
EXT double FML_Core_System_setDSPBufferSize(double coreSystemIndex, double bufferLength, double numBuffers);
EXT double FML_Core_System_getDSPBufferSize(double coreSystemIndex, char* outBuf);

// FMOD_RESULT F_API setFileSystem(FMOD_FILE_OPEN_CALLBACK useropen, FMOD_FILE_CLOSE_CALLBACK userclose, FMOD_FILE_READ_CALLBACK userread, FMOD_FILE_SEEK_CALLBACK userseek, FMOD_FILE_ASYNCREAD_CALLBACK userasyncread, FMOD_FILE_ASYNCCANCEL_CALLBACK userasynccancel, int blockalign);
// FMOD_RESULT F_API attachFileSystem(FMOD_FILE_OPEN_CALLBACK useropen, FMOD_FILE_CLOSE_CALLBACK userclose, FMOD_FILE_READ_CALLBACK userread, FMOD_FILE_SEEK_CALLBACK userseek);
// EXT double FML_Core_System_setAdvancedSettings(double coreSystemIndex, const char* settingsBuf);
// EXT double FML_Core_System_getAdvancedSettings(double coreSystemIndex, char* settingsOutBuf);

EXT double FML_Core_System_setCallback(double coreSystemIndex, double callbackMask);

// FMOD_RESULT F_API setPluginPath(const char* path);
// FMOD_RESULT F_API loadPlugin(const char* filename, unsigned int* handle, unsigned int priority = 0);
// FMOD_RESULT F_API unloadPlugin(unsigned int handle);
// FMOD_RESULT F_API getNumNestedPlugins(unsigned int handle, int* count);
// FMOD_RESULT F_API getNestedPlugin(unsigned int handle, int index, unsigned int* nestedhandle);
// FMOD_RESULT F_API getNumPlugins(FMOD_PLUGINTYPE plugintype, int* numplugins);
// FMOD_RESULT F_API getPluginHandle(FMOD_PLUGINTYPE plugintype, int index, unsigned int* handle);
// FMOD_RESULT F_API getPluginInfo(unsigned int handle, FMOD_PLUGINTYPE* plugintype, char* name, int namelen, unsigned int* version);
// FMOD_RESULT F_API setOutputByPlugin(unsigned int handle);
// FMOD_RESULT F_API getOutputByPlugin(unsigned int* handle);
// FMOD_RESULT F_API createDSPByPlugin(unsigned int handle, DSP** dsp);
// FMOD_RESULT F_API getDSPInfoByPlugin(unsigned int handle, const FMOD_DSP_DESCRIPTION** description);
// FMOD_RESULT F_API registerCodec(FMOD_CODEC_DESCRIPTION* description, unsigned int* handle, unsigned int priority = 0);
// FMOD_RESULT F_API registerDSP(const FMOD_DSP_DESCRIPTION* description, unsigned int* handle);
// FMOD_RESULT F_API registerOutput(const FMOD_OUTPUT_DESCRIPTION* description, unsigned int* handle);

EXT double FML_Core_System_init(double coreSystemIndex, double maxChannels, double flags);
EXT double FML_Core_System_close(double coreSystemIndex);
EXT double FML_Core_System_update(double coreSystemIndex);

// FMOD_RESULT F_API setSpeakerPosition(FMOD_SPEAKER speaker, float x, float y, bool active);
// FMOD_RESULT F_API getSpeakerPosition(FMOD_SPEAKER speaker, float* x, float* y, bool* active);
// FMOD_RESULT F_API setStreamBufferSize(unsigned int filebuffersize, FMOD_TIMEUNIT filebuffersizetype);
// FMOD_RESULT F_API getStreamBufferSize(unsigned int* filebuffersize, FMOD_TIMEUNIT* filebuffersizetype);
// 
EXT double FML_Core_System_set3DSettings(double coreSystemIndex, double dopplerScale, double distanceFactor, double rolloffScale);
EXT double FML_Core_System_get3DSettings(double coreSystemIndex, char* settingsOutBuf);

// FMOD_RESULT F_API set3DNumListeners(int numlisteners);
// FMOD_RESULT F_API get3DNumListeners(int* numlisteners);
// FMOD_RESULT F_API set3DListenerAttributes(int listener, const FMOD_VECTOR* pos, const FMOD_VECTOR* vel, const FMOD_VECTOR* forward, const FMOD_VECTOR* up);
// FMOD_RESULT F_API get3DListenerAttributes(int listener, FMOD_VECTOR* pos, FMOD_VECTOR* vel, FMOD_VECTOR* forward, FMOD_VECTOR* up);
// FMOD_RESULT F_API set3DRolloffCallback(FMOD_3D_ROLLOFF_CALLBACK callback);
// FMOD_RESULT F_API mixerSuspend();
// FMOD_RESULT F_API mixerResume();
// FMOD_RESULT F_API getDefaultMixMatrix(FMOD_SPEAKERMODE sourcespeakermode, FMOD_SPEAKERMODE targetspeakermode, float* matrix, int matrixhop);
// FMOD_RESULT F_API getSpeakerModeChannels(FMOD_SPEAKERMODE mode, int* channels);

EXT double FML_Core_System_getVersion(double coreSystemIndex, char* versionOutBuf);

// FMOD_RESULT F_API getOutputHandle(void** handle);
// FMOD_RESULT F_API getChannelsPlaying(int* channels, int* realchannels = 0);
// FMOD_RESULT F_API getCPUUsage(FMOD_CPU_USAGE* usage);
// FMOD_RESULT F_API getFileUsage(long long* sampleBytesRead, long long* streamBytesRead, long long* otherBytesRead);
// FMOD_RESULT F_API createSound(const char* name_or_data, FMOD_MODE mode, FMOD_CREATESOUNDEXINFO* exinfo, Sound** sound);
// FMOD_RESULT F_API createStream(const char* name_or_data, FMOD_MODE mode, FMOD_CREATESOUNDEXINFO* exinfo, Sound** sound);
// FMOD_RESULT F_API createDSP(const FMOD_DSP_DESCRIPTION* description, DSP** dsp);
// FMOD_RESULT F_API createDSPByType(FMOD_DSP_TYPE type, DSP** dsp);
// FMOD_RESULT F_API createChannelGroup(const char* name, ChannelGroup** channelgroup);
// FMOD_RESULT F_API createSoundGroup(const char* name, SoundGroup** soundgroup);
// FMOD_RESULT F_API createReverb3D(Reverb3D** reverb);
// FMOD_RESULT F_API playSound(Sound* sound, ChannelGroup* channelgroup, bool paused, Channel** channel);
// FMOD_RESULT F_API playDSP(DSP* dsp, ChannelGroup* channelgroup, bool paused, Channel** channel);
// FMOD_RESULT F_API getChannel(int channelid, Channel** channel);
// FMOD_RESULT F_API getDSPInfoByType(FMOD_DSP_TYPE type, const FMOD_DSP_DESCRIPTION** description);
// FMOD_RESULT F_API getMasterChannelGroup(ChannelGroup** channelgroup);
// FMOD_RESULT F_API getMasterSoundGroup(SoundGroup** soundgroup);
// FMOD_RESULT F_API attachChannelGroupToPort(FMOD_PORT_TYPE portType, FMOD_PORT_INDEX portIndex, ChannelGroup* channelgroup, bool passThru = false);
// FMOD_RESULT F_API detachChannelGroupFromPort(ChannelGroup* channelgroup);
// FMOD_RESULT F_API setReverbProperties(int instance, const FMOD_REVERB_PROPERTIES* prop);
// FMOD_RESULT F_API getReverbProperties(int instance, FMOD_REVERB_PROPERTIES* prop);
// FMOD_RESULT F_API lockDSP();
// FMOD_RESULT F_API unlockDSP();
// FMOD_RESULT F_API getRecordNumDrivers(int* numdrivers, int* numconnected);
// FMOD_RESULT F_API getRecordDriverInfo(int id, char* name, int namelen, FMOD_GUID* guid, int* systemrate, FMOD_SPEAKERMODE* speakermode, int* speakermodechannels, FMOD_DRIVER_STATE* state);
// FMOD_RESULT F_API getRecordPosition(int id, unsigned int* position);
// FMOD_RESULT F_API recordStart(int id, Sound* sound, bool loop);
// FMOD_RESULT F_API recordStop(int id);
// FMOD_RESULT F_API isRecording(int id, bool* recording);
// FMOD_RESULT F_API createGeometry(int maxpolygons, int maxvertices, Geometry** geometry);
// FMOD_RESULT F_API setGeometrySettings(float maxworldsize);
// FMOD_RESULT F_API getGeometrySettings(float* maxworldsize);
// FMOD_RESULT F_API loadGeometry(const void* data, int datasize, Geometry** geometry);
// FMOD_RESULT F_API getGeometryOcclusion(const FMOD_VECTOR* listener, const FMOD_VECTOR* source, float* direct, float* reverb);
// FMOD_RESULT F_API setNetworkProxy(const char* proxy);
// FMOD_RESULT F_API getNetworkProxy(char* proxy, int proxylen);
// FMOD_RESULT F_API setNetworkTimeout(int timeout);
// FMOD_RESULT F_API getNetworkTimeout(int* timeout);
// FMOD_RESULT F_API setUserData(void* userdata);
// FMOD_RESULT F_API getUserData(void** userdata);
