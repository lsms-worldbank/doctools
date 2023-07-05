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
