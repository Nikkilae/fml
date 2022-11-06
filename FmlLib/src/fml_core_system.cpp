
#include "fml_core_system.hpp"

#include "fmod_studio.hpp"

#include <vector>
#include <cstring>

using internal::BufReader;
using internal::BufWriter;
using internal::poke;

using System = FMOD::System;

double FML_Core_System_create(double headerVersion, char* coreSystemIndexOutBuf)
{
	System* system;
	FMOD_RESULT res = FMOD::System_Create(&system, headerVersion);
	if (res == FMOD_OK) {
		poke(coreSystemIndexOutBuf, ADD(system));
	}
	return res;
}

double FML_Core_System_release(double coreSystemIndex)
{
	CHECK_OBJECT_INDEX(coreSystemIndex);
	return GET<System>(coreSystemIndex)->release();
}

double FML_Core_System_setOutput(double coreSystemIndex, double output)
{
	CHECK_OBJECT_INDEX(coreSystemIndex);
	return GET<System>(coreSystemIndex)->setOutput(static_cast<FMOD_OUTPUTTYPE>(output));
}

double FML_Core_System_getOutput(double coreSystemIndex, char* outputOutBuf)
{
	CHECK_OBJECT_INDEX(coreSystemIndex);
	return GET<System>(coreSystemIndex)->getOutput((FMOD_OUTPUTTYPE*)outputOutBuf);
}

double FML_Core_System_getNumDrivers(double coreSystemIndex, char* numDriversOutBuf)
{
	CHECK_OBJECT_INDEX(coreSystemIndex);
	return GET<System>(coreSystemIndex)->getNumDrivers((buffer_s32*)numDriversOutBuf);
}

double FML_Core_System_getDriverInfo(double coreSystemIndex, double id, char* driverOutBuf)
{
	CHECK_OBJECT_INDEX(coreSystemIndex);
	auto bufferSize = BufReader(driverOutBuf).read<BSHT>();
	constexpr int sizeOfDataExceptName = 28;
	int sizeReservedForName = bufferSize - sizeOfDataExceptName;
	if (sizeReservedForName <= 0) {
		return static_cast<double>(FML_ERROR::BUFFER_TOO_SMALL);
	}
	std::vector<char> name;
	name.resize(sizeReservedForName);
	FMOD_GUID guid;
	int systemRate;
	FMOD_SPEAKERMODE speakerMode;
	int speakerModeChannels;
	FMOD_RESULT res = GET<System>(coreSystemIndex)->getDriverInfo(id, name.data(), name.size(), &guid, &systemRate, &speakerMode, &speakerModeChannels);
	if (res == FMOD_OK) {
		// Weirdly, getDriverInfo doesn't return FMOD_ERR_TRUNCATED when the reserved string length is too small.
		// So to make sure that we got the whole name in its entirety, let's check that the length of the returned string
		// turned out to be shorter than the size we reserved for it. If it's equal to the reserved size, we still would have no
		// idea whether it just happened to be exactly the correct size or if it was truncated.
		if (strlen(name.data()) >= sizeReservedForName - 1) {
			return static_cast<double>(FML_ERROR::BUFFER_TOO_SMALL);
		}
		BufWriter bw(driverOutBuf);
		internal::write_fml_driver_info_to_buffer(name.data(), guid, systemRate, speakerMode, speakerModeChannels, bw);
	}
	return res;
}

double FML_Core_System_setDriver(double coreSystemIndex, double driver)
{
	CHECK_OBJECT_INDEX(coreSystemIndex);
	return GET<System>(coreSystemIndex)->setDriver(driver);
}

double FML_Core_System_getDriver(double coreSystemIndex, char* driverOutBuf)
{
	CHECK_OBJECT_INDEX(coreSystemIndex);
	return GET<System>(coreSystemIndex)->getDriver((buffer_s32*)driverOutBuf);
}

double FML_Core_System_setSoftwareChannels(double coreSystemIndex, double numSoftwareChannels)
{
	CHECK_OBJECT_INDEX(coreSystemIndex);
	return GET<System>(coreSystemIndex)->setSoftwareChannels(numSoftwareChannels);
}

double FML_Core_System_getSoftwareChannels(double coreSystemIndex, char* numSoftwareChannelsOutBuf)
{
	CHECK_OBJECT_INDEX(coreSystemIndex);
	return GET<System>(coreSystemIndex)->getSoftwareChannels((buffer_s32*)numSoftwareChannelsOutBuf);
}

double FML_Core_System_setSoftwareFormat(double coreSystemIndex, double sampleRate, double speakerMode, double numRawSpeakers)
{
	CHECK_OBJECT_INDEX(coreSystemIndex);
	return GET<System>(coreSystemIndex)->setSoftwareFormat(sampleRate, static_cast<FMOD_SPEAKERMODE>(speakerMode), numRawSpeakers);
}

double FML_Core_System_getSoftwareFormat(double coreSystemIndex, char* outBuf)
{
	CHECK_OBJECT_INDEX(coreSystemIndex);
	auto sampleRateBufPos     = (buffer_s32*)outBuf;
	auto speakerModeBufPos    = (FMOD_SPEAKERMODE*)(outBuf + 4);
	auto numRawSpeakersBufPos = (buffer_s32*)(outBuf + 8);
	return GET<System>(coreSystemIndex)->getSoftwareFormat(sampleRateBufPos, speakerModeBufPos, numRawSpeakersBufPos);
}

EXT double FML_Core_System_setDSPBufferSize(double coreSystemIndex, double bufferLength, double numBuffers)
{
	CHECK_OBJECT_INDEX(coreSystemIndex);
	return GET<System>(coreSystemIndex)->setDSPBufferSize(bufferLength, numBuffers);
}

EXT double FML_Core_System_getDSPBufferSize(double coreSystemIndex, char* outBuf)
{
	CHECK_OBJECT_INDEX(coreSystemIndex);
	auto bufferLength = (buffer_u32*)outBuf;
	auto numBuffers = (buffer_s32*)(outBuf + sizeof(buffer_u32));
	return GET<System>(coreSystemIndex)->getDSPBufferSize(bufferLength, numBuffers);
}

double FML_Core_System_setCallback(double coreSystemIndex, double callbackMask)
{
	CHECK_OBJECT_INDEX(coreSystemIndex);
	FMOD_RESULT res = GET<System>(coreSystemIndex)->setCallback(internal::coreSystemCallback, callbackMask);
	return res;
}

double FML_Core_System_init(double coreSystemIndex, double maxChannels, double flags)
{
	// TODO: Extra driver data.
	CHECK_OBJECT_INDEX(coreSystemIndex);
	return GET<System>(coreSystemIndex)->init(maxChannels, flags, nullptr);
}

double FML_Core_System_close(double coreSystemIndex)
{
	CHECK_OBJECT_INDEX(coreSystemIndex);
	return GET<System>(coreSystemIndex)->close();
}

double FML_Core_System_update(double coreSystemIndex)
{
	CHECK_OBJECT_INDEX(coreSystemIndex);
	return GET<System>(coreSystemIndex)->update();
}

double FML_Core_System_set3DSettings(double coreSystemIndex, double dopplerScale, double distanceFactor, double rolloffScale)
{
	CHECK_OBJECT_INDEX(coreSystemIndex);
	return GET<System>(coreSystemIndex)->set3DSettings(dopplerScale, distanceFactor, rolloffScale);
}

double FML_Core_System_get3DSettings(double coreSystemIndex, char* settingsOutBuf)
{
	CHECK_OBJECT_INDEX(coreSystemIndex);
	auto dopplerScale = (buffer_f32*)settingsOutBuf;
	auto distanceFactor = (buffer_f32*)(settingsOutBuf + 4);
	auto rolloffScale = (buffer_f32*)(settingsOutBuf + 8);
	return GET<System>(coreSystemIndex)->get3DSettings(dopplerScale, distanceFactor, rolloffScale);
}

double FML_Core_System_getVersion(double coreSystemIndex, char* versionOutBuf)
{
	CHECK_OBJECT_INDEX(coreSystemIndex);
	return GET<System>(coreSystemIndex)->getVersion((buffer_u32*)versionOutBuf);
}
