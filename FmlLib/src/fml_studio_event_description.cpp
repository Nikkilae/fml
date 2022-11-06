
#include "fml_studio_event_description.hpp"

#include "fmod_studio.hpp"

using internal::BufReader;
using internal::BufWriter;
using internal::poke;

using EventDescription = FMOD::Studio::EventDescription;

double FML_Studio_EventDescription_isValid(double eventDescriptionIndex, char* isValidOutBuf)
{
	CHECK_OBJECT_INDEX(eventDescriptionIndex);
	*(buffer_bool*)isValidOutBuf = GET<EventDescription>(eventDescriptionIndex)->isValid();
	return FMOD_OK;
}

double FML_Studio_EventDescription_getID(double eventDescriptionIndex, char* idOutBuf)
{
	CHECK_OBJECT_INDEX(eventDescriptionIndex);
	FMOD_GUID guid;
	auto res = GET<EventDescription>(eventDescriptionIndex)->getID(&guid);
	if (res == FMOD_OK) {
		BufWriter bw(idOutBuf);
		internal::write_guid_to_buffer(guid, bw);
	}
	return res;
}

double FML_Studio_EventDescription_getPath(double eventDescriptionIndex, char* pathOutBuf)
{
	CHECK_OBJECT_INDEX(eventDescriptionIndex);
	auto outStrSize = BufReader(pathOutBuf).read<BSHT>() - sizeof(BSHT);
	char* outStrPos = pathOutBuf + sizeof(BSHT);
	return GET<EventDescription>(eventDescriptionIndex)->getPath(outStrPos, outStrSize, nullptr);
}

double FML_Studio_EventDescription_getParameterDescriptionCount(double eventDescriptionIndex, char* countOutBuf)
{
	CHECK_OBJECT_INDEX(eventDescriptionIndex);
	return GET<EventDescription>(eventDescriptionIndex)->getParameterDescriptionCount((int*)countOutBuf);
}

double FML_Studio_EventDescription_getParameterDescriptionByIndex(double eventDescriptionIndex, double index, char* paramOutBuf)
{
	CHECK_OBJECT_INDEX(eventDescriptionIndex);
	auto outBufSize = BufWriter(paramOutBuf).read<BSHT>() - sizeof(BSHT);
	char* outBufPos = paramOutBuf + sizeof(BSHT);
	FMOD_STUDIO_PARAMETER_DESCRIPTION parameter;
	FMOD_RESULT res = GET<EventDescription>(eventDescriptionIndex)->getParameterDescriptionByIndex(index, &parameter);
	if (res == FMOD_OK) {
		if (outBufSize < internal::get_parameter_description_required_buffer_size(parameter)) {
			return static_cast<double>(FML_ERROR::BUFFER_TOO_SMALL);
		}
		BufWriter bw(outBufPos);
		internal::write_studio_parameter_description_to_buffer(parameter, bw);
	}
	return res;
}

double FML_Studio_EventDescription_getParameterDescriptionByName(double eventDescriptionIndex, const char* name, char* paramOutBuf)
{
	CHECK_OBJECT_INDEX(eventDescriptionIndex);
	auto outBufSize = BufWriter(paramOutBuf).read<BSHT>() - sizeof(BSHT);
	char* outBufPos = paramOutBuf + sizeof(BSHT);
	FMOD_STUDIO_PARAMETER_DESCRIPTION parameter;
	FMOD_RESULT res = GET<EventDescription>(eventDescriptionIndex)->getParameterDescriptionByName(name, &parameter);
	if (res == FMOD_OK) {
		if (outBufSize < internal::get_parameter_description_required_buffer_size(parameter)) {
			return static_cast<double>(FML_ERROR::BUFFER_TOO_SMALL);
		}
		BufWriter bw(outBufPos);
		internal::write_studio_parameter_description_to_buffer(parameter, bw);
	}
	return res;
}

double FML_Studio_EventDescription_getParameterDescriptionByID(double eventDescriptionIndex, const char* paramIdBuf, char* paramOutBuf)
{
	CHECK_OBJECT_INDEX(eventDescriptionIndex);
	auto outBufSize = BufWriter(paramOutBuf).read<BSHT>() - sizeof(BSHT);
	char* outBufPos = paramOutBuf + sizeof(BSHT);
	BufReader br(paramIdBuf);
	FMOD_STUDIO_PARAMETER_ID id = internal::read_studio_parameter_id_from_buffer(br);
	FMOD_STUDIO_PARAMETER_DESCRIPTION parameter;
	FMOD_RESULT res = GET<EventDescription>(eventDescriptionIndex)->getParameterDescriptionByID(id, &parameter);
	if (res == FMOD_OK) {
		if (outBufSize < internal::get_parameter_description_required_buffer_size(parameter)) {
			return static_cast<double>(FML_ERROR::BUFFER_TOO_SMALL);
		}
		BufWriter bw(outBufPos);
		internal::write_studio_parameter_description_to_buffer(parameter, bw);
	}
	return res;
}

double FML_Studio_EventDescription_getParameterLabelByIndex(double eventDescriptionIndex, double index, double labelIndex, char* labelOutBuf)
{
	CHECK_OBJECT_INDEX(eventDescriptionIndex);
	auto outBufSize = BufReader(labelOutBuf).read<BSHT>();
	return GET<EventDescription>(eventDescriptionIndex)->getParameterLabelByIndex(index, labelIndex, labelOutBuf, outBufSize, nullptr);
}

double FML_Studio_EventDescription_getParameterLabelByName(double eventDescriptionIndex, const char* name, double labelIndex, char* labelOutBuf)
{
	CHECK_OBJECT_INDEX(eventDescriptionIndex);
	auto outBufSize = BufReader(labelOutBuf).read<BSHT>();
	return GET<EventDescription>(eventDescriptionIndex)->getParameterLabelByName(name, labelIndex, labelOutBuf, outBufSize, nullptr);
}

double FML_Studio_EventDescription_getParameterLabelByID(double eventDescriptionIndex, const char* paramIdBuf, double labelIndex, char* labelOutBuf)
{
	CHECK_OBJECT_INDEX(eventDescriptionIndex);
	auto outBufSize = BufReader(labelOutBuf).read<BSHT>();
	BufReader paramIdBr(paramIdBuf);
	FMOD_STUDIO_PARAMETER_ID paramId = internal::read_studio_parameter_id_from_buffer(paramIdBr);
	return GET<EventDescription>(eventDescriptionIndex)->getParameterLabelByID(paramId, labelIndex, labelOutBuf, outBufSize, nullptr);
}

double FML_Studio_EventDescription_getParameterLabelByIndex(double eventDescriptionIndex, double index, double labelindex, char* labelOutBuf, double labelOutBufSize)
{
	CHECK_OBJECT_INDEX(eventDescriptionIndex);
	return GET<EventDescription>(eventDescriptionIndex)->getParameterLabelByIndex(index, labelindex, labelOutBuf, labelOutBufSize, nullptr);
}

double FML_Studio_EventDescription_getParameterLabelByName(double eventDescriptionIndex, const char* name, double labelindex, char* labelOutBuf, double labelOutBufSize)
{
	CHECK_OBJECT_INDEX(eventDescriptionIndex);
	return GET<EventDescription>(eventDescriptionIndex)->getParameterLabelByName(name, labelindex, labelOutBuf, labelOutBufSize, nullptr);
}

double FML_Studio_EventDescription_getUserPropertyCount(double eventDescriptionIndex, char* countOutBuf)
{
	CHECK_OBJECT_INDEX(eventDescriptionIndex);
	return GET<EventDescription>(eventDescriptionIndex)->getUserPropertyCount((int*)countOutBuf);
}

double FML_Studio_EventDescription_getUserPropertyByIndex(double eventDescriptionIndex, double index, char* propertyOutBuf)
{
	CHECK_OBJECT_INDEX(eventDescriptionIndex);
	auto outBufSize = BufWriter(propertyOutBuf).read<BSHT>();
	char* outBufPos = propertyOutBuf + sizeof(BSHT);
	FMOD_STUDIO_USER_PROPERTY property;
	FMOD_RESULT res = GET<EventDescription>(eventDescriptionIndex)->getUserPropertyByIndex(index, &property);
	if (res == FMOD_OK) {
		size_t availableSize = outBufSize - sizeof(BSHT);
		size_t requiredSize = internal::get_studio_user_property_required_buffer_size(property);
		if (availableSize < requiredSize) {
			return static_cast<double>(FML_ERROR::BUFFER_TOO_SMALL);
		}
		BufWriter bw(outBufPos);
		internal::write_studio_user_property_to_buffer(property, bw);
	}
	return res;
}

double FML_Studio_EventDescription_getUserProperty(double eventDescriptionIndex, const char* name, char* propertyOutBuf)
{
	CHECK_OBJECT_INDEX(eventDescriptionIndex);
	auto outBufSize = BufWriter(propertyOutBuf).read<BSHT>();
	char* outBufPos = propertyOutBuf + sizeof(BSHT);
	FMOD_STUDIO_USER_PROPERTY property;
	FMOD_RESULT res = GET<EventDescription>(eventDescriptionIndex)->getUserProperty(name, &property);
	if (res == FMOD_OK) {
		size_t availableSize = outBufSize - sizeof(BSHT);
		size_t requiredSize = internal::get_studio_user_property_required_buffer_size(property);
		if (availableSize < requiredSize) {
			return static_cast<double>(FML_ERROR::BUFFER_TOO_SMALL);
		}
		BufWriter bw(outBufPos);
		internal::write_studio_user_property_to_buffer(property, bw);
	}
	return res;
}

double FML_Studio_EventDescription_getLength(double eventDescriptionIndex, char* lengthOutBuf)
{
	CHECK_OBJECT_INDEX(eventDescriptionIndex);
	return GET<EventDescription>(eventDescriptionIndex)->getLength((buffer_s32*)lengthOutBuf);
}

double FML_Studio_EventDescription_getMinMaxDistance(double eventDescriptionIndex, char* minAndMaxOutBuf)
{
	CHECK_OBJECT_INDEX(eventDescriptionIndex);
	return GET<EventDescription>(eventDescriptionIndex)->getMinMaxDistance((buffer_f32*)minAndMaxOutBuf, (buffer_f32*)(minAndMaxOutBuf + sizeof(buffer_f32)));
}

double FML_Studio_EventDescription_getSoundSize(double eventDescriptionIndex, char* sizeOutBuf)
{
	CHECK_OBJECT_INDEX(eventDescriptionIndex);
	float size;
	auto res = GET<EventDescription>(eventDescriptionIndex)->getSoundSize(&size);
	if (res == FMOD_OK) {
		poke(sizeOutBuf, static_cast<buffer_f32>(size));
	}
	return res;
}

double FML_Studio_EventDescription_isSnapshot(double eventDescriptionIndex, char* isSnapshotOutBuf)
{
	CHECK_OBJECT_INDEX(eventDescriptionIndex);
	return GET<EventDescription>(eventDescriptionIndex)->isSnapshot((bool*)isSnapshotOutBuf);
}

double FML_Studio_EventDescription_isOneshot(double eventDescriptionIndex, char* isOneshotOutBuf)
{
	CHECK_OBJECT_INDEX(eventDescriptionIndex);
	return GET<EventDescription>(eventDescriptionIndex)->isOneshot((bool*)isOneshotOutBuf);
}

double FML_Studio_EventDescription_isStream(double eventDescriptionIndex, char* isStreamOutBuf)
{
	CHECK_OBJECT_INDEX(eventDescriptionIndex);
	return GET<EventDescription>(eventDescriptionIndex)->isStream((bool*)isStreamOutBuf);
}

double FML_Studio_EventDescription_is3D(double eventDescriptionIndex, char* is3dOutBuf)
{
	CHECK_OBJECT_INDEX(eventDescriptionIndex);
	return GET<EventDescription>(eventDescriptionIndex)->is3D((bool*)is3dOutBuf);
}

double FML_Studio_EventDescription_isDopplerEnabled(double eventDescriptionIndex, char* isDopplerEnabledOutBuf)
{
	CHECK_OBJECT_INDEX(eventDescriptionIndex);
	return GET<EventDescription>(eventDescriptionIndex)->isDopplerEnabled((bool*)isDopplerEnabledOutBuf);
}

double FML_Studio_EventDescription_hasSustainPoint(double eventDescriptionIndex, char* hasSustainPointOutBuf)
{
	CHECK_OBJECT_INDEX(eventDescriptionIndex);
	return GET<EventDescription>(eventDescriptionIndex)->hasSustainPoint((bool*)hasSustainPointOutBuf);
}

double FML_Studio_EventDescription_createInstance(double eventDescriptionIndex, char* eventInstanceIndexOutBuf)
{
	CHECK_OBJECT_INDEX(eventDescriptionIndex);
	FMOD::Studio::EventInstance* instance;
	auto res = GET<EventDescription>(eventDescriptionIndex)->createInstance(&instance);
	if (res == FMOD_OK) {
		poke(eventInstanceIndexOutBuf, ADD(instance));
	}
	return res;
}

double FML_Studio_EventDescription_getInstanceCount(double eventDescriptionIndex, char* countOutBuf)
{
	CHECK_OBJECT_INDEX(eventDescriptionIndex);
	return GET<EventDescription>(eventDescriptionIndex)->getInstanceCount((buffer_s32*)countOutBuf);
}

double FML_Studio_EventDescription_getInstanceList(double eventDescriptionIndex, char* instanceIndicesOutBuf, char* countOutBuf)
{
	CHECK_OBJECT_INDEX(eventDescriptionIndex);
	auto outBufSize = BufWriter(instanceIndicesOutBuf).read<BSHT>();
	char* outBufPos = instanceIndicesOutBuf + sizeof(BSHT);
	int capacity = (outBufSize - sizeof(BSHT)) / sizeof(OBJECT_INDEX);
	std::vector<FMOD::Studio::EventInstance*> instances;
	instances.resize(capacity, nullptr);
	int count;
	FMOD_RESULT res = GET<EventDescription>(eventDescriptionIndex)->getInstanceList(instances.data(), capacity, &count);
	if (res == FMOD_OK) {
		BufWriter bw(outBufPos);
		for (int i = 0; i < count; ++i) {
			bw.write(ADD(instances[i]));
		}
		*(buffer_s32*)countOutBuf = count;
	}
	return res;
}

double FML_Studio_EventDescription_loadSampleData(double eventDescriptionIndex)
{
	CHECK_OBJECT_INDEX(eventDescriptionIndex);
	return GET<EventDescription>(eventDescriptionIndex)->loadSampleData();
}

double FML_Studio_EventDescription_unloadSampleData(double eventDescriptionIndex)
{
	CHECK_OBJECT_INDEX(eventDescriptionIndex);
	return GET<EventDescription>(eventDescriptionIndex)->unloadSampleData();
}

double FML_Studio_EventDescription_getSampleLoadingState(double eventDescriptionIndex, char* stateOutBuf)
{
	CHECK_OBJECT_INDEX(eventDescriptionIndex);
	return GET<EventDescription>(eventDescriptionIndex)->getSampleLoadingState((FMOD_STUDIO_LOADING_STATE*)stateOutBuf);
}

double FML_Studio_EventDescription_releaseAllInstances(double eventDescriptionIndex)
{
	CHECK_OBJECT_INDEX(eventDescriptionIndex);
	return GET<EventDescription>(eventDescriptionIndex)->releaseAllInstances();
}

double FML_Studio_EventDescription_setCallback(double eventDescriptionIndex, double callbackMask)
{
	CHECK_OBJECT_INDEX(eventDescriptionIndex);
	return GET<EventDescription>(eventDescriptionIndex)->setCallback(internal::eventCallback, callbackMask);
}
