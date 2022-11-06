
#macro __TESTS_FILE_MASTER_STRINGS_BANK (working_directory + "fmodbanks/desktop/master.strings.bank")
#macro __TESTS_FILE_MASTER_BANK (working_directory + "fmodbanks/desktop/master.bank")
#macro __TESTS_FILE_EMPTY_BANK (working_directory + "fmodbanks/desktop/empty.bank")

/// @param {FmlError} error
/// @param {int} studio_init_flags = FMOD_STUDIO_INIT_NORMAL
/// @param {int} core_init_flags = FMOD_INIT_NORMAL
/// @returns {FmodStudioSystem}
function __tests_create_system(error, studio_init_flags = FMOD_STUDIO_INIT_NORMAL, core_init_flags = FMOD_INIT_NORMAL)
{
    var sys = FmodStudioSystem_Create();
    sys.initialize(1024, studio_init_flags, core_init_flags, error);
    sys.load_bank_file(__TESTS_FILE_MASTER_STRINGS_BANK, FMOD_STUDIO_LOAD_BANK_NORMAL);
    sys.load_bank_file(__TESTS_FILE_MASTER_BANK, FMOD_STUDIO_LOAD_BANK_NORMAL);
    return sys;
}
