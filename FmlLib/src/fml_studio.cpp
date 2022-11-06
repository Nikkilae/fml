
#include "fml_studio.hpp"

#include "fmod_studio.hpp"

double FML_Studio_ParseID(const char* guidStrBuf, char* guidOutBuf)
{
	FMOD_GUID guid;
	FMOD_RESULT res = FMOD::Studio::parseID(guidStrBuf, &guid);
	if (res == FMOD_OK) {
		internal::BufWriter bw(guidOutBuf);
		internal::write_guid_to_buffer(guid, bw);
	}
	return res;
}
