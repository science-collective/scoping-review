#' Get queried records based on search terms for bioRxiv.
#'
#' @param inheritParams medrxiv_get_records
#'
#' @return A data frame.
#'
#' @examples
#' \dontrun{
#' # This takes a very long time.
#' search_terms("biorxiv") |>
#'   biorxiv_get_records()
#' }
biorxiv_get_records <- function(search_terms) {
  medrxiv_generic_get_records(
    search_terms = search_terms,
    server = "biorxiv"
  )
}

#' Retrieve and process records from bioRxiv.
#'
#' @inheritParams pubmed_retrieve_records
#'
#' @return A data frame.
#'
#' @examples
#' \dontrun{
#' # This takes a very long time.
#' search_terms("biorxiv") |>
#'   biorxiv_retrieve_records()
#' }
biorxiv_retrieve_records <- function(search_terms) {
  medrxiv_generic_retrieve_records(
    search_terms = search_terms,
    server = "biorxiv"
  )
}

#' Get queried records based on search terms for bioRxiv.
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
  medrxiv_generic_get_records(
    search_terms = search_terms,
    server = "medrxiv"
  )
}

#' Retrieve and process records from medRxiv.
#'
#' @inheritParams pubmed_retrieve_records
#'
#' @return A data frame.
#'
medrxiv_retrieve_records <- function(search_terms) {
  medrxiv_generic_retrieve_records(
    search_terms = search_terms,
    server = "medrxiv"
  )
}

# Generics ----------------------------------------------------------------

medrxiv_generic_get_records <- function(search_terms, server = c("biorxiv", "medrxiv")) {
  server <- rlang::arg_match(server)
  # This particular function takes some time... But we get the latest data.
  # The `mx_snapshot()` function is supposed to have a quicker access, but it
  # is very outdated.
  today <- as.character(lubridate::today())
  medrxiv_data <- medrxivr::mx_api_content(
    from_date = five_years_ago(),
    to_date = today,
    server = server
  )

  medrxivr::mx_search(
    data = medrxiv_data,
    query = search_terms,
    from_date = five_years_ago(),
    to_date = today,
    auto_caps = TRUE
  )
}

medrxiv_generic_retrieve_records <- function(search_terms, server = c("biorxiv", "medrxiv")) {
  server <- rlang::arg_match(server)
  get_records <- switch(
    server,
    medrxiv = medrxiv_get_records,
    biorxiv = biorxiv_get_records
  )
  records_processed <- search_terms %>%
    get_records() %>%
    dplyr::select(doi, date, title) %>%
    # Keep only rows that have "open" in the title.
    dplyr::filter(stringr::str_detect(title, "[oO]pen"))

  number_articles <- nrow(records_processed)
  cli::cli_inform(c("Records from {.val {server}}",
    "i" = "{number_articles} records were retrieved and are within 5 years."
  ))

  records_processed
}
