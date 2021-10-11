#' @title R Markdown output formats Template
#' @importFrom rmarkdown render pdf_document
#' @param Rmd_file file name of R Markdown file
#' @param Bib_file file name of Bib file
#' @export
tsukuba_thesis  <- function(Rmd_file, Bib_file) {
  template_tex_file <- system.file("rmarkdown/templates/thesis_tsukubabp/resources/templete.tex",
                                   package = 'TsukubaRmdBP')
  format_pdf <- rmarkdown::pdf_document(latex_engine = "xelatex",
                                        template = template_tex_file,
                                        keep_tex = TRUE,
                                        toc = TRUE,
                                        toc_depth = 3,
                                        highlight = 'tango')
  format_pdf$inherits <- "pdf_document"
  format_pdf
}

