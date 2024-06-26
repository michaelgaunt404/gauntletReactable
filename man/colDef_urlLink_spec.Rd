% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/colDef_urlLink_spec.R
\name{colDef_urlLink_spec}
\alias{colDef_urlLink_spec}
\title{colDef_urlLink_spec Function Documentation}
\usage{
colDef_urlLink_spec(cols, col_url, data)
}
\description{
Description:
  The colDef_urlLink_spec function is designed to generate column definitions for hyperlinked URLs in a Reactable table. It creates column definitions based on provided column names, a column containing URLs, and the dataset.
}
\details{
Usage:
  colDef_urlLink_spec(cols, col_url, data)

Parameters:
  - \code{cols}: A character vector specifying the column names for which column definitions need to be generated.
  - \code{col_url}: A character string specifying the name of the column containing URLs.
  - \code{data}: A data frame containing the dataset.

Details:
  This function generates column definitions for hyperlinked URLs in a Reactable table. It creates column definitions with HTML anchor tags (<a>) that link to the URLs provided in the specified column.

Examples:
  # Define a sample function call
  temp_df <- mtcars %>%
    dplyr::mutate(url_raw = "www.google.com",
                  url_names = rownames(.)) %>%
    tibble::remove_rownames()

  # Generate Reactable table with hyperlinked URLs
  temp_df %>%
    reactable::reactable(
      defaultColDef = colDef(footerStyle = list(fontWeight = "bold")),
      columns = combined_named_lists(
        colDef_urlLink_spec(cols = "url_names", col_url = "url_raw", data = temp_df)
      )
    )
}
