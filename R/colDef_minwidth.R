#' Generate column definitions with minimum width for specified columns in a Reactable table
#'
#' The \code{colDef_minwidth} function generates column definitions with a minimum width
#' for specified columns in a Reactable table. It creates column definitions based on
#' provided column names and the desired minimum width.
#'
#' @param cols A character vector specifying the column names for which the minimum width
#'             column definitions are to be generated.
#' @param width An integer specifying the minimum width for the specified columns.
#' @return A list of column definitions suitable for use in a Reactable table.
#' @export
#' @examples
#' mtcars %>%
#'   rownames_to_column("cars") %>%
#'   reactable(
#'     defaultColDef = colDef(footerStyle = list(fontWeight = "bold")),
#'     columns = combined_named_lists(
#'       colDef_minwidth(cols = c("mpg", "cyl"), width = 300)
#'     )
#'   )
colDef_minwidth <- function(cols, width){

  tmp_coldef = colDef(minWidth = width)

  list_of_colDefs <- lapply(cols, function(col) {
    return(tmp_coldef)
  })

  named_list_of_colDefs <- setNames(list_of_colDefs, cols)
}
