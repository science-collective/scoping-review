# Pubmed search using easypubmed

library(easyPubMed)
library(tidyverse)
library(here)
library(purrr)
library(readr)
library(xml2)
source(here("R/search-terms.R"))

## making a list with the search terms

pubmed_get_records <- function(search_terms) {
  article_ids <- easyPubMed::get_pubmed_ids(search_terms)
  articles <- easyPubMed::fetch_pubmed_data(article_ids,
    retmax = as.integer(article_ids$Count)
  )

  articles %>%
    xml2::read_xml() %>%
    xml2::xml_find_all(".//Article") %>%
    as_list()
}

pubmed_extract_relevant_data <- function(record_list) {
  metadata <- record_list %>%
    purrr::keep_at(c("ArticleTitle", "ArticleDate", "ELocationID"))
  date <- paste(
    metadata$ArticleDate$Year,
    metadata$ArticleDate$Month,
    metadata$ArticleDate$Day,
    sep = "-"
  )

  date <- ifelse(!rlang::is_empty(date), date, NA_character_)

  list(
    doi = unlist(metadata$ELocationID),
    date = date,
    title = unlist(metadata$ArticleTitle)
  )
}

pubmed_retrieve_records <- function(search_terms) {
  browser()
  pubmed_records_processed <- search_terms %>%
    pubmed_get_records() %>%
    purrr::map(pubmed_extract_relevant_data) %>%
    purrr::keep(~ {
      !is.na(.x$date) |
        lubridate::ymd(lubridate::as_date(.x$date)) >= five_years_ago()
    })

  number_articles <- easyPubMed::get_pubmed_ids(search_terms)$Count

  cli::cli_inform(c("Records from PubMed",
    "i" = "{number_articles} records were retrieved.",
    "i" = "{length(pubmed_records_processed)} records are within 5 years."
  ))

  pubmed_records_processed
}

# Extracting info and combining into single dataframe --------------------------

# Count number of papers -------------------------------------------------------

# 756 papers identified when copying the search on pubmed

# n_papers_web <- 756
# n_papers_r <- as.numeric(nrow(pubmed_df))
#
# search_the_same <- n_papers_web == n_papers_r
# search_the_same

search_terms("pubmed") %>%
  pubmed_retrieve_records()
