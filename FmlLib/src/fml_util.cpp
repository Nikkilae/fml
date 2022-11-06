
#include "fml_util.hpp"

#include "internal_common.hpp"

#include "fmod_studio.hpp"

using internal::BufReader;
using internal::BufWriter;

const char* FML_UTIL_FML_VERSION()
{
	return FML_VERSION;
}

double FML_UTIL_FMOD_VERSION()
{
	return FMOD_VERSION;
}

const char* FML_UTIL_errorString(double fmlErrorCode)
{
	switch (static_cast<FML_ERROR>(fmlErrorCode)) {
		case FML_ERROR::BUFFER_TOO_SMALL:		return "The buffer is too small.";
		case FML_ERROR::OBJECT_DOESNT_EXIST:	return "Object with the given index doesn't exist.";
	}
	return "Unknown error.";
}

const char* FML_UTIL_guidToString(const char* guidBuf)
{
	BufReader br(guidBuf);
	FMOD_GUID guid = internal::read_guid_from_buffer(br);
	static char guid_str[39];
	snprintf(guid_str, sizeof(guid_str), "{%08x-%04x-%04x-%02x%02x-%02x%02x%02x%02x%02x%02x}",
		guid.Data1,		guid.Data2,		guid.Data3,
		guid.Data4[0],	guid.Data4[1],	guid.Data4[2],
		guid.Data4[3],	guid.Data4[4],	guid.Data4[5],
		guid.Data4[6],	guid.Data4[7]);
	return guid_str;
}

double FML_UTIL_getCallbacks(char* callbacksOutBuf, double bufSize)
{
	const std::lock_guard<std::mutex> lock(internal::callbackQueueMutex);

	bufSize = std::max(0.0, bufSize);
	size_t dataSize = internal::callbackQueue.tell();
	memcpy(callbacksOutBuf, internal::callbackQueue.data(), std::min(static_cast<size_t>(bufSize), dataSize));
	internal::callbackQueue.seek(0);
	return dataSize;
}

double FML_UTIL_sizeOfVoidPtr()
{
	return sizeof(void*);
}
