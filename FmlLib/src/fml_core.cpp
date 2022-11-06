
#include "fml_core.hpp"

#include "fmod.hpp"

double FML_Debug_Initialize(double flags, double mode, const char* filename)
{
	constexpr auto callback = nullptr; // TODO
	return FMOD::Debug_Initialize(flags, static_cast<FMOD_DEBUG_MODE>(mode), callback, filename);
}
