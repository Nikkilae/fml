
#include "fml_studio_bank.hpp"

#include "fmod_studio.hpp"

#include <vector>

using internal::BufReader;
using internal::BufWriter;

using Bank = FMOD::Studio::Bank;

double FML_Studio_Bank_isValid(double bankIndex, char* isValidOutBuf)
{
	CHECK_OBJECT_INDEX(bankIndex);
	*(buffer_bool*)isValidOutBuf = GET<Bank>(bankIndex)->isValid();
	return FMOD_OK;
}

double FML_Studio_Bank_getID(double bankIndex, char* idOutBuf)
{
	CHECK_OBJECT_INDEX(bankIndex);
	FMOD_GUID guid;
	FMOD_RESULT res = GET<Bank>(bankIndex)->getID(&guid);
	if (res == FMOD_OK) {
		BufWriter bw(idOutBuf);
		internal::write_guid_to_buffer(guid, bw);
	}
	return res;
}

double FML_Studio_Bank_getPath(double bankIndex, char* pathOutBuf)
{
	CHECK_OBJECT_INDEX(bankIndex);
	auto outStrSize = BufReader(pathOutBuf).read<BSHT>() - sizeof(BSHT);
	char* outStrPos = pathOutBuf + sizeof(BSHT);
	return GET<Bank>(bankIndex)->getPath(outStrPos, outStrSize, nullptr);
}

double FML_Studio_Bank_unload(double bankIndex)
{
	CHECK_OBJECT_INDEX(bankIndex);
	return GET<Bank>(bankIndex)->unload();
}

double FML_Studio_Bank_loadSampleData(double bankIndex)
{
	CHECK_OBJECT_INDEX(bankIndex);
	return GET<Bank>(bankIndex)->loadSampleData();
}

double FML_Studio_Bank_unloadSampleData(double bankIndex)
{
	CHECK_OBJECT_INDEX(bankIndex);
	return GET<Bank>(bankIndex)->unloadSampleData();
}

double FML_Studio_Bank_getLoadingState(double bankIndex, char* stateOutBuf)
{
	CHECK_OBJECT_INDEX(bankIndex);
	return GET<Bank>(bankIndex)->getLoadingState((FMOD_STUDIO_LOADING_STATE*)stateOutBuf);
}

double FML_Studio_Bank_getSampleLoadingState(double bankIndex, char* stateOutBuf)
{
	CHECK_OBJECT_INDEX(bankIndex);
	return GET<Bank>(bankIndex)->getSampleLoadingState((FMOD_STUDIO_LOADING_STATE*)stateOutBuf);
}

double FML_Studio_Bank_getStringCount(double bankIndex, char* countOutBuf)
{
	CHECK_OBJECT_INDEX(bankIndex);
	return GET<Bank>(bankIndex)->getStringCount((buffer_s32*)countOutBuf);
}

double FML_Studio_Bank_getStringInfo(double bankIndex, double index, char* guidOutBuf, char* pathOutBuf)
{
	CHECK_OBJECT_INDEX(bankIndex);
	auto outStrSize = BufWriter(pathOutBuf).read<BSHT>() - sizeof(BSHT);
	char* outStrPos = pathOutBuf + sizeof(BSHT);
	FMOD_GUID guid;
	FMOD_RESULT res = GET<Bank>(bankIndex)->getStringInfo(index, &guid, outStrPos, outStrSize, nullptr);
	if (res == FMOD_OK) {
		BufWriter guidBw(guidOutBuf);
		internal::write_guid_to_buffer(guid, guidBw);
	}
	return res;
}

double FML_Studio_Bank_getEventCount(double bankIndex, char* countOutBuf)
{
	CHECK_OBJECT_INDEX(bankIndex);
	return GET<Bank>(bankIndex)->getEventCount((buffer_s32*)countOutBuf);
}

double FML_Studio_Bank_getEventList(double bankIndex, char* eventIndicesOutBuf, char* countOutBuf)
{
	CHECK_OBJECT_INDEX(bankIndex);
	auto outBufSize = BufWriter(eventIndicesOutBuf).read<BSHT>();
	char* outBufPos = eventIndicesOutBuf + sizeof(BSHT);
	int capacity = (outBufSize - sizeof(BSHT)) / sizeof(OBJECT_INDEX);
	std::vector<FMOD::Studio::EventDescription*> events;
	events.resize(capacity, nullptr);
	int count;
	FMOD_RESULT res = GET<Bank>(bankIndex)->getEventList(events.data(), capacity, &count);
	if (res == FMOD_OK) {
		BufWriter bw(outBufPos);
		for (int i = 0; i < count; ++i) {
			bw.write(ADD(events[i]));
		}
		*(buffer_s32*)countOutBuf = count;
	}
	return res;
}

double FML_Studio_Bank_getBusCount(double bankIndex, char* countOutBuf)
{
	CHECK_OBJECT_INDEX(bankIndex);
	return GET<Bank>(bankIndex)->getBusCount((buffer_s32*)countOutBuf);
}

double FML_Studio_Bank_getBusList(double bankIndex, char* bankIndicesOutBuf, char* countOutBuf)
{
	CHECK_OBJECT_INDEX(bankIndex);
	auto outBufSize = BufWriter(bankIndicesOutBuf).read<BSHT>();
	char* outBufPos = bankIndicesOutBuf + sizeof(BSHT);
	int capacity = (outBufSize - sizeof(BSHT)) / sizeof(OBJECT_INDEX);
	std::vector<FMOD::Studio::Bus*> buses;
	buses.resize(capacity, nullptr);
	int count;
	FMOD_RESULT res = GET<Bank>(bankIndex)->getBusList(buses.data(), capacity, &count);
	if (res == FMOD_OK) {
		BufWriter bw(outBufPos);
		for (int i = 0; i < count; ++i) {
			bw.write(ADD(buses[i]));
		}
		*(buffer_s32*)countOutBuf = count;
	}
	return res;
}

double FML_Studio_Bank_getVCACount(double bankIndex, char* countOutBuf)
{
	CHECK_OBJECT_INDEX(bankIndex);
	return GET<Bank>(bankIndex)->getVCACount((buffer_s32*)countOutBuf);
}

double FML_Studio_Bank_getVCAList(double bankIndex, char* vcaIndicesOutBuf, char* countOutBuf)
{
	CHECK_OBJECT_INDEX(bankIndex);
	auto outBufSize = BufWriter(vcaIndicesOutBuf).read<BSHT>();
	char* outBufPos = vcaIndicesOutBuf + sizeof(BSHT);
	int capacity = (outBufSize - sizeof(BSHT)) / sizeof(OBJECT_INDEX);
	std::vector<FMOD::Studio::VCA*> vcas;
	vcas.resize(capacity, nullptr);
	int count;
	FMOD_RESULT res = GET<Bank>(bankIndex)->getVCAList(vcas.data(), capacity, &count);
	if (res == FMOD_OK) {
		BufWriter bw(outBufPos);
		for (int i = 0; i < count; ++i) {
			bw.write(ADD(vcas[i]));
		}
		*(buffer_s32*)countOutBuf = count;
	}
	return res;
}
