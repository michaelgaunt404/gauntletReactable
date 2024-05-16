#' Specify column definitions for instances of many columns at once without specifying them individually
#'
#' The \code{rtrn_cols} function simplifies the process of specifying column definitions for instances
#' of many columns at once without specifying them individually. It takes a singular string input as the
#' source of column names, where the "|" operator signifies "or". If \code{exclude = TRUE}, it returns
#' all columns that are not specified in the input string.
#'
#' @param data The data frame from which column names are extracted.
#' @param words A singular string input containing column names, where "|" signifies "or".
#' @param pretty A logical value indicating whether to return the column names in a pretty format. Default is \code{FALSE}.
#' @param exclude A logical value indicating whether to exclude the specified columns. Default is \code{FALSE}.
#' @param sort A logical value indicating whether to sort the column names alphabetically. Default is \code{TRUE}.
#' @return A vector of column names specified by the input string.
#' @export
#' @examples
#'
#' # Create example data
#' temp_data <- mtcars %>%
#'   rownames_to_column("cars") %>%
#'   mutate(cars = gsub(" .*", "\\1", cars))
#'
#' print(rtrn_cols(data = temp_data, words = "cars", exclude = T))
#' print(rtrn_cols(data = temp_data, words = "cars", exclude = F))
#'
#' # Create a Reactable table with specified column definitions
#' temp_data %>%
#'   reactable(
#'     defaultColDef = colDef(footerStyle = list(fontWeight = "bold")),
#'     groupBy = "cars",
#'     columns = combined_named_lists(
#'       colDef_agg(cols = rtrn_cols(data = temp_data, words = "cars", exclude = TRUE)),
#'       colDef_hide(cols = rtrn_cols(data = temp_data, words = "gear|am", exclude = FALSE))
#'     )
#'   )
rtrn_cols <- function(data, words, pretty = FALSE, exclude = FALSE, sort = TRUE){

  colnames = colnames(data)

  if (!exclude){
    if (pretty){
      cols_index = colnames[str_detect(colnames, words)] %>%
        gauntlet::strg_pretty_char()
    } else {
      cols_index = colnames[str_detect(colnames, words)]
    }
  } else {
    if (pretty){
      cols_index = colnames[!str_detect(colnames, words)] %>%
        gauntlet::strg_pretty_char()
    } else {
      cols_index = colnames[!str_detect(colnames, words)]
    }
  }

  if (sort){cols_index = sort(cols_index)}

  return(cols_index)

}

