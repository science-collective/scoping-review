create_fulltext_review_template <- function(data, reviewers) {
  header <- c(
    "---",
    "title: 'Full Article Review'",
    "---",
    ""
  ) |>
    stringr::str_c(collapse = "\n")

  article_template <- "

    # {title}

    - File: {path}
    - DOI: {doi}
    - OpenAlex ID: {id}

    <!-- Write your notes down here -->

    "

  review_body <- data |>
    glue::glue_data(article_template) |>
    stringr::str_c(collapse = "\n")

  paths <- fs::path("doc/reviews/", reviewers) |>
    fs::path_ext_set("qmd")

  fs::dir_create(fs::path_dir(paths))

  purrr::walk(
    paths,
    \(path) write_lines(c(header, review_body), path)
  )
  paths
}
