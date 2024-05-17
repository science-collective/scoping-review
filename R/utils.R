#' Save a tibble to a CSV file.
#'
#' @param data A tibble to save to file.
#' @param path Path to save the records.
#'
#' @return Character for file path, side effect of saving a CSV file.
#'
save_as_csv <- function(data, path) {
  readr::write_csv(data, path)
  return(path)
}

#' A date range from today until 5 years ago.
#'
#' @return A character vector of a date range.
#'
five_years_ago <- function() {
  # To make this accessible to the function below.
  `%m-%` <- lubridate::`%m-%`
  as.character(glue::glue("{lubridate::today() %m-% lubridate::years(5)}"))
}

#' Save a tibble to a YAML file.
#'
#' @param data The data to save.
#' @param path The output file path.
#'
#' @return A character vector with file path.
#'
save_as_yaml <- function(data, path) {
  data |>
    yaml::as.yaml(column.major = FALSE) |>
    yaml::write_yaml(path)
  return(path)
}

copy_if_not_exists <- function(path, copied_path) {
  if (!fs::file_exists(copied_path)) {
    fs::dir_create(fs::path_dir(copied_path), recurse = TRUE)
    fs::file_copy(path, copied_path)
  }
  copied_path
}
