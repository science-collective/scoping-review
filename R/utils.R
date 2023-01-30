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

#' A date range from today until 5 years ago.
#'
#' @return A character vector of a date range.
#'
five_years_ago <- function() {
  glue::glue("{lubridate::today()-lubridate::years(5)}")
}
