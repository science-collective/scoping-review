path_reviewer_abstracts <- function(reviewers) {
  here::here("data/review/abstracts", reviewers) |>
    fs::path_ext_set("yaml")
}

read_abstract_yaml <- function(path) {
  path |>
    # There's a weird `|` at the start of each file
    readr::read_lines(skip = 1) |>
    yaml::yaml.load() |>
    purrr::map(tibble::as_tibble) |>
    purrr::list_rbind()
}

read_abstract_reviews <- function(path) {
  abstract_reviews <- path |>
    rlang::set_names(path) |>
    purrr::map(read_abstract_yaml)

  reviewers <- names(abstract_reviews) |>
    fs::path_file() |>
    fs::path_ext_remove() |>
    stringr::str_to_sentence()

  abstract_reviews |>
    rlang::set_names(reviewers)
}
