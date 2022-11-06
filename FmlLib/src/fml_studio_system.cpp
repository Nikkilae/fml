
#include "fml_studio_system.hpp"

#include <memory>

#include "fmod_studio.hpp"

using internal::BufReader;
using internal::BufWriter;
using internal::poke;

using SSystem = FMOD::Studio::System;

double FML_Studio_System_create(double headerVersion, char* systemIndexOutBuf)
{
	SSystem* system;
	FMOD_RESULT res = SSystem::create(&system, headerVersion);
	if (res == FMOD_OK) {
		poke(systemIndexOutBuf, ADD(system));
	}
	return res;
}

double FML_Studio_System_setAdvancedSettings(double studioSystemIndex, const char* settings)
{
	CHECK_OBJECT_INDEX(studioSystemIndex);
	BufReader br(settings);
	FMOD_STUDIO_ADVANCEDSETTINGS sets = internal::read_studio_advanced_settings_from_buffer(br);
	return GET<SSystem>(studioSystemIndex)->setAdvancedSettings(&sets);
}

double FML_Studio_System_getAdvancedSettings(double studioSystemIndex, char* settingsOutBuf)
{
	CHECK_OBJECT_INDEX(studioSystemIndex);
	FMOD_STUDIO_ADVANCEDSETTINGS settings;
	settings.cbsize = sizeof(FMOD_STUDIO_ADVANCEDSETTINGS);
	FMOD_RESULT res = GET<SSystem>(studioSystemIndex)->getAdvancedSettings(&settings);
	if (res == FMOD_OK) {
		auto buffer_size = BufReader(settingsOutBuf).read<BSHT>();
		if (buffer_size < internal::get_studio_advanced_settings_required_buffer_size(settings)) {
			return static_cast<double>(FML_ERROR::BUFFER_TOO_SMALL);
		}
		BufWriter bw(settingsOutBuf);
		internal::write_studio_advanced_settings_to_buffer(settings, bw);
	}
	return res;
}

double FML_Studio_System_initialize(double studioSystemIndex, double maxChannels, double studioFlags, double coreFlags)
{
	// TODO: Extra driver data.
	CHECK_OBJECT_INDEX(studioSystemIndex);
	return GET<SSystem>(studioSystemIndex)->initialize(maxChannels, studioFlags, coreFlags, nullptr);
}

double FML_Studio_System_release(double studioSystemIndex)
{
	CHECK_OBJECT_INDEX(studioSystemIndex);
	return GET<SSystem>(studioSystemIndex)->release();
}

double FML_Studio_System_isValid(double studioSystemIndex, char* isValidOutBuf)
{
	CHECK_OBJECT_INDEX(studioSystemIndex);
	*(buffer_bool*)isValidOutBuf = GET<SSystem>(studioSystemIndex)->isValid();
	return FMOD_OK;
}

double FML_Studio_System_update(double studioSystemIndex)
{
	CHECK_OBJECT_INDEX(studioSystemIndex);
	return GET<SSystem>(studioSystemIndex)->update();
}

double FML_Studio_System_flushCommands(double studioSystemIndex)
{
	CHECK_OBJECT_INDEX(studioSystemIndex);
	return GET<SSystem>(studioSystemIndex)->flushCommands();
}

double FML_Studio_System_flushSampleLoading(double studioSystemIndex)
{
	CHECK_OBJECT_INDEX(studioSystemIndex);
	return GET<SSystem>(studioSystemIndex)->flushSampleLoading();
}

double FML_Studio_System_getCoreSystem(double studioSystemIndex, char* coreSystemIndexOutBuf)
{
	CHECK_OBJECT_INDEX(studioSystemIndex);
	FMOD::System* coreSystem;
	FMOD_RESULT res = GET<SSystem>(studioSystemIndex)->getCoreSystem(&coreSystem);
	if (res == FMOD_OK) {
		poke(coreSystemIndexOutBuf, ADD(coreSystem));
	}
	return res;
}

double FML_Studio_System_getEvent(double studioSystemIndex, const char* path, char* eventIndexOutBuf)
{
	CHECK_OBJECT_INDEX(studioSystemIndex);
	FMOD::Studio::EventDescription* event;
	FMOD_RESULT res = GET<SSystem>(studioSystemIndex)->getEvent(path, &event);
	if (res == FMOD_OK) {
		poke(eventIndexOutBuf, ADD(event));
	}
	return res;
}

double FML_Studio_System_getBus(double studioSystemIndex, const char* path, char* busIndexOutBuf)
{
	FMOD::Studio::Bus* bus;
	FMOD_RESULT res = GET<SSystem>(studioSystemIndex)->getBus(path, &bus);
	if (res == FMOD_OK) {
		poke(busIndexOutBuf, ADD(bus));
	}
	return res;
}

double FML_Studio_System_getVCA(double studioSystemIndex, const char* path, char* vcaIndexOutBuf)
{
	CHECK_OBJECT_INDEX(studioSystemIndex);
	FMOD::Studio::VCA* vca;
	FMOD_RESULT res = GET<SSystem>(studioSystemIndex)->getVCA(path, &vca);
	if (res == FMOD_OK) {
		poke(vcaIndexOutBuf, ADD(vca));
	}
	return res;
}

double FML_Studio_System_getBank(double studioSystemIndex, const char* path, char* bankIndexOutBuf)
{
	CHECK_OBJECT_INDEX(studioSystemIndex);
	FMOD::Studio::Bank* bank;
	FMOD_RESULT res = GET<SSystem>(studioSystemIndex)->getBank(path, &bank);
	if (res == FMOD_OK) {
		poke(bankIndexOutBuf, ADD(bank));
	}
	return res;
}

double FML_Studio_System_getEventByID(double studioSystemIndex, const char* id, char* eventIndexOutBuf)
{
	CHECK_OBJECT_INDEX(studioSystemIndex);
	BufReader br(id);
	FMOD_GUID guid = internal::read_guid_from_buffer(br);
	FMOD::Studio::EventDescription* event;
	FMOD_RESULT res = GET<SSystem>(studioSystemIndex)->getEventByID(&guid, &event);
	if (res == FMOD_OK) {
		poke(eventIndexOutBuf, ADD(event));
	}
	return res;
}

double FML_Studio_System_getBusByID(double studioSystemIndex, const char* id, char* busIndexOutBuf)
{
	CHECK_OBJECT_INDEX(studioSystemIndex);
	BufReader br(id);
	FMOD_GUID guid = internal::read_guid_from_buffer(br);
	FMOD::Studio::Bus* bus;
	FMOD_RESULT res = GET<SSystem>(studioSystemIndex)->getBusByID(&guid, &bus);
	if (res == FMOD_OK) {
		poke(busIndexOutBuf, ADD(bus));
	}
	return res;
}

double FML_Studio_System_getVCAByID(double studioSystemIndex, const char* id, char* vcaIndexOutBuf)
{
	CHECK_OBJECT_INDEX(studioSystemIndex);
	BufReader br(id);
	FMOD_GUID guid = internal::read_guid_from_buffer(br);
	FMOD::Studio::VCA* vca;
	FMOD_RESULT res = GET<SSystem>(studioSystemIndex)->getVCAByID(&guid, &vca);
	if (res == FMOD_OK) {
		poke(vcaIndexOutBuf, ADD(vca));
	}
	return res;
}

double FML_Studio_System_getBankByID(double studioSystemIndex, const char* id, char* bankIndexOutBuf)
{
	CHECK_OBJECT_INDEX(studioSystemIndex);
	BufReader br(id);
	FMOD_GUID guid = internal::read_guid_from_buffer(br);
	FMOD::Studio::Bank* bank;
	FMOD_RESULT res = GET<SSystem>(studioSystemIndex)->getBankByID(&guid, &bank);
	if (res == FMOD_OK) {
		poke(bankIndexOutBuf, ADD(bank));
	}
	return res;
}

double FML_Studio_System_getParameterDescriptionByName(double studioSystemIndex, const char* name, char* descriptionOutBuf)
{
	CHECK_OBJECT_INDEX(studioSystemIndex);
	auto outBufSize = BufReader(descriptionOutBuf).read<BSHT>();
	FMOD_STUDIO_PARAMETER_DESCRIPTION description;
	FMOD_RESULT res = GET<SSystem>(studioSystemIndex)->getParameterDescriptionByName(name, &description);
	if (res == FMOD_OK) {
		if (outBufSize < internal::get_parameter_description_required_buffer_size(description)) {
			return static_cast<double>(FML_ERROR::BUFFER_TOO_SMALL);
		}
		BufWriter bw(descriptionOutBuf);
		internal::write_studio_parameter_description_to_buffer(description, bw);
	}
	return res;
}

double FML_Studio_System_getParameterDescriptionByID(double studioSystemIndex, const char* idBuffer, char* descriptionOutBuf)
{
	CHECK_OBJECT_INDEX(studioSystemIndex);
	auto outBufSize = BufReader(descriptionOutBuf).read<BSHT>();
	BufReader br(idBuffer);
	FMOD_STUDIO_PARAMETER_ID id = internal::read_studio_parameter_id_from_buffer(br);
	FMOD_STUDIO_PARAMETER_DESCRIPTION description;
	FMOD_RESULT res = GET<SSystem>(studioSystemIndex)->getParameterDescriptionByID(id, &description);
	if (res == FMOD_OK) {
		if (outBufSize < internal::get_parameter_description_required_buffer_size(description)) {
			return static_cast<double>(FML_ERROR::BUFFER_TOO_SMALL);
		}
		BufWriter bw(descriptionOutBuf);
		internal::write_studio_parameter_description_to_buffer(description, bw);
	}
	return res;
}

double FML_Studio_System_getParameterLabelByName(double studioSystemIndex, const char* name, double labelindex, char* labelOutBuf)
{
	CHECK_OBJECT_INDEX(studioSystemIndex);
	auto outStrSize = BufWriter(labelOutBuf).read<BSHT>();
	return GET<SSystem>(studioSystemIndex)->getParameterLabelByName(name, labelindex, labelOutBuf, outStrSize, nullptr);
}

double FML_Studio_System_getParameterLabelByID(double studioSystemIndex, const char* parameterIdBuf, double labelIndex, char* labelOutBuf)
{
	CHECK_OBJECT_INDEX(studioSystemIndex);
	BufReader br(parameterIdBuf);
	FMOD_STUDIO_PARAMETER_ID id = internal::read_studio_parameter_id_from_buffer(br);
	auto outStrSize = BufWriter(labelOutBuf).read<BSHT>();
	return GET<SSystem>(studioSystemIndex)->getParameterLabelByID(id, labelIndex, labelOutBuf, outStrSize, nullptr);
}

double FML_Studio_System_getParameterByID(double studioSystemIndex, const char* parameterIdBuf, char* valueAndFinalValueOutBuf)
{
	CHECK_OBJECT_INDEX(studioSystemIndex);
	BufReader br(parameterIdBuf);
	FMOD_STUDIO_PARAMETER_ID id = internal::read_studio_parameter_id_from_buffer(br);
	float value, finalValue;
	FMOD_RESULT res = GET<SSystem>(studioSystemIndex)->getParameterByID(id, &value, &finalValue);
	BufWriter bw(valueAndFinalValueOutBuf);
	bw.write<buffer_f32>(value);
	bw.write<buffer_f32>(finalValue);
	return res;
}

double FML_Studio_System_setParameterByID(double studioSystemIndex, const char* parameterIdBuf, double value, double ignoreSeekSpeed)
{
	CHECK_OBJECT_INDEX(studioSystemIndex);
	BufReader br(parameterIdBuf);
	FMOD_STUDIO_PARAMETER_ID id = internal::read_studio_parameter_id_from_buffer(br);
	return GET<SSystem>(studioSystemIndex)->setParameterByID(id, value, ignoreSeekSpeed);
}

double FML_Studio_System_setParameterByIDWithLabel(double studioSystemIndex, const char* parameterIdBuf, const char* label, double ignoreSeekSpeed)
{
	CHECK_OBJECT_INDEX(studioSystemIndex);
	BufReader br(parameterIdBuf);
	FMOD_STUDIO_PARAMETER_ID id = internal::read_studio_parameter_id_from_buffer(br);
	return GET<SSystem>(studioSystemIndex)->setParameterByIDWithLabel(id, label, ignoreSeekSpeed);
}

double FML_Studio_System_setParametersByIDs(double studioSystemIndex, const char* parameterIdsAndValuesBuf, double count, double ignoreSeekSpeed)
{
	CHECK_OBJECT_INDEX(studioSystemIndex);

	std::vector<FMOD_STUDIO_PARAMETER_ID> ids;
	ids.reserve(count);
	std::vector<float> values;
	values.reserve(count);
	
	BufReader br(parameterIdsAndValuesBuf);
	for (size_t i = 0; i < count; ++i) {
		ids.push_back(internal::read_studio_parameter_id_from_buffer(br));
		values.push_back(br.read<float>());
	}
	return GET<SSystem>(studioSystemIndex)->setParametersByIDs(ids.data(), values.data(), count, ignoreSeekSpeed);
}

double FML_Studio_System_getParameterByName(double studioSystemIndex, const char* name, char* valueAndFinalValueOutBuf)
{
	CHECK_OBJECT_INDEX(studioSystemIndex);
	float value, finalValue;
	FMOD_RESULT res = GET<SSystem>(studioSystemIndex)->getParameterByName(name, &value, &finalValue);
	BufWriter bw(valueAndFinalValueOutBuf);
	bw.write<buffer_f32>(value);
	bw.write<buffer_f32>(finalValue);
	return res;
}


double FML_Studio_System_setParameterByName(double studioSystemIndex, const char* name, double value, double ignoreSeekSpeed)
{
	CHECK_OBJECT_INDEX(studioSystemIndex);
	return GET<SSystem>(studioSystemIndex)->setParameterByName(name, value, ignoreSeekSpeed);
}

double FML_Studio_System_setParameterByNameWithLabel(double studioSystemIndex, const char* name, const char* label, double ignoreSeekSpeed)
{
	CHECK_OBJECT_INDEX(studioSystemIndex);
	return GET<SSystem>(studioSystemIndex)->setParameterByNameWithLabel(name, label, ignoreSeekSpeed);
}

double FML_Studio_System_lookupID(double studioSystemIndex, const char* path, char* idOutBuf)
{
	CHECK_OBJECT_INDEX(studioSystemIndex);
	FMOD_GUID guid;
	FMOD_RESULT res = GET<SSystem>(studioSystemIndex)->lookupID(path, &guid);
	if (res == FMOD_OK) {
		BufWriter bw(idOutBuf);
		internal::write_guid_to_buffer(guid, bw);
	}
	return res;
}

double FML_Studio_System_lookupPath(double studioSystemIndex, const char* guidBuf, char* pathOutBuf)
{
	CHECK_OBJECT_INDEX(studioSystemIndex);
	auto outStrSize = BufWriter(pathOutBuf).read<BSHT>() - sizeof(BSHT);
	char* outStrPos = pathOutBuf + sizeof(BSHT);
	BufReader br(guidBuf);
	FMOD_GUID guid = internal::read_guid_from_buffer(br);
	return GET<SSystem>(studioSystemIndex)->lookupPath(&guid, outStrPos, outStrSize, nullptr);
}

double FML_Studio_System_getNumListeners(double studioSystemIndex, char* numListenersOutBuf)
{
	CHECK_OBJECT_INDEX(studioSystemIndex);
	return GET<SSystem>(studioSystemIndex)->getNumListeners((int*)(numListenersOutBuf));
}

double FML_Studio_System_setNumListeners(double studioSystemIndex, double numlisteners)
{
	CHECK_OBJECT_INDEX(studioSystemIndex);
	return GET<SSystem>(studioSystemIndex)->setNumListeners(numlisteners);
}

double FML_Studio_System_getListenerAttributes(double studioSystemIndex, double listener, char* attributesOutBuf, char* attenuationPositionOutBuf)
{
	CHECK_OBJECT_INDEX(studioSystemIndex);
	FMOD_3D_ATTRIBUTES attributes;
	FMOD_VECTOR attenuationPosition;
	FMOD_RESULT res = GET<SSystem>(studioSystemIndex)->getListenerAttributes(listener, &attributes, &attenuationPosition);
	if (res == FMOD_OK) {
		BufWriter bw_attr(attributesOutBuf);
		internal::write_3d_attributes_to_buffer(attributes, bw_attr);
		BufWriter bw_atte(attenuationPositionOutBuf);
		internal::write_vector_to_buffer(attenuationPosition, bw_atte);
	}
	return res;
}

double FML_Studio_System_setListenerAttributes(double studioSystemIndex, double listener, const char* attributesBuf, const char* attenuationPositionBuf)
{
	CHECK_OBJECT_INDEX(studioSystemIndex);
	BufReader br_attr(attributesBuf);
	FMOD_3D_ATTRIBUTES attributes = internal::read_3d_attributes_from_buffer(br_attr);
	std::unique_ptr<FMOD_VECTOR> attPos = nullptr;
	if (attenuationPositionBuf != nullptr) {
		BufReader br_atte(attenuationPositionBuf);
		attPos = std::make_unique<FMOD_VECTOR>(internal::read_vector_from_buffer(br_atte));
	}
	return GET<SSystem>(studioSystemIndex)->setListenerAttributes(listener, &attributes, attPos.get());
}

double FML_Studio_System_getListenerWeight(double studioSystemIndex, double listener, char* weightOutBuf)
{
	CHECK_OBJECT_INDEX(studioSystemIndex);
	return GET<SSystem>(studioSystemIndex)->getListenerWeight(listener, (buffer_f32*)weightOutBuf);
}

double FML_Studio_System_setListenerWeight(double studioSystemIndex, double listener, double weight)
{
	CHECK_OBJECT_INDEX(studioSystemIndex);
	return GET<SSystem>(studioSystemIndex)->setListenerWeight(listener, weight);
}

double FML_Studio_System_loadBankFile(double studioSystemIndex, const char* filename, double flags, char* bankIndexOutBuf)
{
	CHECK_OBJECT_INDEX(studioSystemIndex);
	FMOD::Studio::Bank* bank;
	auto res = GET<SSystem>(studioSystemIndex)->loadBankFile(filename, flags, &bank);
	if (res == FMOD_OK) {
		poke(bankIndexOutBuf, ADD(bank));
	}
	return res;
}

double FML_Studio_System_loadBankMemory(double studioSystemIndex, const char* bankBuffer, const char* argsBuffer, char* bankIndexOutBuf)
{
	CHECK_OBJECT_INDEX(studioSystemIndex);
	FMOD::Studio::Bank* bank;
	BufReader argsBr(argsBuffer);
	auto length = argsBr.read<buffer_s32>();
	auto mode = static_cast<FMOD_STUDIO_LOAD_MEMORY_MODE>(argsBr.read<buffer_s32>());
	FMOD_STUDIO_LOAD_BANK_FLAGS flags = argsBr.read<buffer_u32>();
	FMOD_RESULT res = GET<SSystem>(studioSystemIndex)->loadBankMemory(bankBuffer, length, mode, flags, &bank);
	if (res == FMOD_OK) {
		poke(bankIndexOutBuf, ADD(bank));
	}
	return res;
}

double FML_Studio_System_unloadAll(double studioSystemIndex)
{
	CHECK_OBJECT_INDEX(studioSystemIndex);
	return GET<SSystem>(studioSystemIndex)->unloadAll();
}

double FML_Studio_System_getBufferUsage(double studioSystemIndex, char* usageOutBuf)
{
	CHECK_OBJECT_INDEX(studioSystemIndex);
	FMOD_STUDIO_BUFFER_USAGE usage;
	FMOD_RESULT res = GET<SSystem>(studioSystemIndex)->getBufferUsage(&usage);
	BufWriter bw(usageOutBuf);
	internal::write_buffer_usage_to_buffer(usage, bw);
	return res;
}

double FML_Studio_System_resetBufferUsage(double studioSystemIndex)
{
	CHECK_OBJECT_INDEX(studioSystemIndex);
	return GET<SSystem>(studioSystemIndex)->resetBufferUsage();
}

double FML_Studio_System_unregisterPlugin(double studioSystemIndex, const char* name)
{
	CHECK_OBJECT_INDEX(studioSystemIndex);
	return GET<SSystem>(studioSystemIndex)->unregisterPlugin(name);
}

double FML_Studio_System_getBankCount(double studioSystemIndex, char* countOutBuf)
{
	CHECK_OBJECT_INDEX(studioSystemIndex);
	return GET<SSystem>(studioSystemIndex)->getBankCount((int*)countOutBuf);
}

double FML_Studio_System_getBankList(double studioSystemIndex, char* bankIndicesOutBuf, char* countOutBuf)
{
	CHECK_OBJECT_INDEX(studioSystemIndex);
	auto outBufSize = BufWriter(bankIndicesOutBuf).read<BSHT>();
	char* outBufPos = bankIndicesOutBuf + sizeof(BSHT);
	int capacity = (outBufSize - sizeof(BSHT)) / sizeof(OBJECT_INDEX);
	std::vector<FMOD::Studio::Bank*> banks;
	banks.resize(capacity, nullptr);
	int count;
	FMOD_RESULT res = GET<SSystem>(studioSystemIndex)->getBankList(banks.data(), capacity, &count);
	if (res == FMOD_OK) {
		BufWriter bw(outBufPos);
		for (int i = 0; i < count; ++i) {
			bw.write(ADD(banks[i]));
		}
		*(buffer_s32*)countOutBuf = count;
	}
	return res;
}

double FML_Studio_System_getParameterDescriptionCount(double studioSystemIndex, char* countOutBuf)
{
	CHECK_OBJECT_INDEX(studioSystemIndex);
	return GET<SSystem>(studioSystemIndex)->getParameterDescriptionCount((int*)countOutBuf);
}

double FML_Studio_System_getParameterDescriptionList(double studioSystemIndex, char* descriptionsOutBuf, char* countOutBuf)
{
	CHECK_OBJECT_INDEX(studioSystemIndex);
	auto outBufSize = BufWriter(descriptionsOutBuf).read<BSHT>();
	char* outBufPos = descriptionsOutBuf + sizeof(BSHT);
	int capacity = (outBufSize - sizeof(BSHT)) / sizeof(OBJECT_INDEX);
	std::vector<FMOD_STUDIO_PARAMETER_DESCRIPTION> descriptions;
	descriptions.resize(capacity);
	int count;
	FMOD_RESULT res = GET<SSystem>(studioSystemIndex)->getParameterDescriptionList(descriptions.data(), capacity, &count);
	if (res == FMOD_OK) {
		size_t requiredSize = sizeof(BSHT);
		for (int i = 0; i < count; ++i) {
			requiredSize += internal::get_parameter_description_required_buffer_size(descriptions[i]);
		}
		if (outBufSize < requiredSize) {
			return static_cast<double>(FML_ERROR::BUFFER_TOO_SMALL);
		}

		BufWriter bw(outBufPos);
		for (int i = 0; i < count; ++i) {
			internal::write_studio_parameter_description_to_buffer(descriptions[i], bw);
		}
		*(buffer_s32*)countOutBuf = count;
	}
	return res;
}

double FML_Studio_System_startCommandCapture(double studioSystemIndex, const char* filename, double flags)
{
	CHECK_OBJECT_INDEX(studioSystemIndex);
	return GET<SSystem>(studioSystemIndex)->startCommandCapture(filename, flags);
}

double FML_Studio_System_stopCommandCapture(double studioSystemIndex)
{
	CHECK_OBJECT_INDEX(studioSystemIndex);
	return GET<SSystem>(studioSystemIndex)->stopCommandCapture();
}

double FML_Studio_System_loadCommandReplay(double studioSystemIndex, const char* filename, double flags, char* replayIndexOutBuf)
{
	CHECK_OBJECT_INDEX(studioSystemIndex);
	FMOD::Studio::CommandReplay* replay;
	auto res = GET<SSystem>(studioSystemIndex)->loadCommandReplay(filename, flags, &replay);
	if (res == FMOD_OK) {
		poke(replayIndexOutBuf, ADD(replay));
	}
	return res;
}

double FML_Studio_System_setCallback(double studioSystemIndex, double callbackMask)
{
	CHECK_OBJECT_INDEX(studioSystemIndex);
	FMOD_RESULT res = GET<SSystem>(studioSystemIndex)->setCallback(internal::studioSystemCallback, callbackMask);
	return res;
}

double FML_Studio_System_getCPUUsage(double studioSystemIndex, char* studioUsageOutBuf, char* coreUsageOutBuf)
{
	CHECK_OBJECT_INDEX(studioSystemIndex);
	FMOD_STUDIO_CPU_USAGE studioUsage;
	FMOD_CPU_USAGE coreUsage;
	auto res = GET<SSystem>(studioSystemIndex)->getCPUUsage(&studioUsage, &coreUsage);
	BufWriter studioBw(studioUsageOutBuf);
	internal::write_studio_cpu_usage_to_buffer(studioUsage, studioBw);
	BufWriter coreBw(coreUsageOutBuf);
	internal::write_core_cpu_usage_to_buffer(coreUsage, coreBw);
	return res;
}

double FML_Studio_System_getMemoryUsage(double studioSystemIndex, char* memoryUsageOutBuf)
{
	CHECK_OBJECT_INDEX(studioSystemIndex);
	FMOD_STUDIO_MEMORY_USAGE memoryUsage;
	auto res = GET<SSystem>(studioSystemIndex)->getMemoryUsage(&memoryUsage);
	BufWriter bw(memoryUsageOutBuf);
	internal::write_studio_memory_usage_to_buffer(memoryUsage, bw);
	return res;
}
