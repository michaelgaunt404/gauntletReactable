#' Generate sticky column definitions for a Reactable table
#'
#' The \code{colDef_sticky} function generates column definitions with sticky behavior
#' for a Reactable table. It creates column definitions based on provided column names
#' and the side to which the columns should stick.
#'
#' @param cols A character vector specifying the column names for which the sticky column definitions are to be generated.
#' @param side A character string specifying the side to which the columns should stick. Default is "left".
#' @return A list of column definitions suitable for use in a Reactable table.
#' @export
#' @examples
#' library(reactable)
#' library(dplyr)
#'
#' mtcars %>%
#'   rownames_to_column("cars") %>%
#'   reactable(
#'     defaultColDef = colDef(footerStyle = list(fontWeight = "bold")),
#'     columns = combined_named_lists(
#'       colDef_sticky(cols = c("cars", "mpg"))
#'     )
#'   )
#'
#' # This example creates a Reactable table with sticky columns
#' # using the \code{colDef_sticky} function.
colDef_sticky <- function(cols, side = "left"){

  tmp_coldef = colDef(sticky = side
                      ,style = list(borderLeft = "1px solid #eee")
                      ,headerStyle = list(borderLeft = "1px solid #eee"))

  list_of_colDefs <- lapply(cols, function(col) {
    return(tmp_coldef)
  })

  named_list_of_colDefs <- setNames(list_of_colDefs, cols)
}




