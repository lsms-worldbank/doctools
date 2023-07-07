# Tools to write Stata documentation in a modern way

## Objectives

1. **Document only once**
  * When writing commands, one should only need to write the documenation in one location. Let's call this location the documentation source location, and the files in it the documentation source files.
  * When preparing/rendering different documentation outlets, a script reads the source files and outputs files in the format and location that outlet requires. No manual steps may be required apart from running the script.

2. Two documentation outlets. Website and Stata help-files.  

  * **Website.** Intended to be a user-friendly web documentation similar to https://pkgdown.r-lib.org/index.html
    * Only updated when new versions of the packages are released and the code for the new feature is merged to `main`
    * Since this happens much less frequent than day-to-day, it is ok for this documentation outlet to use tools not native to Stata, such as RStudio

  * **Stata help-files.** Generate help-files in `.sthlp` format to include and disseminate in a Stata package, for example, through SSC.
    * As this is updated day-to-day while writing the command, it is important that one should not need specific software to write or render the documentation.
      * Option 1. This should be render in Stata (for example `smcl`)
      * Option 2. Be written in a format that should be quite readable in raw format and not need a rare setup or software to render (for example, `markdown`)

## Options

* Possible types of source file formats:
  * Inline documentation in ado-file (based on `roxygen2` style formatting, or docstrings)
  * `smcl` - Stata's native markup language
  * `markdown` - Ubiquitous easy-to-learn markup language
  * `rmarkdown` - R-specific extension of `markdown`


  | Source file format | Format exists                                     | Difficulty to learn to write                                                                                                    | Generate website outlets                                                                                                              | Generate sthlp outlets                                                                                                                |
  |--------------------|---------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------|
  | Ado-inline         | No. We need to decide on syntax and  write parser | Depends on what syntax and/or existing language we end up picking, as well as what requirements our parsers will end up having | Depends on the format the parser outputs. Most likely the parser will output an intermediate markdown file, so see steps for markdown | Depends on the format the parser outputs. Most likely the parser will output an intermediate markdown file, so see steps for markdown |
  | smcl               | yes                                               | Basics are easy, and useful for command outputs as well. Some features, such as tables, are hard.                              | Probably possible to convert to markdown. Then follow steps for markdown.                                                             | Minimal  - source files can be used for this outlet as is                                                                             |
  | markdown           | yes                                               | Easy to learn, and found everywhere.                                                                                           | Hopefully md files can be used in vignette pipelines as is. If so, then minimal. Otherwise some conversion to Rmd is needed.           | Possible to convert from markdown to smcl. We need to establish rules for what syntax to use                                          |
