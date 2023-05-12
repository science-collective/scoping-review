#' Save a list of records to CSV file.
#'
#' @param records_list A list to save as CSV.
#' @param path Path to save the records.
#'
#' @return Character for file path, side effect of saving a CSV file.
#'
save_list_as_csv <- function(records_list, path) {
  records_list |>
    dplyr::bind_rows() |>
    readr::write_csv(path)
  return(path)
}

#' Save a list object to a YAML file.
#'
#' @param records_list A list to save as YAML.
#' @param path Path to save the records.
#'
#' @return Character for file path, side effect of saving a YAML file.
#'
save_list_as_yaml <- function(records_list, path) {
  yaml::write_yaml(records_list, path)
  return(path)
}

#' Save a tibble to a CSV file.
#'
#' @param records_tbl A tibble to save to file.
#' @param path Path to save the records.
#'
#' @return Character for file path, side effect of saving a CSV file.
#'
save_as_csv <- function(records_list, path) {
  readr::write_csv(records_list, path)
  return(path)
}

#' A date range from today until 5 years ago.
#'
#' @return A character vector of a date range.
#'
five_years_ago <- function() {
  glue::glue("{lubridate::today()-lubridate::years(5)}")
}

#' Drop newlines characters and flatten to a single string.
#'
#' @param text Text to modify.
#'
#' @return Combined text.
#'
drop_newlines <- function(text) {
  text |>
    stringr::str_remove_all("\n") |>
    stringr::str_flatten(collapse = " ")
}
