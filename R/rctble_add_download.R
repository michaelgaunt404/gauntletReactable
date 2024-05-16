rctble_add_download = function (object, id)
{
  object$elementId = id
  # object$x$tag$attribs$bordered = T
  # object$x$tag$attribs$highlight = T
  # object$x$tag$attribs$striped = T
  temp = htmltools::browsable(
    htmltools::tagList(

      htmltools::tags$button(
        style = css(
          width = "250px"
        )

        ,htmltools::tagList(
          fontawesome::fa("download")
          ,"Download as CSV")
        ,onclick = stringr::str_glue("Reactable.downloadDataCSV('{id}', '{id}_{gauntlet::strg_clean_date()}.csv')"))
      ,object))
  return(temp)
}
