#pragma once

#include "internal_common.hpp"

// FMOD_RESULT F_API release();
// FMOD_RESULT F_API getSystemObject(System** system);
// FMOD_RESULT F_API lock(unsigned int offset, unsigned int length, void** ptr1, void** ptr2, unsigned int* len1, unsigned int* len2);
// FMOD_RESULT F_API unlock(void* ptr1, void* ptr2, unsigned int len1, unsigned int len2);
// FMOD_RESULT F_API setDefaults(float frequency, int priority);
// FMOD_RESULT F_API getDefaults(float* frequency, int* priority);
// FMOD_RESULT F_API set3DMinMaxDistance(float min, float max);
// FMOD_RESULT F_API get3DMinMaxDistance(float* min, float* max);
// FMOD_RESULT F_API set3DConeSettings(float insideconeangle, float outsideconeangle, float outsidevolume);
// FMOD_RESULT F_API get3DConeSettings(float* insideconeangle, float* outsideconeangle, float* outsidevolume);
// FMOD_RESULT F_API set3DCustomRolloff(FMOD_VECTOR* points, int numpoints);
// FMOD_RESULT F_API get3DCustomRolloff(FMOD_VECTOR** points, int* numpoints);
// FMOD_RESULT F_API getSubSound(int index, Sound** subsound);
// FMOD_RESULT F_API getSubSoundParent(Sound** parentsound);
// FMOD_RESULT F_API getName(char* name, int namelen);
// FMOD_RESULT F_API getLength(unsigned int* length, FMOD_TIMEUNIT lengthtype);
// FMOD_RESULT F_API getFormat(FMOD_SOUND_TYPE* type, FMOD_SOUND_FORMAT* format, int* channels, int* bits);
// FMOD_RESULT F_API getNumSubSounds(int* numsubsounds);
// FMOD_RESULT F_API getNumTags(int* numtags, int* numtagsupdated);
// FMOD_RESULT F_API getTag(const char* name, int index, FMOD_TAG* tag);
// FMOD_RESULT F_API getOpenState(FMOD_OPENSTATE* openstate, unsigned int* percentbuffered, bool* starving, bool* diskbusy);
// FMOD_RESULT F_API readData(void* buffer, unsigned int length, unsigned int* read);
// FMOD_RESULT F_API seekData(unsigned int pcm);
// FMOD_RESULT F_API setSoundGroup(SoundGroup* soundgroup);
// FMOD_RESULT F_API getSoundGroup(SoundGroup** soundgroup);
// FMOD_RESULT F_API getNumSyncPoints(int* numsyncpoints);
// FMOD_RESULT F_API getSyncPoint(int index, FMOD_SYNCPOINT** point);
// FMOD_RESULT F_API getSyncPointInfo(FMOD_SYNCPOINT* point, char* name, int namelen, unsigned int* offset, FMOD_TIMEUNIT offsettype);
// FMOD_RESULT F_API addSyncPoint(unsigned int offset, FMOD_TIMEUNIT offsettype, const char* name, FMOD_SYNCPOINT** point);
// FMOD_RESULT F_API deleteSyncPoint(FMOD_SYNCPOINT* point);
// FMOD_RESULT F_API setMode(FMOD_MODE mode);
// FMOD_RESULT F_API getMode(FMOD_MODE* mode);
// FMOD_RESULT F_API setLoopCount(int loopcount);
// FMOD_RESULT F_API getLoopCount(int* loopcount);
// FMOD_RESULT F_API setLoopPoints(unsigned int loopstart, FMOD_TIMEUNIT loopstarttype, unsigned int loopend, FMOD_TIMEUNIT loopendtype);
// FMOD_RESULT F_API getLoopPoints(unsigned int* loopstart, FMOD_TIMEUNIT loopstarttype, unsigned int* loopend, FMOD_TIMEUNIT loopendtype);
// FMOD_RESULT F_API getMusicNumChannels(int* numchannels);
// FMOD_RESULT F_API setMusicChannelVolume(int channel, float volume);
// FMOD_RESULT F_API getMusicChannelVolume(int channel, float* volume);
// FMOD_RESULT F_API setMusicSpeed(float speed);
// FMOD_RESULT F_API getMusicSpeed(float* speed);
// FMOD_RESULT F_API setUserData(void* userdata);
// FMOD_RESULT F_API getUserData(void** userdata);
