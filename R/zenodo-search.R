# Zenodo extraction functions ---------------------------------------------

#' Prepare search terms for use with Zenodo.
#'
#' @param search_terms The search terms defined in `R/search-terms.R`.
#'
#' @return A character vector.
#'
zenodo_prep_search_terms <- function(search_terms) {
  # Zenodo specific limiters
  limiters <- "
    (access_right:open) AND
    (
        resource_type.type:publication
        resource_type.type:poster
        resource_type.type:presentation
        resource_type.type:lesson
        resource_type.type:other
    )
    "

  # For some reason Zenodo doesn't accept this publication_date query in the API.
  # Need to filter after retrieving from Zenodo.
  # five_years_to_today <- glue("publication_date:[{five_years_ago} TO {today()}]")

  # Structured search term to fit Zenodo requirements
  glue::glue("{search_terms} AND {limiters}") %>%
    stringr::str_remove_all("\\n+") %>%
    stringr::str_squish() %>%
    stringr::str_remove_all("OR ")
}

#' GET records from Zenodo based on the search terms provided.
#'
#' @param search_terms Search terms to use for Zenodo.
#'
#' @return A list of records.
#'
zenodo_get_records <- function(search_terms) {
  # Requires token (PAT) from Zenodo to work
  zenodo <- zen4R::ZenodoManager$new(
    url = "https://zenodo.org/api",
    logger = NULL,
    # logger = "DEBUG",
    token = Sys.getenv("ZENODO_PAT")
  )
  zenodo$getRecords(q = search_terms, size = 1000)
  # To export an individual entry as JSON, with all information retreived.
  # zenodo_records[[1]]$exportAsJSON(filename = here::here("data-raw/zenodo-entry-1"))
}

#' Extract only the relevant data from the Zenodo API GET call.
#'
#' @param record_list List output from zen4R `getRecords()`.
#'
#' @return A list of records.
#'
zenodo_extract_relevant_data <- function(record_list) {
  creators <- record_list$metadata$creators %>%
    purrr::map_chr(~ .x$name) %>%
    stringr::str_flatten(" and ") %>%
    stringr::str_trim()

  keywords <- record_list$metadata$keywords %>%
    stringr::str_flatten("; ") %>%
    stringr::str_trim()

  list(
    # creators = creators,
    title = record_list$metadata$title,
    # description = record_list$metadata$description,
    date = record_list$metadata$publication_date,
    type = record_list$metadata$upload_type,
    keywords = keywords,
    doi = record_list$links$doi
  )
}

#' Retrieve records from Zenodo in the last 5 years.
#'
#' @param search_terms Search terms to use for Zenodo.
#'
#' @return A list of records.
#'
zenodo_retrieve_records <- function(search_terms) {
  zenodo_records <- search_terms %>%
    zenodo_prep_search_terms() %>%
    zenodo_get_records()

  # Extract necessary data and keep only last five years
  zenodo_records_processed <- zenodo_records %>%
    purrr::map(zenodo_extract_relevant_data) %>%
    purrr::keep(~ lubridate::ymd(lubridate::as_date(.x$date)) >= five_years_ago())

  # There's less entries from the original
  cli::cli_inform(c("Records from Zenodo",
    "i" = "{length(zenodo_records)} records were retrieved.",
    "i" = "{length(zenodo_records_processed)} records are within 5 years."
  ))

  zenodo_records_processed
}

# Post-processing and selection -------------------------------------------


