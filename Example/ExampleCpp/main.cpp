
#include <iostream>

#include "fmod_studio.hpp"

void main()
{
    // Create and initialize an FMOD Studio system.
    FMOD::Studio::System *system;
    FMOD::Studio::System::create(&system);
    system->initialize(1024, FMOD_STUDIO_INIT_NORMAL, FMOD_INIT_NORMAL, nullptr);

    // Load the master strings bank and the master bank.
    FMOD::Studio::Bank *masterStringsBank;
    system->loadBankFile("Master.strings.bank", FMOD_STUDIO_LOAD_BANK_NORMAL, &masterStringsBank);
    FMOD::Studio::Bank *masterBank;
    system->loadBankFile("Master.bank", FMOD_STUDIO_LOAD_BANK_NORMAL, &masterBank);

    // Load an event, create an instance of it and start that instance (i.e. play it).
    FMOD::Studio::EventDescription *eventDescription;
    system->getEvent("event:/ExampleEvent", &eventDescription);
    FMOD::Studio::EventInstance *eventInstance;
    eventDescription->createInstance(&eventInstance);
    eventInstance->start();

    while (true) {
        // Update the system.
        system->update();
    }
}
