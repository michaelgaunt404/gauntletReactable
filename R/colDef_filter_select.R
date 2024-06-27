#' Generate column definitions with filter dropdown menus for specified columns in a Reactable table
#'
#' The \code{colDef_filter_select} function generates column definitions with filter dropdown menus
#' for specified columns in a Reactable table. It creates column definitions based on provided column
#' names and a unique ID for the Reactable table.
#'
#' @param cols A character vector specifying the column names for which the filter dropdown menus
#'             column definitions are to be generated.
#' @param id A character string specifying the unique ID for the Reactable table. This ID should be
#'           specified both in the function call and in the Reactable table definition using the
#'           `elementId` parameter and setting `filterable = TRUE`.
#' @return A list of column definitions suitable for use in a Reactable table with filter dropdown menus.
#' @export
#' @examples
#'
#' # Set the unique ID for the Reactable table
#' id <- "temp_id"
#'
#' mtcars %>%
#'   rownames_to_column("cars") %>%
#'   reactable(
#'     defaultColDef = colDef(footerStyle = list(fontWeight = "bold")),
#'     columns = combined_named_lists(
#'       colDef_filter_select(cols = c("cars"), id = id)
#'     ),
#'     elementId = id, filterable = TRUE
#'   )
colDef_filter_select <- function (cols, id, apply_sort = T) {

  tmp_coldef = reactable::colDef(
    filterInput = function(values, name) {

      if(apply_sort) {
        tmp_values = sort(unique(values)) %>% colDef_filter_sort_labels()} else {
          tmp_values = unique(values) %>%  colDef_filter_sort_labels()}

      htmltools::tags$select(
        onchange = sprintf(stringr::str_glue("Reactable.setFilter('{id}', '%s', event.target.value || undefined)"), name),
        htmltools::tags$option(value = "", "All"),
        lapply(
          tmp_values
          ,htmltools::tags$option),
        "aria-label" = sprintf("Filter %s", name),
        style = "width: 100%; height: 28px;"
      )
    }
  )

  list_of_colDefs <- lapply(cols, function(col) {
    return(tmp_coldef)
  })

  named_list_of_colDefs <- setNames(list_of_colDefs, cols)
}




























