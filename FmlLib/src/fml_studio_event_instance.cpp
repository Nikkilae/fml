
#include "fml_studio_event_instance.hpp"

#include "fmod_studio.hpp"

using internal::BufReader;
using internal::BufWriter;
using internal::poke;

using EventInstance = FMOD::Studio::EventInstance;

double FML_Studio_EventInstance_isValid(double eventInstanceIndex, char* isValidOutBuf)
{
	CHECK_OBJECT_INDEX(eventInstanceIndex);
	*(buffer_bool*)isValidOutBuf = GET<EventInstance>(eventInstanceIndex)->isValid();
	return FMOD_OK;
}

double FML_Studio_EventInstance_getDescription(double eventInstanceIndex, char* descriptionIndexOutBuf)
{
	CHECK_OBJECT_INDEX(eventInstanceIndex);
	FMOD::Studio::EventDescription* description;
	auto res = GET<EventInstance>(eventInstanceIndex)->getDescription(&description);
	if (res == FMOD_OK) {
		poke(descriptionIndexOutBuf, ADD(description));
	}
	return res;
}

double FML_Studio_EventInstance_getVolume(double eventInstanceIndex, char* volumeAndFinalVolumeOutBuf)
{
	CHECK_OBJECT_INDEX(eventInstanceIndex);
	return GET<EventInstance>(eventInstanceIndex)->getVolume((buffer_f32*)volumeAndFinalVolumeOutBuf, (buffer_f32*)(volumeAndFinalVolumeOutBuf + sizeof(buffer_f32)));
}

double FML_Studio_EventInstance_setVolume(double eventInstanceIndex, double volume)
{
	CHECK_OBJECT_INDEX(eventInstanceIndex);
	return GET<EventInstance>(eventInstanceIndex)->setVolume(volume);
}

double FML_Studio_EventInstance_getPitch(double eventInstanceIndex, char* pitchAndFinalPitchOutBuf)
{
	CHECK_OBJECT_INDEX(eventInstanceIndex);
	return GET<EventInstance>(eventInstanceIndex)->getPitch((buffer_f32*)pitchAndFinalPitchOutBuf, (buffer_f32*)(pitchAndFinalPitchOutBuf + sizeof(buffer_f32)));
}

double FML_Studio_EventInstance_setPitch(double eventInstanceIndex, double pitch)
{
	CHECK_OBJECT_INDEX(eventInstanceIndex);
	return GET<EventInstance>(eventInstanceIndex)->setPitch(pitch);
}

double FML_Studio_EventInstance_get3DAttributes(double eventInstanceIndex, char* attributesOutBuf)
{
	CHECK_OBJECT_INDEX(eventInstanceIndex);
	FMOD_3D_ATTRIBUTES attributes;
	FMOD_RESULT res = GET<EventInstance>(eventInstanceIndex)->get3DAttributes(&attributes);
	if (res == FMOD_OK) {
		BufWriter bw(attributesOutBuf);
		internal::write_3d_attributes_to_buffer(attributes, bw);
	}
	return res;
}

double FML_Studio_EventInstance_set3DAttributes(double eventInstanceIndex, const char* attributesBuf)
{
	CHECK_OBJECT_INDEX(eventInstanceIndex);
	BufReader br(attributesBuf);
	FMOD_3D_ATTRIBUTES attributes = internal::read_3d_attributes_from_buffer(br);
	return GET<EventInstance>(eventInstanceIndex)->set3DAttributes(&attributes);
}

double FML_Studio_EventInstance_getListenerMask(double eventInstanceIndex, char* maskOutBuf)
{
	CHECK_OBJECT_INDEX(eventInstanceIndex);
	return GET<EventInstance>(eventInstanceIndex)->getListenerMask((buffer_u32*)maskOutBuf);
}

double FML_Studio_EventInstance_setListenerMask(double eventInstanceIndex, double mask)
{
	CHECK_OBJECT_INDEX(eventInstanceIndex);
	return GET<EventInstance>(eventInstanceIndex)->setListenerMask(mask);
}

double FML_Studio_EventInstance_getProperty(double eventInstanceIndex, double index, char* valueOutBuf)
{
	CHECK_OBJECT_INDEX(eventInstanceIndex);
	return GET<EventInstance>(eventInstanceIndex)->getProperty(static_cast<FMOD_STUDIO_EVENT_PROPERTY>(index), (buffer_f32*)valueOutBuf);
}

double FML_Studio_EventInstance_setProperty(double eventInstanceIndex, double index, double value)
{
	CHECK_OBJECT_INDEX(eventInstanceIndex);
	return GET<EventInstance>(eventInstanceIndex)->setProperty(static_cast<FMOD_STUDIO_EVENT_PROPERTY>(index), value);
}

double FML_Studio_EventInstance_getReverbLevel(double eventInstanceIndex, double index, char* levelOutBuf)
{
	CHECK_OBJECT_INDEX(eventInstanceIndex);
	return GET<EventInstance>(eventInstanceIndex)->getReverbLevel(index, (buffer_f32*)levelOutBuf);
}

double FML_Studio_EventInstance_setReverbLevel(double eventInstanceIndex, double index, double level)
{
	CHECK_OBJECT_INDEX(eventInstanceIndex);
	return GET<EventInstance>(eventInstanceIndex)->setReverbLevel(index, level);
}

double FML_Studio_EventInstance_getPaused(double eventInstanceIndex, char* pausedOutBuf)
{
	CHECK_OBJECT_INDEX(eventInstanceIndex);
	return GET<EventInstance>(eventInstanceIndex)->getPaused((buffer_bool*)pausedOutBuf);
}

double FML_Studio_EventInstance_setPaused(double eventInstanceIndex, double paused)
{
	CHECK_OBJECT_INDEX(eventInstanceIndex);
	return GET<EventInstance>(eventInstanceIndex)->setPaused(paused);
}

double FML_Studio_EventInstance_start(double eventInstanceIndex)
{
	CHECK_OBJECT_INDEX(eventInstanceIndex);
	return GET<EventInstance>(eventInstanceIndex)->start();
}

double FML_Studio_EventInstance_stop(double eventInstanceIndex, double mode)
{
	CHECK_OBJECT_INDEX(eventInstanceIndex);
	return GET<EventInstance>(eventInstanceIndex)->stop(static_cast<FMOD_STUDIO_STOP_MODE>(mode));
}

double FML_Studio_EventInstance_getTimelinePosition(double eventInstanceIndex, char* positionOutBuf)
{
	CHECK_OBJECT_INDEX(eventInstanceIndex);
	return GET<EventInstance>(eventInstanceIndex)->getTimelinePosition((buffer_s32*)positionOutBuf);
}

double FML_Studio_EventInstance_setTimelinePosition(double eventInstanceIndex, double position)
{
	CHECK_OBJECT_INDEX(eventInstanceIndex);
	return GET<EventInstance>(eventInstanceIndex)->setTimelinePosition(position);
}

double FML_Studio_EventInstance_getPlaybackState(double eventInstanceIndex, char* stateOutBuf)
{
	CHECK_OBJECT_INDEX(eventInstanceIndex);
	return GET<EventInstance>(eventInstanceIndex)->getPlaybackState((FMOD_STUDIO_PLAYBACK_STATE*)stateOutBuf);
}

double FML_Studio_EventInstance_getChannelGroup(double eventInstanceIndex, char* groupIndexOutBuf)
{
	CHECK_OBJECT_INDEX(eventInstanceIndex);
	FMOD::ChannelGroup* group;
	auto res = GET<EventInstance>(eventInstanceIndex)->getChannelGroup(&group);
	if (res == FMOD_OK) {
		poke(groupIndexOutBuf, ADD(group));
	}
	return res;
}

double FML_Studio_EventInstance_getMinMaxDistance(double eventInstanceIndex, char* minAndMaxOutBuf)
{
	CHECK_OBJECT_INDEX(eventInstanceIndex);
	return GET<EventInstance>(eventInstanceIndex)->getMinMaxDistance((buffer_f32*)minAndMaxOutBuf, (buffer_f32*)(minAndMaxOutBuf + sizeof(buffer_f32)));
}

double FML_Studio_EventInstance_release(double eventInstanceIndex)
{
	CHECK_OBJECT_INDEX(eventInstanceIndex);
	return GET<EventInstance>(eventInstanceIndex)->release();
}

double FML_Studio_EventInstance_isVirtual(double eventInstanceIndex, char* isVirtualOutBuf)
{
	CHECK_OBJECT_INDEX(eventInstanceIndex);
	return GET<EventInstance>(eventInstanceIndex)->isVirtual((bool*)isVirtualOutBuf);
}

double FML_Studio_EventInstance_getParameterByID(double eventInstanceIndex, const char* parameterIdBuf, char* valueAndFinalValueOutBuf)
{
	CHECK_OBJECT_INDEX(eventInstanceIndex);
	BufReader br(parameterIdBuf);
	FMOD_STUDIO_PARAMETER_ID id = internal::read_studio_parameter_id_from_buffer(br);
	float value, finalValue;
	FMOD_RESULT res = GET<EventInstance>(eventInstanceIndex)->getParameterByID(id, &value, &finalValue);
	BufWriter bw(valueAndFinalValueOutBuf);
	bw.write<buffer_f32>(value);
	bw.write<buffer_f32>(finalValue);
	return res;
}

double FML_Studio_EventInstance_setParameterByID(double eventInstanceIndex, const char* parameterIdBuf, double value, double ignoreSeekSpeed)
{
	CHECK_OBJECT_INDEX(eventInstanceIndex);
	BufReader br(parameterIdBuf);
	FMOD_STUDIO_PARAMETER_ID id = internal::read_studio_parameter_id_from_buffer(br);
	return GET<EventInstance>(eventInstanceIndex)->setParameterByID(id, value, ignoreSeekSpeed);
}

double FML_Studio_EventInstance_setParameterByIDWithLabel(double eventInstanceIndex, const char* parameterIdBuf, const char* label, double ignoreSeekSpeed)
{
	CHECK_OBJECT_INDEX(eventInstanceIndex);
	BufReader br(parameterIdBuf);
	FMOD_STUDIO_PARAMETER_ID id = internal::read_studio_parameter_id_from_buffer(br);
	return GET<EventInstance>(eventInstanceIndex)->setParameterByIDWithLabel(id, label, ignoreSeekSpeed);
}

double FML_Studio_EventInstance_setParametersByIDs(double eventInstanceIndex, const char* parameterIdsAndValuesBuf, double count, double ignoreSeekSpeed)
{
	CHECK_OBJECT_INDEX(eventInstanceIndex);

	std::vector<FMOD_STUDIO_PARAMETER_ID> ids;
	ids.reserve(count);
	std::vector<float> values;
	values.reserve(count);

	BufReader br(parameterIdsAndValuesBuf);
	for (size_t i = 0; i < count; ++i) {
		ids.push_back(internal::read_studio_parameter_id_from_buffer(br));
		values.push_back(br.read<float>());
	}
	return GET<EventInstance>(eventInstanceIndex)->setParametersByIDs(ids.data(), values.data(), count, ignoreSeekSpeed);
}

double FML_Studio_EventInstance_getParameterByName(double eventInstanceIndex, const char* name, char* valueAndFinalValueOutBuf)
{
	CHECK_OBJECT_INDEX(eventInstanceIndex);
	float value, finalValue;
	FMOD_RESULT res = GET<EventInstance>(eventInstanceIndex)->getParameterByName(name, &value, &finalValue);
	BufWriter bw(valueAndFinalValueOutBuf);
	bw.write(value);
	bw.write(finalValue);
	return res;
}

double FML_Studio_EventInstance_setParameterByName(double eventInstanceIndex, const char* name, double value, double ignoreseekspeed)
{
	CHECK_OBJECT_INDEX(eventInstanceIndex);
	return GET<EventInstance>(eventInstanceIndex)->setParameterByName(name, value, ignoreseekspeed);
}

double FML_Studio_EventInstance_setParameterByNameWithLabel(double eventInstanceIndex, const char* name, const char* label, double ignoreseekspeed)
{
	CHECK_OBJECT_INDEX(eventInstanceIndex);
	return GET<EventInstance>(eventInstanceIndex)->setParameterByNameWithLabel(name, label, ignoreseekspeed);
}

double FML_Studio_EventInstance_keyOff(double eventInstanceIndex)
{
	CHECK_OBJECT_INDEX(eventInstanceIndex);
	return GET<EventInstance>(eventInstanceIndex)->keyOff();
}

double FML_Studio_EventInstance_getCPUUsage(double eventInstanceIndex, char* outBuf)
{
	CHECK_OBJECT_INDEX(eventInstanceIndex);
	return GET<EventInstance>(eventInstanceIndex)->getCPUUsage((buffer_u32*)outBuf, (buffer_u32*)(outBuf + sizeof(outBuf)));
}

double FML_Studio_EventInstance_getMemoryUsage(double eventInstanceIndex, char* memoryUsageOutBuf)
{
	CHECK_OBJECT_INDEX(eventInstanceIndex);
	FMOD_STUDIO_MEMORY_USAGE memoryUsage;
	auto res = GET<EventInstance>(eventInstanceIndex)->getMemoryUsage(&memoryUsage);
	BufWriter bw(memoryUsageOutBuf);
	internal::write_studio_memory_usage_to_buffer(memoryUsage, bw);
	return res;
}

double FML_Studio_EventInstance_setCallback(double eventInstanceIndex, double callbackMask)
{
	CHECK_OBJECT_INDEX(eventInstanceIndex);
	FMOD_RESULT res = GET<EventInstance>(eventInstanceIndex)->setCallback(internal::eventCallback, callbackMask);
	return res;
}