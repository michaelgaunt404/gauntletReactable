rctble_format_table = function(rctble_object
                               ,compact = T
                               ,defaultPageSize = 1000
                               ,highlight = T
                               ,filterable = T
                               ,fullWidth = T
                               ,striped = T
                               ,resizable = T){

  rctble_object$x$tag$attribs$compact = compact
  rctble_object$x$tag$attribs$defaultPageSize = defaultPageSize
  rctble_object$x$tag$attribs$highlight = highlight
  rctble_object$x$tag$attribs$filterable = filterable
  rctble_object$x$tag$attribs$fullWidth = fullWidth
  # rctble_object$x$tag$attribs$wrap = wrap #needs to be issued in reactable() function
  rctble_object$x$tag$attribs$striped = striped
  rctble_object$x$tag$attribs$resizable = resizable

  return(rctble_object)

}
