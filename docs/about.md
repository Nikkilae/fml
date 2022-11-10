
## What

**FML** is a [GameMaker](https://gamemaker.io) extension that provides GML bindings to the [FMOD](https://www.fmod.com/) API.

FML provides most of the bindings for the [FMOD Studio API](https://www.fmod.com/docs/2.02/api/studio-guide.html), and only a small section of bindings for the [FMOD Core API](https://www.fmod.com/docs/2.02/api/core-guide.html).

The FML API is intended to be a one-to-one reflection of the FMOD API in terms of level of abstraction. In practice this means that for each FMOD API function there is an FML function that calls the corresponding FMOD API function and not much else.

The design of the FML API is based mostly on the C++ FMOD API but is of course technically much different as it's a GML library, and thus it also has to take some creative liberty in some of its API design to make it more idiomatic to GML. Still, for the most part, it reflects the C++ FMOD API to an extent where if you're familiar with the C++ FMOD API (or almost any of the other language APIs), you should find the FML API easy to get around too.

## About this documentation

Because FML is a set of one-to-one bindings to the FMOD API, this documentation of the FML extension doesn't document each of its functions in depth. You'll find that sort of documentation in the [official FMOD API documentation](https://www.fmod.com/resources/documentation-api) instead. Similarly, this documentation won't teach you how to use FMOD in the first place.

If you're looking for documentation on the source code of the FML extension itself, see the [repository documentation](https://github.com/Nikkilae/fml/blob/main/repo_docs.md).

What this documentation *will* tell you:
* How to [install FML](/guide) into your GameMaker project and start using it.
* The [full list of functions](/ref) of the FML API.

## State of development

The primary goal of FML is to implement bindings for all or almost all of [FMOD Studio API](https://www.fmod.com/resources/documentation-api?version=2.02&page=studio-guide.html). This goal has mostly been reached as FML now provides bindings for all but a few FMOD Studio API functions.

The [FMOD Core API](https://www.fmod.com/resources/documentation-api?version=2.02&page=core-guide.html) on the other hand is only a secondary goal and it's likely never going to be fully implemented, but a small section of that is also already supported.

Currently the only supported platforms of FML are Windows and Ubuntu. FMOD itself would support a number of other platforms as well, so it's possible to make FML support those too, but doing that would require *effort* and *resources* so whether or not those platforms will happen is hard to say.

The present and future feature set of FML is largely based on its [current developer's](https://riuku.net/) needs in their own projects. That being said, don't hesitate to [suggest a feature](https://github.com/Nikkilae/fml/issues) yourself.

| Platform | Supported? |
| - | - |
| Windows | ✔️ **yes** (VM & YYC, x64 only) |
| Ubuntu | ✔️ **yes** (VM & YYC) |
| HTML5 | ❌ **no** but I might look into it |
| Mobile | ❌ **no** |
| macOS | ❌ **no** but I'd like to do this, but I don't have a mac so I can't |
| Opera GX | ❌ **no** and I don't yet understand that platform enough to say if this is possible |
| Consoles | ❌ **no** but I'd like to do those as soon as I get my hands on some dev kits |

## Licensing

FML is licensed under the [MIT License](https://github.com/Nikkilae/fml/blob/main/LICENSE). *(it's one of those "do whatever you like" licenses)*

The extension comes with FMOD libraries which are not under the MIT license of FML. Please refer to [FMOD's website](https://www.fmod.com/licensing) for its licensing.

> **Can I use this in commercial projects?**
> 
> Yes. FML itself does not have any constraints when it comes to using it in any project, free or commercial. However, when using FML, you're inevitably also using FMOD, which has [licensing of its own](https://www.fmod.com/licensing) which you will need to read. I won't explain FMOD's licensing in detail here, but basically it's free for small budget games but not free for bigger budget games. Read their licensing!

If you use FML in your project, you're not obligated to give credit at all (except maybe to FMOD themselves!), but it would be cool if you did mention Riuku somewhere in there! Whether or not you do, I'd love to just hear about projects that use the extension, so if you do use it, feel free to [tell me about it](https://riuku.net/contact)!

## Support

Got a feature request, a bug report or a question? Use the Issues page: [github.com/Nikkilae/fml/issues](https://github.com/Nikkilae/fml/issues)
