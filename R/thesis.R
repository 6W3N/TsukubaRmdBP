#' #' @title R Markdown output formats Template for thesis at DepartmentBiological Program, Univ. Tsukuba
#' #' @importFrom rmarkdown render
#' #' @importFrom rmarkdown pdf_document
#' #' @importFrom jpaRmd jpa_cite
#' #' @param Rmd_file file name of R Markdown file
#' #' @param Bib_file file name of Bib file
#' #' @export
#' tsukuba_thesis  <- function(Rmd_file, Bib_file) {
#'   jpa_cite(Rmd_file, Bib_file)
#'   tmp_rmd <- paste0("tmp_", Rmd_file)
#'   template_tex_file <- system.file("rmarkdown/templates/thesis_tsukubabp/resources/template.tex",
#'                                    package = 'TsukubaRmdBP')
#'   format_pdf <- pdf_document(
#'     latex_engine = "xelatex",
#'     template = template_tex_file,
#'     keep_tex = TRUE,
#'     toc = TRUE,
#'     toc_depth = 3,
#'     highlight = "tango"
#'   )
#'   format_pdf$inherits <- "pdf_document"
#'   output_file <- strsplit(Rmd_file, ".Rmd")[[1]]
#'   render(tmp_rmd, format_pdf, output_file)
#' }

#' @title Helper function to package template 1
#' @export
pkg_file <- function(...) system.file(..., package = "rticles")

#' @title Helper function to package template 2
#' @export
pkg_file_template <- function(...) pkg_file("rmarkdown", "templates", ...)


#' @title Helper function to find resource
#' @export
find_resource <- function(template, file = 'template.tex') {
  res <- pkg_file_template(template, "resources", file)
  if (res == "") stop(
    "Couldn't find template file ", template, "/resources/", file, call. = FALSE
  )
  res
}

#' @title Helper function to create a custom format derived from pdf_document
#' @importFrom rmarkdown pdf_document
#' @export
pdf_document_format <- function(
  format, template = find_resource(format, 'template.tex'), ...
) {
  fmt <- rmarkdown::pdf_document(..., template = template)
  fmt$inherits <- "pdf_document"
  fmt
}

#' @title R Markdown output formats Template for thesis at DepartmentBiological Program, Univ. Tsukuba
#' @export
tsukuba_format <- function(..., keep_tex = TRUE, md_extensions = c("-autolink_bare_uris")) {
  pdf_document_format(
    "thesis_tsukubabp", keep_tex = keep_tex, md_extensions = md_extensions, ...
  )
}
