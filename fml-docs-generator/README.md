
# `/fml-docs-generator`

A utility to auto-generate parts of the user documentation:

1) Reads and parses [FmlYy](https://github.com/Nikkilae/fml/tree/main/FmlYy) for functions etc.
2) Generates documentation for the functions into [/docs](https://github.com/Nikkilae/fml/tree/main/docs) (API Reference)

The batch file [run_docs_generator.bat](https://github.com/Nikkilae/fml/blob/main/run_docs_generator.bat) at the root of the repo can be used to easily compile and run this tool with the appropriate command line arguments etc.

A lot of configurations, file paths etc. are hard coded into the source code of this program. Consider this a script  tailored for this exact project rather than a general purpose program.

This is a [Rust](https://www.rust-lang.org/) program built with Cargo.
