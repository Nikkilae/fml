
#include "fml_errors.hpp"

#include "fmod_errors.h"

const char* FML_ErrorString(double errcode)
{
	return FMOD_ErrorString(static_cast<FMOD_RESULT>(errcode));
}
