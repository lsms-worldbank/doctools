    
    cd "${src_adomd}"
    
    * Generate the sthlp file from the markdown source
    markdoc "${src_adomd}/markdownado.ado", mini export(sthlp) replace

    * markdoc does not allow to specify a location for the output,
    * it will always save in the same file as the source file.
    * Copy stlhp file to output folder for this experiment,
    * and then delete the file where markdoc wrote it
    copy "${src_adomd}/markdownado.sthlp" "${hlp_mkd_adosmcl}/markdownado.sthlp", replace
    rm   "${src_adomd}/markdownado.sthlp"

    * Uncomment to open in viewer window automatia
    view "${hlp_mkd_adosmcl}/markdownado.sthlp"
