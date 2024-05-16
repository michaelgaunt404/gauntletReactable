#' Define column widths for attributes in a reactable table
#'
#' This function allows you to define column widths for different attributes in a reactable table.
#'
#' @param cols A character vector specifying the attributes for which column widths are defined.
#' @param minWidth Minimum width for the columns. Default is NA.
#' @param maxWidth Maximum width for the columns. Default is NA.
#' @param width Width for the columns. Default is NA.
#' @param wrap Logical indicating whether to wrap text in the columns. Default is FALSE.
#'
#' @return A list of column definitions for the specified attributes, with width settings applied.
#'
#' @examples
#'
#' rownames_to_column("cars") %>%
#'   reactable(
#'     defaultColDef = colDef(footerStyle = list(fontWeight = "bold")),
#'     groupBy = "cars",
#'     columns = combined_named_lists(
#'       colDef_colWidth_robust(cols = c("cars", "mpg"), minWidth = 400)
#'       # ,colDef_hide(cols = c("vs", "am", "gear", "carb", "wt"))
#'     )
#'   )
#'
#' @export
colDef_colWidth_robust = function (cols, minWidth = NA, maxWidth = NA, width = NA, wrap = F)
{
  tmp_coldef = reactable::colDef()

  if(!is.na(minWidth)){tmp_coldef$minWidth = minWidth}
  if(!is.na(maxWidth)){tmp_coldef$maxWidth = maxWidth}
  if(!is.na(width)){tmp_coldef$width = width}

  list_of_colDefs <- lapply(cols, function(col) {
    return(tmp_coldef)
  })
  named_list_of_colDefs <- setNames(list_of_colDefs, cols)
}



