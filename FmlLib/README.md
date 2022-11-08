
# `/FmlLib`

Because of limitations with the GameMaker extension system, an extension cannot directly interface with the FMOD library. This is why this FmlLib library has to exist as a middleware between the FML GameMaker extension and the FMOD library.

FmlLib is written in C++ and it creates a shared library (.dll, .so etc. depending on the platform) that directly interfaces with the FMOD C++ shared libraries. The functions provided by the FmlLib shared library are designed so that a GameMaker extension can interace with it, i.e. its function signatures use only strings and doubles etc.

FmlLib depends on FMOD libraries, but those libraries are not directly included in it. Instead you need to download them from [fmod.com](https://www.fmod.com) and point to them when building FmlLib. FmlLib is built using [CMake](https://cmake.org/), and you need to define the following cache variables:

| Variable           | Value | Description |
| -                  | -     | - |
| FML_FMOD_DIRECTORY | String | An absolute path to the root of the FMOD library you've downloaded. |
| FML_IS_UBUNTU      | ON/OFF | A flag to indicate whether you're building for the Ubuntu platform (otherwise it's Windows). |

The binaries of the official releases of FML (v1.0.0) are built with Visual Studio Community 2019 amd64 for Windows and GCC 9.4.0 x86_64 for Ubuntu.
