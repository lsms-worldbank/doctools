
# Notes `markdoc` - md -> sthlp

## Syntax rules:
  * `_italic_`
  * `__bold__`
  * ``**underlined**`` -> will be bold in markdown as there is no support for underline in Markdown unless you
  * `=======` on line after word makes a title. For example "Syntax", "Description", "Examples"


## Notes of things that does not work

  * formatting {opth option(format) not possible}
  * Width of first column in option table is hardcoded so it only fits option names up to 18 characters long. Note that includes the values passed in the option. Such as `option_name(variable)` which has length 21 is too long even though the name `option_name()` only has length 13.
