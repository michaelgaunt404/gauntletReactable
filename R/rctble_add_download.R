rctble_add_download = function (object, id)
{
  object$elementId = id

  temp = htmltools::browsable(
    htmltools::tagList(

      htmltools::tags$button(
        style = htmltools::css(
          width = "250px"
        )

        ,htmltools::tagList(
          fontawesome::fa("download")
          ,"Download as CSV")
        ,onclick = stringr::str_glue("Reactable.downloadDataCSV('{id}', '{id}_{gauntlet::strg_clean_date()}.csv')"))
      ,object))
  return(temp)
}
