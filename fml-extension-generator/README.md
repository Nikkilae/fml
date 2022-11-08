
# `/fml-extension-generator`

A utility for generating the GameMaker extension .yy file automatically:

1) Reads and parses the list of extension functions from [FmlLib](https://github.com/Nikkilae/fml/tree/main/FmlLib).
2) Generates the extension .yy file in [FmlYy](https://github.com/Nikkilae/fml/tree/main/FmlYy) so that it defines the bindings to the ext functions in the FmlLib library.

This tool does not fully generate the extension .yy file from scratch. The .yy file needs to exist already, having most of it defined previously. This tool only replaces parts of it (the function bindings) and leaves the rest alone. A lot of assumptions about the format of the .yy file contents are made and hard coded into the program, which means that it might not work on extension .yy files created with some GameMaker versions.

After running this tool, you should to open the extension in GameMaker once, because doing that automatically finishes some .yy formatting stuff that GameMaker wants to do.

The batch file [run_extension_generator.bat](https://github.com/Nikkilae/fml/blob/main/run_extension_generator.bat) at the root of the repo can be used to easily compile and run this tool with the appropriate command line arguments etc.

A lot of configurations, file paths etc. are hard coded into the source code of this program. Consider this a script  tailored for this exact project rather than a general purpose program.

This is a [Rust](https://www.rust-lang.org/) program built with Cargo.
