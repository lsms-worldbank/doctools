
# Notes `markdoc` - md -> sthlp

The `.stlhp` file [markdownado.sthlp](./markdownado.sthlp) is generated from the inline documentation in the file [markdownado.ado](../../source-files\markdownado\markdownado.ado) using `markdoc` specified like this:

```
markdoc "${src_adomd}/markdownado.ado", mini export(sthlp) replace
```
See [markdoc-ado2smcl.do](./markdoc-ado2smcl.do) for the full code. To run this file `markdoc` needs to be installed, but not any 3rd party extensions such as `pandoc`. Also, the main file [main.do](../../main.do) must be run first to load the folder globals.

It also works to convert the documentation in `.ado` files to `markdown` files. To convert the inline documentation to both `stlhp` and `markdown` one would run:

```
markdoc "${src_adomd}/markdownado.ado", mini export(sthlp) replace
markdoc "${src_adomd}/markdownado.ado", mini export(md) replace
```

## Syntax

**Simplest syntax**: Anything included in these tags below are included in the do-file.

```
/***
  <HELPFILE>
***/
  <STATA PROGRAM CODE>
```

**Mixed syntax**: You can mix documentation and syntax documentation.

```
/***

---
Documentation for **markdownado**
---

***/

cap program drop   markdownado
    program define markdownado

/***

**Title**
**markdownado** - This command is used for short description.

***/

syntax, mdhlp(string) sthlp(string) [debug]

/***
**Syntax**
**markdownado**  , **mdhlp(**_string_**)**  **sthlp(**_string_**)**

***/

```

#### One potential bug

The tag `/***` might not be working without error. It is not uncommon for Stata users to make comment titles like this:

```
/**********************************
  Part 1 test input
**********************************/
```

The parser of `markdoc` recognizes that the first 4 characters on the first row to be `/***` which is the start tag of the docstring. However, on the last row,
the first 4 characters is `****` that is not the end tag of the docstring. Then the code that comes after that line will be interpreted as part of the helpfile.

## kbjarkefur's subjective take-away

While this works, I do not think the cost justify the benefits given Stata's hlepfile structure and that Stata commands are programs and not objects with methods.

**Conversion is needed before rendering:** No tool renders documentation in `ado`. This means that the documentation need to be extracted and converted before it is rendered. For example to using `markdoc` to convert to `markdown` and render in text editor, or to `sthlp` and use Stata viewer. Regardless of which it adds a step to view when developing.

**Readability simple syntax:** Inline documentation is commonly used in R (roxygen2) and Python (docstrings) to write documentation. It is true that conversion is needed before rendering there as well. However, packages in R and Pythion are object with methods (generic names not sure exactly those names are used in R).

When writing many small methods that is combined into a single class/package, then it makes sense to have the documentation next to the code. Methods tend to solve a small task. This means that the code and the documentation is often that short that that you can have both on the screen at the same time. (Many exceptions exits.)

In Stata we write programs and not methods. There are sub-programs in an ado-file but they are not methods. Methods are most of the time intended to be used by the users (there are private methods that are not). But sub-programs are never intended to be used directly by the users. In fact, the main functionality of the ado format is to make sure all sub-programs cannot be used by users.

Therefore, all documentation in a Stata command describes how to use the main program. There for the segment of code describing how to use the main program is long. (`markdoc.ado`'s documentation is the first 450 [lines](https://github.com/haghish/markdoc/blob/d949731ac730a66252a45d3a106500c8f3178225/markdoc.ado#L4-L467)). You don't get the benefit of viewing code and documentation at the same time.

You can of course have the .ado file open in two windows/panes in your text editor. But that is even easier in two separate files.

**Readability mixed syntax:** `markdoc` use what I above call the simple syntax where code and documentation is separated. One could use what I call the mixed syntax. However, I do not know how one would mix the syntax as the flow of a program does not match the flow of a Stata helpfile.

And it would require the users to keep track to start and end tags `/*** ***/`. And I think that risk being a source of error that slows development down.

Furthermore, a user not familiar with inline documentation, for example through rocygen2 or docstrings, will have a harder time following it.

**Conclusion:** `markdoc` is a great tool, and I think we should use it to convert `md` to `sthlp`. But I think that writing the documentation inside the `ado` file are adding a lot of complexity and sources of errors without me not really seeing any benefits to it.



## Remarks

  * Does not work if the `.ado` file is in a folder that includes `-in-` in the folder name as it breaks the file path in `markdoc` on [this line](https://github.com/haghish/markdoc/blob/d949731ac730a66252a45d3a106500c8f3178225/markdoc.ado#L3496) as the file path is passed without `""`.
    * this might not be specific to using `.ado` paths as input.
  This does no
