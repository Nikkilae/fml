
// Create and initialize an FMOD Studio system.
system = FmodStudioSystem_Create(FMOD_VERSION);
system.initialize(1024, FMOD_STUDIO_INIT_NORMAL, FMOD_INIT_NORMAL);

// Load the master strings bank and the master bank.
masterStringsBank = system.load_bank_file("Master.strings.bank", FMOD_STUDIO_LOAD_BANK_NORMAL);
masterBank = system.load_bank_file("Master.bank", FMOD_STUDIO_LOAD_BANK_NORMAL);

// Load an event, create an instance of it and start that instance (i.e. play it).
event_description = system.get_event("event:/ExampleEvent");
event_instance = event_description.create_instance();
event_instance.start();
