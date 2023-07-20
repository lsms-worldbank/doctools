
    local srcfile "markdown-source-markdoc"          // Ex: strictly use markdoc supported md syntax
    local srcfile "markdown-source-markdoc-mdsyntax" // Ex: test more types of md syntax


    * Generate the sthlp file from the markdown source
    markdoc "${src_md}/`srcfile'.md", mini export(sthlp) replace

    * markdoc does not allow to specify a location for the output,
    * it will always save in the same file as the source file.
    * Copy stlhp file to output folder for this experiment,
    * and then delete the file where markdoc wrote it
    copy "${src_md}/`srcfile'.sthlp" "${hlp_mkd_mdsmcl}/`srcfile'.sthlp", replace
    rm   "${src_md}/`srcfile'.sthlp"

    * Uncomment to open in viewer window automatia
    view "${hlp_mkd_mdsmcl}/`srcfile'.sthlp"
