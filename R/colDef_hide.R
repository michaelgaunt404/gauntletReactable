#' Generate column definitions to hide specified columns in a Reactable table
#'
#' The \code{colDef_hide} function generates column definitions to hide specified columns
#' in a Reactable table without removing them from the data frame object. It creates column
#' definitions based on provided column names.
#'
#' @param cols A character vector specifying the column names to be hidden.
#' @return A list of column definitions suitable for use in a Reactable table.
#' @export
#' @examples
#'
#' mtcars %>%
#'   rownames_to_column("cars") %>%
#'   reactable(
#'     defaultColDef = colDef(footerStyle = list(fontWeight = "bold")),
#'     columns = combined_named_lists(
#'       colDef_hide(cols = c("vs", "am", "gear", "carb", "wt"))
#'     )
#'   )
colDef_hide <- function(cols){

  tmp_coldef = reactable::colDef(show = F)

  list_of_colDefs <- lapply(cols, function(col) {
    return(tmp_coldef)
  })

  named_list_of_colDefs <- setNames(list_of_colDefs, cols)
}

