

* Kristoffer root path
if "`c(username)'" == "wb462869" {
global clone "C:\Users\wb462869\github\doctools"
}

* Update your root path
di "`c(username)'"
if "`c(username)'" == "" {
global clone "" // add root path to clone here
}


global stata_doctools "${clone}/stata-doctools"

global src_files       "${stata_doctools}/source-files"
global src_md          "${src_files}/markdown"
global src_adomd       "${src_files}/markdownado"
global src_smcl        "${src_files}/smcl"

global web_outlet      "${stata_doctools}/web-outlet"

global hlp_outlet      "${stata_doctools}/sthlp-outlet"
global hlp_mkd_mdsmcl  "${hlp_outlet}/markdoc-md2smcl"
global hlp_mkd_adosmcl "${hlp_outlet}/markdoc-ado2smcl"
