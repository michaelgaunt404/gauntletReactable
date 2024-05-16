#' Generate column definitions for hyperlinked URLs
#'
#' The \code{colDef_urlLink} function generates column definitions for hyperlinked URLs
#' in a Reactable table. It creates column definitions based on provided column names and
#' a text to display as the link.
#'
#' @param cols A character vector specifying the column names for which the hyperlink column definitions are to be generated.
#' @param link_text A character string specifying the text to be displayed as the link.
#' @return A list of column definitions suitable for use in a Reactable table.
#' @export
#' @examples
#'
#' mtcars %>%
#'   mutate(url_raw = "www.google.com",
#'          url_names = rownames(.)) %>%
#'   remove_rownames() %>%
#'   reactable(
#'     defaultColDef = colDef(footerStyle = list(fontWeight = "bold")),
#'     columns = combined_named_lists(
#'       colDef_urlLink(cols = "url_raw", link_text = "Example text to link")
#'     )
#'   )
#'
colDef_urlLink <- function(cols, link_text){
  tmp_coldef = colDef(cell = function(value, index) {
    htmltools::tags$a(href = value, target = "_blank", as.character(link_text))
  })

  list_of_colDefs <- lapply(cols, function(col) {
    return(tmp_coldef)
  })

  named_list_of_colDefs <- setNames(list_of_colDefs, cols)
}
