path_reviewer_titles <- function(reviewers) {
  here::here("data/review/titles", reviewers) |>
    fs::path_ext_set("csv")
}

read_title_reviews <- function(path) {
  title_reviews <- path |>
    rlang::set_names(path) |>
    purrr::map(readr::read_csv)

  reviewers <- names(title_reviews) |>
    fs::path_file() |>
    fs::path_ext_remove() |>
    stringr::str_to_sentence()

  title_reviews |>
    rlang::set_names(reviewers)
}

get_agreed_on_titles <- function(title_list) {
  stopifnot(is.list(title_list))
  title_list |>
    purrr::reduce(\(df1, df2) {
      dplyr::inner_join(df1, df2, by = dplyr::join_by(id, title, publication_date, doi))
    })
}

get_disagreed_on_titles <- function(title_list, agreed_on_titles) {
  stopifnot(is.list(title_list))
  title_list |>
    purrr::map(\(df) dplyr::anti_join(df, agreed_on_titles, by = dplyr::join_by(id, title, publication_date, doi))) |>
    purrr::list_rbind() |>
    dplyr::distinct()
}

