
# Guide

This is a guide to get you started with using FML in GameMaker. You can find a minimal standalone [example project](https://github.com/Nikkilae/fml/tree/main/Example) in the repository, accompanied with a C++ pure FMOD equivalent example, which may help you get accustomed to the FML API's design in reference to the original FMOD C++ API. This guide will not follow that example project exactly, even if there are some common pieces of code in both.

## Installation

Download the extension from the project's GitHub [releases page](https://github.com/Nikkilae/fml/releases).

Import the .yymps you just downloaded into your GameMaker project by dragging it into the GameMaker IDE where you project is opened. When it asks you which assets to import, select everything. This .yymps extension contains everything you need to get it going, including the required FMOD libraries (.dll/.so/etc).

## Quick start

This section will show you how to get started with FML in your GameMaker project. This guide's intention is not to teach how to use FMOD, which is why we'll skip over some details about how FMOD itself works.

Before we start, let's define some prerequisites:

* You should have at least a very basic understanding of how FMOD Studio as well as the FMOD API works.
* You should have exported the banks of your FMOD Studio project and placed them somewhere where your GameMaker game may access them (for example in the project's included files).
* You should have imported FML into your GameMaker project (as instructed above).

Here's how to 1) create and initialize a system, 2) load some banks, and 3) load an event description:

```gml
// (this would be in e.g. a create event)

// 1) Create and initialize an FMOD Studio system.
system = FmodStudioSystem_Create(FMOD_VERSION);
system.initialize(1024, FMOD_STUDIO_INIT_NORMAL, FMOD_INIT_NORMAL);

// 2) Load the master strings bank and the master bank.
masterStringsBank = system.load_bank_file("Master.strings.bank", FMOD_STUDIO_LOAD_BANK_NORMAL);
masterBank = system.load_bank_file("Master.bank", FMOD_STUDIO_LOAD_BANK_NORMAL);

// 3) Load an event description.
example_event_description = system.get_event("event:/ExampleEvent");
```

Here's how to 1) update the system and 2) play the event we loaded previously:

```gml
// (this would be in e.g. a step event)

// 1) Update the system.
system.update();

if (keyboard_check_pressed(vk_space)) {
    // 2) Create an instance of the event description and play it.
    example_event_description.create_instance().start()
}
```

## Error handling

In the C++ FMOD API most functions return an `FMOD_RESULT` to show if the call succeeded or if there was an error. Functions that create or get an object return that object via an out pointer parameter. Because FML is a GML library, it doesn't have pointers or references like C++ does, so another convention was needed in its design.

First, for reference, here's the piece of code in C++ using the FMOD API that we'll then be replicating in GML with FML:

```cpp
/* --- C++ (using the FMOD API) --- */

// ... eventInstance is FMOD::Studio::EventInstance

FMOD_RESULT result = eventInstance->start();
if (result != FMOD_RESULT::FMOD_OK) {
    std::cout << FMOD_ErrorString(result) << std::endl;
}
```

In FML the `EventInstance.start` function does not return `FMOD_RESULT`. Instead it returns a boolean that's `true` if it succeeded or `false` if it failed. In case it failed, the error code can be found in the optional `FmlError error` parameter.

So in practice you have two alternative methods in how to detect an error. The first method is to check the return value:

```gml
var error = new FmlError();
var succeeded = event_instance.start(error);
if (!succeeded) {
    show_debug_message(error);
}
```

The second method is to check the value of the `FmlError` after the function call:

```gml
var error = new FmlError();
event_instance.start(error);
if (error.result != FML_RESULT.OK) {
    show_debug_message(error);
}
```

## Memory management

In the C++ FMOD API creating and freeing instances usually looks something like this:

```cpp
/* --- C++ (using the FMOD API) --- */

FMOD::Studio::EventInstance *eventInstance;
eventDescription->createInstance(&eventInstance);
// ... do stuff with eventInstance ...
eventInstance->release();
```

Most classes of the C++ FMOD API have an equivalent constructor in the FML library. A function that in the C++ FMOD library has an out pointer parameter for getting an instance, the FML equivalent returns the instance (a struct), which has a `.release()` method:

```gml
var event_instance = event_description.create_instance();
// ... do stuff with event_instance ...
event_instance.release();
```

The functions that create structs, as a convention, usually also have an out parameter that can be used to get the struct. This may be useful for example for optimization in case you're worried about allocating a lot of structs and instead would like to use a struct pool or something like that.

```gml
var event_instance = new FmodEventInstance();
event_description.create_instance(event_instance);
// ... do stuff with event_instance ...
event_instance.release();
```

Because in FML functions return the created structs and error handling is optional, you can chain functions calls like this:

```gml
// I live on the edge and I'm sure there are no errors to worry about:
system.get_event("event:/ExampleEvent").create_instance().start();
```
