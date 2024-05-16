colDef_colWidth_robust = function (cols, minWidth = NA, maxWidth = NA, width = NA, wrap = F)
{
  tmp_coldef = colDef()

  if(!is.na(minWidth)){tmp_coldef$minWidth = minWidth}
  if(!is.na(maxWidth)){tmp_coldef$maxWidth = maxWidth}
  if(!is.na(width)){tmp_coldef$width = width}

  list_of_colDefs <- lapply(cols, function(col) {
    return(tmp_coldef)
  })
  named_list_of_colDefs <- setNames(list_of_colDefs, cols)
}
