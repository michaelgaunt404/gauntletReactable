#' Reorder Vector to Move Null Values to End
#'
#' This function reorders a vector such that elements which are 'NULL', 'Null',
#' or 'null' appear at the end of the vector. It is used inside another
#' `colDef` function to help sort filter labels so that iterations of null
#' appear last in the filter drop-down.
#'
#' @param vec A character vector containing elements to be reordered.
#'
#' @return A reordered character vector with 'NULL', 'Null', and 'null' values at the end.
#'
#' @examples
#' vec <- c("A", "null", "B", "D")
#' new_vec <- colDef_filter_sort_labels(vec)
#' print(new_vec)
#'
#' @export
colDef_filter_sort_labels <- function(vec) {
  null_indices <- which(vec %in% c("NULL", "Null", "null"))
    non_null_indices <- which(!(vec %in% c("NULL", "Null", "null")))
  reordered_vec <- c(vec[non_null_indices], vec[null_indices])

  return(reordered_vec)
}

