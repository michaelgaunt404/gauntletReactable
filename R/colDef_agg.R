#' Generate column definitions for aggregating specified columns by a specified metric in a Reactable table
#'
#' The \code{colDef_agg} function generates column definitions for aggregating specified columns
#' by a specified metric in a Reactable table. It creates column definitions based on provided column
#' names, a metric aggregation function, and whether to remove the footer from the column definitions.
#'
#' @param cols A character vector specifying the column names to be aggregated.
#' @param rm_footer A logical value indicating whether to remove the footer from the column definitions.
#'                  Default is \code{TRUE}.
#' @param agg_fun A character string specifying the aggregation function to be applied.
#'                Default is \code{"sum"}. Other possible values include functions available
#'                in the \code{dplyr} package such as \code{"mean"}, \code{"median"}, etc.
#' @return A list of column definitions suitable for use in a Reactable table with specified
#'         columns aggregated by the specified metric.
#'
#' @importFrom magrittr %>%
#'
#' @export
#' @examples
#'
#' library(dplyr)
#' library(tibble)
#' library(magrittr)
#' library(reactable)
#'
#' mtcars %>%
#'   rownames_to_column("cars") %>%
#'   mutate(cars = gsub(" .*", "\\1", cars)) %>%
#'   reactable(
#'     defaultColDef = colDef(footerStyle = list(fontWeight = "bold")),
#'     groupBy = "cars",
#'     columns = combined_named_lists(
#'       colDef_agg(cols = c("am", "gear", "carb"), agg_fun = "sum")
#'     )
#'   )
colDef_agg <- function(cols, rm_footer = TRUE, agg_fun = "sum"){
  rctbl_colDef_summarize = colDef(aggregate = agg_fun
                                  ,format = colFormat(separators = TRUE)
                                  ,footer = function(values) sum(values, na.rm = TRUE))

  list_of_colDefs <- lapply(cols, function(col) {
    return(rctbl_colDef_summarize)
  })

  if (rm_footer){
    list_of_colDefs <- lapply(list_of_colDefs, function(x) {
      x <- x[!names(x) %in% "footer"]
    })
  }

  named_list_of_colDefs <- setNames(list_of_colDefs, cols)
}
