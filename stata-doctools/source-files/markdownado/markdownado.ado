
/***

---

Documentation for **markdownado**

---

**Title**

**markdownado** - This command is used for short description.

**Syntax**


**markdownado** using _path/to/file_ [if] [in] , **option1(**_variable_**)** [ **option2(**_string_**)** **option3(**_format_**)** ]


Optional description of otherwise potentially confusing non-standard items in syntax, such as _path/to/file_ or what variable is intended to be.


| option            | Description                                                       |
|-------------------|-------------------------------------------------------------------|
| **option1(**_variable_**)** | Short description of option1 and what _variable_ is intended to be. |
| **option2(**_string_**)**   | Short description of option2                                      |
| **option3(**_format_**)**   | Short description of option3                                      |

**Description**

Longer description of the intended use of the command and best practices related to the usage.

**Options**

Longer description (paragraph length) of all options, their intended use case and best practices related to them.

**option1(**_variable_**)** is used for xyz. Longer description (paragraph length) of all options, their intended use case and best practices related to them.

**Examples**

A couple of examples to help the user get started and a short explanation of each of them

**Feedback, bug reports and contributions**

**Authors**

***/


cap program drop   markdownado
    program define markdownado
  qui {

    syntax, mdhlp(string) sthlp(string) [debug]

    /***********************************************
    Standardize slashes in file paths
    ***********************************************/
    local mdhlpstd	= subinstr(`"`mdhlp'"',"\","/",.)
    local sthlpstd	= subinstr(`"`sthlp'"',"\","/",.)

    if !missing("`debug'")  noi di "db mdhlp: `mdhlp'"
    if !missing("`debug'")  noi di "db mdhlpstd: `mdhlpstd'"
    if !missing("`debug'")  noi di "db sthlp: `sthlp'"
    if !missing("`debug'")  noi di "db sthlpstd: `sthlpstd'"

    split_file_extentsion, file("file.ado")

end

/***

**Examples**

Here is some more documentation that might be for this sub-program that is not made availible outside the ado-file anyways

***/

* Splits a file name into its name and its extension
cap program drop 	split_file_extentsion
	program define	split_file_extentsion, rclass

	syntax, file(string)

	**Find the last . in the file path and find extension after it
  local dot_index = strpos(strreverse("`file'"),".")

	** Find file name and extension based on the last dot in the file
	local file_ext  = substr("`file'",-`dot_index',.)
  local file_name = substr("`file'",1,strlen("`file'")-`dot_index')

	return local file_ext "`file_ext'"
  return local file_name "`file_name'"

end
