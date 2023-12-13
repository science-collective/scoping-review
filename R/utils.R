#' Save a tibble to a CSV file.
#'
#' @param records_tbl A tibble to save to file.
#' @param path Path to save the records.
#'
#' @return Character for file path, side effect of saving a CSV file.
#'
save_as_csv <- function(records_tbl, path) {
  readr::write_csv(records_tbl, path)
  return(path)
}

#' A date range from today until 5 years ago.
#'
#' @return A character vector of a date range.
#'
five_years_ago <- function() {
  as.character(glue::glue("{lubridate::today()-lubridate::years(5)}"))
}

#' Drop newlines characters and flatten to a single string.
#'
#' @param text Text to modify.
#'
#' @return Combined text.
#'
drop_newlines <- function(text) {
  text |>
    stringr::str_replace_all("\n", " ")
}
