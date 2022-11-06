
# FML repository documentation

This repository consists of a few separate projects:

## [`/Example`](/Example)

A minimal example GameMaker project for using FML.

## [`/FmlLib`](/FmlLib)

A C++ project that creates the shared library (.dll/.so/etc) referred to by the FML GameMaker extension asset. FmlLib interfaces with the FMOD library.

## [`/FmlYy`](/FmlYy)

A GameMaker project where the FML extension is written. In this project there are also automated tests.

## [`/TestFmodStudioProject`](/TestFmodStudioProject)

An FMOD Studio project to create the banks used by the automated tests in [/FmlYy](/FmlYy).

## [`/docs`](/docs)

Source code of the [FML user documentation](https://nikkilae.github.io/fml), partially auto-generated by [/fml-docs-generator](/fml-docs-generator).

## [`/fml-docs-generator`](/fml-docs-generator)

A Rust project to generate parts of the user documentation in [/docs](/docs), particularly the API Reference parts. Reads and parses the [/FmlYy](/FmlYy) in order to generate the documentation.

## [`/fml-extension-generator`](/fml-extension-generator)

A Rust project to auto-generate parts of the extension in [/FmlYy](/FmlYy). Reads and parses [/FmlLib](/FmlLib) to find all the functions that are to be provided by the extension.