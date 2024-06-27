#' Generate column definitions with filter sliders for specified columns in a Reactable table
#'
#' The \code{colDef_filter_slider} function generates column definitions with filter sliders
#' for specified columns in a Reactable table. It creates column definitions based on provided column
#' names and a unique ID for the Reactable table.
#'
#' @param cols A character vector specifying the column names for which the filter sliders
#'             column definitions are to be generated.
#' @param id A character string specifying the unique ID for the Reactable table. This ID should be
#'           specified both in the function call and in the Reactable table definition using the
#'           `elementId` parameter and setting `filterable = TRUE`.
#' @return A list of column definitions suitable for use in a Reactable table with filter sliders.
#' @export
#' @examples
#'
#' # Set the unique ID for the Reactable table
#' id <- "temp_id"
#'
#' mtcars %>%
#'   rownames_to_column("cars") %>%
#'   select(cars:disp) %>%
#'   reactable(
#'     defaultColDef = colDef(footerStyle = list(fontWeight = "bold")),
#'     columns = combined_named_lists(
#'       colDef_filter_slider(cols = c("disp"), id = id)
#'     ),
#'     elementId = id, filterable = TRUE
#'   )
colDef_filter_slider <- function (cols, id) {

  tmp_coldef = reactable::colDef(
    filterable = T
    ,filterMethod = htmlwidgets::JS("function(rows, columnId, filterValue) {
        return rows.filter(function(row) {
          return row.values[columnId] >= filterValue
        })
      }")
    ,filterInput = function(values, name) {
      oninput <- sprintf(stringr::str_glue("Reactable.setFilter('{id}', '%s', this.value)"), name)
      htmltools::tags$input(
        type = "range",
        min = floor(min(values)),
        max = ceiling(max(values)),
        value = floor(min(values)),
        oninput = oninput,
        onchange = oninput, # For IE11 support
        "aria-label" = sprintf("Filter by minimum %s", name)
      )
    }


  )

  list_of_colDefs <- lapply(cols, function(col) {
    return(tmp_coldef)
  })

  named_list_of_colDefs <- setNames(list_of_colDefs, cols)
}















