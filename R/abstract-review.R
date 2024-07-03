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

get_agreed_on_abstracts <- function(abstract_list) {
  stopifnot(is.list(abstract_list))
  abstract_list |>
    purrr::reduce(\(df1, df2) {
      dplyr::inner_join(df1, df2, by = dplyr::join_by(id, title, publication_date, doi, abstract))
    })
}

get_disagreed_on_abstracts <- function(abstract_list, agreed_on_abstracts) {
  stopifnot(is.list(abstract_list))
  abstract_list |>
    purrr::map(\(df) dplyr::anti_join(df, agreed_on_abstracts,
      by = dplyr::join_by(id, title, publication_date, doi, abstract)
    )) |>
    purrr::list_rbind() |>
    dplyr::distinct()
}
