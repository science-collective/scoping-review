#' Get all records from arXiv.
#'
#' @param search_terms Search terms, see `search_terms()`.
#'
#' @return Dataframe of records.
#'
arxiv_get_records <- function(search_terms) {
  number_found <- aRxiv::arxiv_count(query = search_terms)
  records <- aRxiv::arxiv_search(
    query = search_terms,
    # Round to nearest tenth.
    limit = as.integer(round(number_found * 1.5, -2))
  )

  tibble::as_tibble(records)
}

#' Retrieve and process records from arXiv, within last 5 years.
#'
#' @param search_terms Search terms, see `search_terms()`.
#'
#' @return Data frame of records.
#'
#' @examples
#' search_terms("arxiv") |>
#'   arxiv_retrieve_records()
#'
arxiv_retrieve_records <- function(search_terms) {
  arxiv_records_processed <- search_terms %>%
    arxiv_get_records() %>%
    dplyr::select(id, date = updated, title, link_abstract) %>%
    dplyr::mutate(dplyr::across(dplyr::where(is.character), drop_newlines)) %>%
    dplyr::filter(lubridate::ymd(lubridate::as_date(date)) >= five_years_ago()) |>
    dplyr::mutate(source = "arxiv")

  number_articles <- aRxiv::arxiv_count(query = search_terms)

  cli::cli_inform(c("Records from arXiv",
    "i" = "{number_articles} records were retrieved.",
    "i" = "{nrow(arxiv_records_processed)} records are within 5 years."
  ))

  arxiv_records_processed
}
