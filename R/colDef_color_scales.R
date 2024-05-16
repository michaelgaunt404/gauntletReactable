colDef_colorScales = function(data, cols, colors = c("#15607A", "#FFFFFF", "#FA8C00"), rev = F){
  if(rev){colors = rev(colors)}

  tmp_coldef = colDef(
    style = reactablefmtr::color_scales(data, colors)
  )

  list_of_colDefs <- lapply(cols, function(col) {
    return(tmp_coldef)
  })

  named_list_of_colDefs <- setNames(list_of_colDefs, cols)
}

