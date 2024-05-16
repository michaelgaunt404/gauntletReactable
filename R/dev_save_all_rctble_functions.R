colDef_sticky = function(cols, side = "left"){

  tmp_coldef = colDef(sticky = side
                      ,style = list(borderLeft = "1px solid #eee")
                      ,headerStyle = list(borderLeft = "1px solid #eee"))

  list_of_colDefs <- lapply(cols, function(col) {
    return(tmp_coldef)
  })

  named_list_of_colDefs <- setNames(list_of_colDefs, cols)
}

colDef_hide = function(cols){

  tmp_coldef = colDef(show = F)

  list_of_colDefs <- lapply(cols, function(col) {
    return(tmp_coldef)
  })

  named_list_of_colDefs <- setNames(list_of_colDefs, cols)
}

colDef_minwidth = function(cols, width){

  tmp_coldef = colDef(minWidth = width)

  list_of_colDefs <- lapply(cols, function(col) {
    return(tmp_coldef)
  })

  named_list_of_colDefs <- setNames(list_of_colDefs, cols)
}

colDef_agg = function(cols, rm_footer = T, agg_fun = "sum"){
  rctbl_colDef_summarize = colDef(aggregate = agg_fun
                                  ,format = colFormat(separators = TRUE)
                                  ,footer = function(values) sum(values, na.rm = T))

  list_of_colDefs <- lapply(cols, function(col) {
    return(rctbl_colDef_summarize)
  })

  if (rm_footer){
    list_of_colDefs = list_of_colDefs %>%
      map(~.x[names(.x) != "footer"])
  }

  named_list_of_colDefs <- setNames(list_of_colDefs, cols)
}

combined_named_lists = function(...){
  item_list = list(...)
  keys <- unique(unlist(map(item_list, names)))

  combined = keys %>%
    map(~{
      tmp = .x
      flatten(map(item_list, ~.x[[tmp]]))
    }) %>%
    setNames(., keys)

  return(combined)
}

rctble_add_download = function(object, item){
  object$elementId = stringr::str_glue("dlt_{item}")
  object$x$tag$attribs$bordered = T
  object$x$tag$attribs$highlight = T
  object$x$tag$attribs$striped = T

  temp = htmltools::browsable(
    htmltools::tagList(
      htmltools::tags$button(
        htmltools::tagList(fontawesome::fa("download"), "Download as CSV"),
        onclick = stringr::str_glue("Reactable.downloadDataCSV('dlt_{item}', '{item}_{gauntlet::strg_clean_date()}.csv')")
      ),
      object
    ))

  return(temp)
}
