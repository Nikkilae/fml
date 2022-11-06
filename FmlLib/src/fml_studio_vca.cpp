
#include "fml_studio_vca.hpp"

#include "fmod_studio.hpp"

using internal::BufReader;
using internal::BufWriter;

using Vca = FMOD::Studio::VCA;

double FML_Studio_Vca_isValid(double vcaIndex, char* isValidOutBuf)
{
	CHECK_OBJECT_INDEX(vcaIndex);
	*(buffer_bool*)isValidOutBuf = GET<Vca>(vcaIndex)->isValid();
	return FMOD_OK;
}

double FML_Studio_Vca_getID(double vcaIndex, char* idOutBuf)
{
	CHECK_OBJECT_INDEX(vcaIndex);
	FMOD_GUID guid;
	FMOD_RESULT res = GET<Vca>(vcaIndex)->getID(&guid);
	if (res == FMOD_OK) {
		BufWriter bw(idOutBuf);
		internal::write_guid_to_buffer(guid, bw);
	}
	return res;
}

double FML_Studio_Vca_getPath(double vcaIndex, char* pathOutBuf)
{
	CHECK_OBJECT_INDEX(vcaIndex);
	auto outStrSize = BufReader(pathOutBuf).read<BSHT>() - sizeof(BSHT);
	char* outStrPos = pathOutBuf + sizeof(BSHT);
	return GET<Vca>(vcaIndex)->getPath(outStrPos, outStrSize, nullptr);
}

double FML_Studio_Vca_getVolume(double vcaIndex, char* volumeAndFinalVolumeOutBuf)
{
	CHECK_OBJECT_INDEX(vcaIndex);
	return GET<Vca>(vcaIndex)->getVolume((buffer_f32*)volumeAndFinalVolumeOutBuf, (buffer_f32*)(volumeAndFinalVolumeOutBuf + sizeof(buffer_f32)));
}

double FML_Studio_Vca_setVolume(double vcaIndex, double volume)
{
	CHECK_OBJECT_INDEX(vcaIndex);
	return GET<Vca>(vcaIndex)->setVolume(volume);
}
