
# `/FmlYy`

This is a GameMaker project where the FML extension is created in and can be exported from. The local package exported from this project is the primary end product in an FML release.

Some files in this project are touched by [/fml-extension-generator](https://github.com/Nikkilae/fml/tree/main/fml-extension-generator). Namely, the generator fills the extension .yy file with all the provided function bindings.

The user documentation generator [/fml-docs-generator](https://github.com/Nikkilae/fml/tree/main/fml-docs-generator) reads some files of this project to auto-generate parts of the documentation.

The extension asset in this project contains the FMOD shared library dependencies (.dll, .so etc. depending on the platform). When updating FML to a new FMOD library version, these files need to be replaced by the new ones manually.

This GM project also contains automated tests that should be run before every release. They run automatically when you launch the game from the project.

## Creating a package

1) Open this project in GameMaker. As of writing (FML v1.0.0), the IDE version of the project is v2022.6.26.
2) Run the automated tests by simply launching the game. Make sure that there are no failed tests. Repeat this for all platforms you need to support.
3) Open "Tools -> Create Local Package"
4) Select the entire "Extensions" asset folder into the asset package and nothing else.
5) Enter package details as you wish and click OK.
