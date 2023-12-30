
#' Get records from PubMed based on a search term.
#'
#' @param search_terms The full search terms to use, see `search_terms()`.
#'
#' @return List of PubMed records.
#'
pubmed_get_records <- function(search_terms) {
  article_ids <- easyPubMed::get_pubmed_ids(search_terms)
  articles <- easyPubMed::fetch_pubmed_data(article_ids,
    retmax = as.integer(article_ids$Count)
  )

  articles %>%
    xml2::read_xml() %>%
    xml2::xml_find_all(".//Article") %>%
    xml2::as_list()
}

#' Extract specific data from an individual PubMed Record.
#'
#' Use in combination with `purrr::map()`. See `pubmed_retrieve_records()`.
#'
#' @param record_list Individual record list.
#'
#' @return List with DOI, date, and article title.
#'
pubmed_extract_relevant_data <- function(record_list) {
  metadata <- record_list %>%
    purrr::keep_at(c("ArticleTitle", "ArticleDate", "ELocationID", "Journal"))
  article_date <- paste(
    metadata$ArticleDate$Year,
    metadata$ArticleDate$Month,
    metadata$ArticleDate$Day,
    sep = "-"
  )

  pub_date <- metadata$Journal$JournalIssue$PubDate
  pub_date <- paste(
    pub_date$Year,
    pub_date$Month,
    if (!is.null(pub_date$Day)) pub_date$Day[[1]] else "01",
    sep = "-"
  )

  # Keep either publication date or article date, sometimes there is one but not
  # the other
  date <- suppressWarnings(c(pub_date, article_date) %>%
    lubridate::as_date() %>%
    na.omit() %>%
    head(1))

  # Set any dates that don't exist to NA.
  date <- if (length(article_date)) article_date else NA

  tibble::tibble(
    doi = unlist(metadata$ELocationID),
    date = date,
    title = unlist(metadata$ArticleTitle) %>%
      drop_newlines() %>%
      stringr::str_flatten()
  )
}

#' Retrieve and process PubMed records from the last five years.
#'
#' @param search_terms Search terms to use. See `search_terms()`.
#'
#' @return List of processed records.
#'
pubmed_retrieve_records <- function(search_terms) {
  pubmed_records_processed <- search_terms %>%
    pubmed_get_records() %>%
    purrr::map(pubmed_extract_relevant_data) %>%
    purrr::list_rbind() |>
    dplyr::filter(is.na(date) | lubridate::ymd(date) >= five_years_ago()) |>
    dplyr::mutate(source = "pubmed")

  number_articles <- easyPubMed::get_pubmed_ids(search_terms)$Count

  cli::cli_inform(c("Records from PubMed",
    "i" = "{number_articles} records were retrieved.",
    "i" = "{nrow(pubmed_records_processed)} records are within 5 years."
  ))

  pubmed_records_processed
}
