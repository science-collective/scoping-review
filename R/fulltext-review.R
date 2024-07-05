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

    ## General themes

    ::: content-hidden
    Look for what the paper is generally about and some basic overall themes and
    topics in the paper.
    :::

    ## Type of paper

    ::: content-hidden
    Is it a guide, community-building, an example of a workflow, etc.
    :::

    ## Other notes

    ::: content-hidden
    What we found was interesting or what we'd like to share, discuss, or
    present in the main scoping review paper.
    :::


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
