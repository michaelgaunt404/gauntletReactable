colDef_mailto = function(cols, col_email, data){

  tmp_coldef_cols = colDef(html = TRUE, cell = function(value, index) {
    sprintf('<a href="mailto:%s" target="_blank">%s</a>', data[[col_email]][index], value)
  })

  list_of_colDefs_cols <- lapply(cols, function(col) {return(tmp_coldef_cols)})

  named_list_of_colDefs_cols <- setNames(list_of_colDefs_cols, cols)

  # print(named_list_of_colDefs_cols)

  tmp_coldef_col_email = colDef(show = F, cell = function(value, index) {})

  list_of_colDefs_col_email <- lapply(col_email, function(col) {return(tmp_coldef_col_email)})

  named_list_of_colDefs_col_email <- setNames(list_of_colDefs_col_email, col_email)

  # print(named_list_of_colDefs_col_email)


  lists = c(
    named_list_of_colDefs_cols
    ,named_list_of_colDefs_col_email
    )


  return(lists)
}
