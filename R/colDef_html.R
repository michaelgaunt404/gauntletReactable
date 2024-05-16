colDef_html = function (cols) {

  tmp_coldef = colDef(html = T)

  list_of_colDefs <- lapply(cols, function(col) {
    return(tmp_coldef)
  })

  named_list_of_colDefs <- setNames(list_of_colDefs, cols)
}








