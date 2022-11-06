#pragma once

#include "internal_common.hpp"

// FMOD_RESULT F_API release();
// FMOD_RESULT F_API getSystemObject(System** system);
// FMOD_RESULT F_API addInput(DSP* input, DSPConnection** connection = 0, FMOD_DSPCONNECTION_TYPE type = FMOD_DSPCONNECTION_TYPE_STANDARD);
// FMOD_RESULT F_API disconnectFrom(DSP* target, DSPConnection* connection = 0);
// FMOD_RESULT F_API disconnectAll(bool inputs, bool outputs);
// FMOD_RESULT F_API getNumInputs(int* numinputs);
// FMOD_RESULT F_API getNumOutputs(int* numoutputs);
// FMOD_RESULT F_API getInput(int index, DSP** input, DSPConnection** inputconnection);
// FMOD_RESULT F_API getOutput(int index, DSP** output, DSPConnection** outputconnection);
// FMOD_RESULT F_API setActive(bool active);
// FMOD_RESULT F_API getActive(bool* active);
// FMOD_RESULT F_API setBypass(bool bypass);
// FMOD_RESULT F_API getBypass(bool* bypass);
// FMOD_RESULT F_API setWetDryMix(float prewet, float postwet, float dry);
// FMOD_RESULT F_API getWetDryMix(float* prewet, float* postwet, float* dry);
// FMOD_RESULT F_API setChannelFormat(FMOD_CHANNELMASK channelmask, int numchannels, FMOD_SPEAKERMODE source_speakermode);
// FMOD_RESULT F_API getChannelFormat(FMOD_CHANNELMASK* channelmask, int* numchannels, FMOD_SPEAKERMODE* source_speakermode);
// FMOD_RESULT F_API getOutputChannelFormat(FMOD_CHANNELMASK inmask, int inchannels, FMOD_SPEAKERMODE inspeakermode, FMOD_CHANNELMASK* outmask, int* outchannels, FMOD_SPEAKERMODE* outspeakermode);
// FMOD_RESULT F_API reset();
// FMOD_RESULT F_API setParameterFloat(int index, float value);
// FMOD_RESULT F_API setParameterInt(int index, int value);
// FMOD_RESULT F_API setParameterBool(int index, bool value);
// FMOD_RESULT F_API setParameterData(int index, void* data, unsigned int length);
// FMOD_RESULT F_API getParameterFloat(int index, float* value, char* valuestr, int valuestrlen);
// FMOD_RESULT F_API getParameterInt(int index, int* value, char* valuestr, int valuestrlen);
// FMOD_RESULT F_API getParameterBool(int index, bool* value, char* valuestr, int valuestrlen);
// FMOD_RESULT F_API getParameterData(int index, void** data, unsigned int* length, char* valuestr, int valuestrlen);
// FMOD_RESULT F_API getNumParameters(int* numparams);
// FMOD_RESULT F_API getParameterInfo(int index, FMOD_DSP_PARAMETER_DESC** desc);
// FMOD_RESULT F_API getDataParameterIndex(int datatype, int* index);
// FMOD_RESULT F_API showConfigDialog(void* hwnd, bool show);
// FMOD_RESULT F_API getInfo(char* name, unsigned int* version, int* channels, int* configwidth, int* configheight);
// FMOD_RESULT F_API getType(FMOD_DSP_TYPE* type);
// FMOD_RESULT F_API getIdle(bool* idle);
// FMOD_RESULT F_API setUserData(void* userdata);
// FMOD_RESULT F_API getUserData(void** userdata);
// FMOD_RESULT F_API setMeteringEnabled(bool inputEnabled, bool outputEnabled);
// FMOD_RESULT F_API getMeteringEnabled(bool* inputEnabled, bool* outputEnabled);
// FMOD_RESULT F_API getMeteringInfo(FMOD_DSP_METERING_INFO* inputInfo, FMOD_DSP_METERING_INFO* outputInfo);
// FMOD_RESULT F_API getCPUUsage(unsigned int* exclusive, unsigned int* inclusive);
