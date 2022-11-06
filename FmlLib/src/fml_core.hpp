#pragma once

#include "internal_common.hpp"

// FMOD_RESULT Memory_Initialize(void* poolmem, int poollen, FMOD_MEMORY_ALLOC_CALLBACK useralloc, FMOD_MEMORY_REALLOC_CALLBACK userrealloc, FMOD_MEMORY_FREE_CALLBACK userfree, FMOD_MEMORY_TYPE memtypeflags = FMOD_MEMORY_ALL);
// FMOD_RESULT Memory_GetStats(int* currentalloced, int* maxalloced, bool blocking = true);

EXT double FML_Debug_Initialize(double flags, double mode, const char* filename);

// FMOD_RESULT File_SetDiskBusy(int busy);
// FMOD_RESULT File_GetDiskBusy(int* busy);
// FMOD_RESULT Thread_SetAttributes(FMOD_THREAD_TYPE type, FMOD_THREAD_AFFINITY affinity = FMOD_THREAD_AFFINITY_GROUP_DEFAULT, FMOD_THREAD_PRIORITY priority = FMOD_THREAD_PRIORITY_DEFAULT, FMOD_THREAD_STACK_SIZE stacksize = FMOD_THREAD_STACK_SIZE_DEFAULT);
