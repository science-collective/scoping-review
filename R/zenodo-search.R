# Zenodo extraction script

# Load packages -----------------------------------------------------------

library(zen4R)
library(lubridate)
library(glue)
library(stringr)
library(here)
library(tibble)
library(purrr)
source(here("R/search-terms.R"))

# Create Zenodo-specific search term --------------------------------------

# For some reason Zenodo doesn't accept this publication_date query in the API
five_years_ago <- glue("{today()-years(5)}")
five_years_to_today <- glue("publication_date:[{five_years_ago} TO {today()}]")

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

# Structured search term to fit Zenodo requirements
search_term <- glue("{search_terms$zenodo} AND {limiters}") %>%
    str_remove_all("\\n+") %>%
    str_squish() %>%
    str_remove_all("OR ")

# Connect to Zenodo and run search ----------------------------------------

# Requires token (PAT) from Zenodo to work
zenodo <- ZenodoManager$new(
    url = "https://zenodo.org/api",
    logger = "DEBUG",
    token = askpass::askpass()
)

# zenodo$getCommunities()
zenodo_records <- zenodo$getRecords(q = search_term, size = 1000)

# Number of extracted items
length(zenodo_records)

# To export an individual entry as JSON, with all information retreived.
# zenodo_records[[1]]$exportAsJSON(filename = here::here("data-raw/zenodo-entry-1"))

# Process extracted Zenodo records ----------------------------------------

extract_relevant_data <- function(record_list) {
    creators <- record_list$metadata$creators %>%
        map_chr( ~ .x$name) %>%
        str_flatten(" and ") %>%
        str_trim()

    keywords <- record_list$metadata$keywords %>%
        str_flatten("; ") %>%
        str_trim()

    list(
        creators = creators,
        title = record_list$metadata$title,
        description = record_list$metadata$description,
        date = record_list$metadata$publication_date,
        type = record_list$metadata$upload_type,
        keywords = keywords,
        doi = record_list$links$doi
    )
}

# Extract necessary data and keep only last five years
zenodo_records_processed <- zenodo_records %>%
    map(extract_relevant_data) %>%
    keep(~ ymd(as_date(.x$date)) >= five_years_ago)

# There's less entries from the original
length(zenodo_records_processed)

# Save for use later processing
yaml::write_yaml(zenodo_records_processed, file = here("data-raw/zenodo.yaml"))
