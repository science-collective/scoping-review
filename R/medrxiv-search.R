#' Get queried records based on search terms.
#'
#' @param search_terms Search terms, see `search_terms()`.
#'
#' @return A data frame.
#'
#' @examples
#' \dontrun{
#' # This takes a long time.
#' search_terms("medrxiv") |>
#'   medrxiv_get_records()
#' }
medrxiv_get_records <- function(search_terms) {
  # This particular function takes some time... But we get the latest data.
  # The `mx_snapshot()` function is supposed to have a quicker access, but it
  # is very outdated.
  today <- as.character(lubridate::today())
  medrxiv_data <- medrxivr::mx_api_content(
    from_date = five_years_ago(),
    to_date = today,
    server = "medrxiv"
  )

  medrxivr::mx_search(
    data = medrxiv_data,
    query = search_terms,
    from_date = five_years_ago(),
    to_date = today,
    auto_caps = TRUE
  )
}

#' Retrieve and process records from medRxiv.
#'
#' @inheritParams pubmed_retrieve_records
#'
#' @return A data frame.
#'
medrxiv_retrieve_records <- function(search_terms) {
  records_processed <- search_terms %>%
    medrxiv_get_records() %>%
    dplyr::select(doi, date, title) %>%
    # Keep only rows that have "open" in the title.
    dplyr::filter(stringr::str_detect(title, "[oO]pen"))

  number_articles <- nrow(records_processed)
  cli::cli_inform(c("Records from medRxiv",
    "i" = "{number_articles} records were retrieved and are within 5 years.",
  ))

 #Small addition to get the necessary columns in the same format as arxiv:
  
 records_processed_clean <- records_processed %>%
    dplyr::select(id, date, title, doi)
  
 colnames(records_processed_clean) <- c("id", "date", "title", "doi")
  
  records_processed_clean
}
