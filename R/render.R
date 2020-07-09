#' Render NIBSC HTML report
#'
#' This function is called in the output of the YAML header of the .Rmd file used to generate the report
#' to specify the standard output desired as html
#'
#' @param ... Arguments to be passed to the function `[bookdown::html_document2]`
#'
#' @return A modified `html_document2` with specific parameters for NIBSC reports
#' @export
#'
#' @examples
#' \dontrun{
#'    output: nibscdoc::report_html
#' }
#' @import bookdown
report_html <- function(...){
  cssfile <- system.file("rmarkdown/templates/analysis-report-html/assets/nibsc.css",
                                     package="nibscdoc")
  templatefile <- system.file("rmarkdown/templates/analysis-report-html/assets/nibsc_template.html",
                              package="nibscdoc")
  renderfunction <- bookdown::html_document2(...,
    template = templatefile,
    css = cssfile,
    theme = "readable",
    highlight = "tango",
    toc = TRUE,
    toc_float = TRUE
  )

  ## base settings
  renderfunction$knitr$opts_chunk$message <- FALSE
  renderfunction$knitr$opts_chunk$error <- FALSE
  renderfunction$knitr$opts_chunk$warning <- FALSE
  renderfunction$knitr$opts_chunk$tidy <- TRUE
  renderfunction$knitr$opts_chunk$tidy.opts <- list(blank = FALSE)
  renderfunction$knitr$opts_chunk$cache <- TRUE
  renderfunction$knitr$opts_chunk$cache.lazy  <-  FALSE
  renderfunction$knitr$opts_chunk$echo  <-  FALSE
  renderfunction$knitr$opts_chunk$results  <-  'asis'
  renderfunction$knitr$opts_chunk$fig.wide <- TRUE
  renderfunction$knitr$opts_chunk$fig.align <- "center"
  renderfunction$knitr$opts_chunk$fig.path <- "figures/"
  renderfunction$knitr$opts_chunk$fig.pos <- "H"
  renderfunction$knitr$opts_chunk$out.width <- "100%"

  renderfunction
}


#' Render NIBSC Word report
#'
#' This function is called in the output of the YAML header of the .Rmd file used to generate the report
#' to specify the standard output desired as Word document
#'
#' @param ... Arguments to be passed to the function `[bookdown::word_document2]`
#'
#' @return A modified `word_document2` with specific parameters for NIBSC reports
#' @export
#'
#' @examples
#' \dontrun{
#'    output: nibscdoc::report_word
#' }
#' @import bookdown
report_word <- function(...){

  refdoc <- system.file("rmarkdown/templates/analysis-report-word/assets/nibsc_report_reference.docx",
                        package="nibscdoc")

  renderfunction <- bookdown::word_document2(reference_docx = refdoc, ...)

  ## base settings
  renderfunction$knitr$opts_chunk$message <- FALSE
  renderfunction$knitr$opts_chunk$error <- FALSE
  renderfunction$knitr$opts_chunk$warning <- FALSE
  renderfunction$knitr$opts_chunk$tidy <- TRUE
  renderfunction$knitr$opts_chunk$tidy.opts <- list(blank = FALSE)
  renderfunction$knitr$opts_chunk$cache <- TRUE
  renderfunction$knitr$opts_chunk$cache.lazy  <-  FALSE
  renderfunction$knitr$opts_chunk$echo  <-  FALSE
  renderfunction$knitr$opts_chunk$results  <-  'asis'
  renderfunction$knitr$opts_chunk$fig.wide <- TRUE
  renderfunction$knitr$opts_chunk$fig.align <- "center"
  renderfunction$knitr$opts_chunk$fig.path <- "figures/"
  renderfunction$knitr$opts_chunk$fig.pos <- "H"
  renderfunction$knitr$opts_chunk$out.width <- "100%"

  renderfunction

}


