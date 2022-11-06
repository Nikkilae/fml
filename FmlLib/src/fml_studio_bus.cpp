
#include "fml_studio_bus.hpp"

#include "fmod_studio.hpp"

using internal::BufReader;
using internal::BufWriter;
using internal::poke;

using Bus = FMOD::Studio::Bus;

double FML_Studio_Bus_isValid(double busIndex, char* isValidOutBuf)
{
	CHECK_OBJECT_INDEX(busIndex);
	*(buffer_bool*)isValidOutBuf = GET<Bus>(busIndex)->isValid();
	return FMOD_OK;
}

double FML_Studio_Bus_getID(double busIndex, char* idOutBuf)
{
	CHECK_OBJECT_INDEX(busIndex);
	FMOD_GUID guid;
	FMOD_RESULT res = GET<Bus>(busIndex)->getID(&guid);
	if (res == FMOD_OK) {
		BufWriter bw(idOutBuf);
		internal::write_guid_to_buffer(guid, bw);
	}
	return res;
}

double FML_Studio_Bus_getPath(double busIndex, char* pathOutBuf)
{
	CHECK_OBJECT_INDEX(busIndex);
	auto outStrSize = BufReader(pathOutBuf).read<BSHT>() - sizeof(BSHT);
	char* outStrPos = pathOutBuf + sizeof(BSHT);
	return GET<Bus>(busIndex)->getPath(outStrPos, outStrSize, nullptr);
}

double FML_Studio_Bus_getVolume(double busIndex, char* volumeAndFinalVolumeOutBuf)
{
	CHECK_OBJECT_INDEX(busIndex);
	return GET<Bus>(busIndex)->getVolume((buffer_f32*)volumeAndFinalVolumeOutBuf, (buffer_f32*)(volumeAndFinalVolumeOutBuf + sizeof(buffer_f32)));
}

double FML_Studio_Bus_setVolume(double busIndex, double volume)
{
	CHECK_OBJECT_INDEX(busIndex);
	return GET<Bus>(busIndex)->setVolume(volume);
}

double FML_Studio_Bus_getPaused(double busIndex, char* pausedOutBuf)
{
	CHECK_OBJECT_INDEX(busIndex);
	return GET<Bus>(busIndex)->getPaused((buffer_bool*)pausedOutBuf);
}

double FML_Studio_Bus_setPaused(double busIndex, double paused)
{
	CHECK_OBJECT_INDEX(busIndex);
	return GET<Bus>(busIndex)->setPaused(paused);
}

double FML_Studio_Bus_getMute(double busIndex, char* muteOutBuf)
{
	CHECK_OBJECT_INDEX(busIndex);
	return GET<Bus>(busIndex)->getMute((buffer_bool*)muteOutBuf);
}

double FML_Studio_Bus_setMute(double busIndex, double mute)
{
	CHECK_OBJECT_INDEX(busIndex);
	return GET<Bus>(busIndex)->setMute(mute);
}

double FML_Studio_Bus_stopAllEvents(double busIndex, double mode)
{
	CHECK_OBJECT_INDEX(busIndex);
	return GET<Bus>(busIndex)->stopAllEvents(static_cast<FMOD_STUDIO_STOP_MODE>(mode));
}

double FML_Studio_Bus_getPortIndex(double busIndex, char* portIndexOutBuf)
{
	CHECK_OBJECT_INDEX(busIndex);
	return GET<Bus>(busIndex)->getPortIndex((FMOD_PORT_INDEX*)portIndexOutBuf);
}

double FML_Studio_Bus_setPortIndex(double busIndex, double portIndex)
{
	CHECK_OBJECT_INDEX(busIndex);
	return GET<Bus>(busIndex)->setPortIndex(portIndex);
}

double FML_Studio_Bus_lockChannelGroup(double busIndex)
{
	CHECK_OBJECT_INDEX(busIndex);
	return GET<Bus>(busIndex)->lockChannelGroup();
}

double FML_Studio_Bus_unlockChannelGroup(double busIndex)
{
	CHECK_OBJECT_INDEX(busIndex);
	return GET<Bus>(busIndex)->unlockChannelGroup();
}

double FML_Studio_Bus_getChannelGroup(double busIndex, char* channelGroupIndexOutBuf)
{
	CHECK_OBJECT_INDEX(busIndex);
	FMOD::ChannelGroup *group;
	FMOD_RESULT res = GET<Bus>(busIndex)->getChannelGroup(&group);
	if (res == FMOD_OK) {
		poke(channelGroupIndexOutBuf, ADD(group));
	}
	return res;
}

EXT double FML_Studio_Bus_getCPUUsage(double busIndex, char* outBuf)
{
	CHECK_OBJECT_INDEX(busIndex);
	return GET<Bus>(busIndex)->getCPUUsage((buffer_u32*)outBuf, (buffer_u32*)(outBuf + sizeof(outBuf)));
}

EXT double FML_Studio_Bus_getMemoryUsage(double busIndex, char* memoryUsageOutBuf)
{
	CHECK_OBJECT_INDEX(busIndex);
	FMOD_STUDIO_MEMORY_USAGE memoryUsage;
	auto res = GET<Bus>(busIndex)->getMemoryUsage(&memoryUsage);
	BufWriter bw(memoryUsageOutBuf);
	internal::write_studio_memory_usage_to_buffer(memoryUsage, bw);
	return res;
}
