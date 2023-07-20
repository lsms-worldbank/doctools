
# Notes `markdoc` - md -> sthlp

The `.stlhp` file [markdown-source-markdoc.sthlp](./markdown-source-markdoc.sthlp) is generated from the file [markdown-source-markdoc.md](../../source-files/markdown/markdown-source-markdoc.md) using `markdoc` specified like this:

```
markdoc "${src_md}/markdown-source-markdoc.md", mini export(sthlp) replace
```
See [markdoc-md2smcl.do](./markdoc-md2smcl.do) for the full code. To run this file `markdoc` needs to be installed, but not any 3rd party extensions such as `pandoc`. Also, the main file [main.do](../../main.do) must be run first to load the folder globals.

## Syntax rules:

| Syntax    | .sthlp render | Markdown render | comments |
| ---       | ---           | ---             | ---      |
| `_ _`     | italic        | italic          |          |
| `__ __`   | bold          | bold            |          |
| `** **`   | underlined    | bold            | Used for syntax abbreviation. For example, `**opt**ion(_string_)` where `opt` will be rendered underlined in `.sthlp` but rendered bolded the same was as in `__ __` in Markdown |
| `=======` | Title syntax. No indent, bold and underlined | Rendered as `#` level 1 heading | Great implementation |
| `` ` ` `` | Shown as in source | Rendered as code | Would be great if this renderd to `{inp}` in the `.sthlp` file |

## Remarks

  * formatting ``{opth option(format)}`` where "format" becomes a hyperlink to the help file for Stata's `format` is not possible
  * Width of first column in option table is hardcoded so it only fits option names up to 18 characters long. Note that includes the values passed in the option. Such as `option_name(variable)` which has length 21 is too long even though the name `option_name()` only has length 13.
