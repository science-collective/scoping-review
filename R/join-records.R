#' Join all the record data into one tibble from the file paths.
#'
#' @param paths The file paths to the records in `data-raw/`.
#'
#' @return A tibble.
#'
join_from_path <- function(paths) {
  purrr::map(paths, ~ readr::read_csv(.x)) |>
    purrr::list_rbind()
}
