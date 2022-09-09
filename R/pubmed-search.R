# Pubmed search using easypubmed
# last search was: 19/08/2022

# Load libraries ----------------------------------------------------------------

library(easyPubMed)
library(tidyverse)
library(here)
library(purrr)
library(readr)
source(here("R/search-terms.R"))

# Search pubmed using the easyPubMed package ------------------------------------

## making a list with the search terms

## search and download pubmed records
pubmed_search <-
    batch_pubmed_download(
        pubmed_query_string = search_terms$pubmed,
        dest_file_prefix = "open_collab_",
        encoding = "UTF-8"
    )

# Extracting info and combining into single dataframe --------------------------

## make a function that convert each XML file to a dataset
make_df_from_pubmed <- function(dataset) {
    new_pubmed_df <- easyPubMed::table_articles_byAuth(
        pubmed_data = dataset,
        included_authors = "first",
        encoding = "UTF-8"
    )
    new_pubmed_df <- tibble::as_tibble(new_pubmed_df)
    return(new_pubmed_df)
}

## use map to single dataframe of all the batches
# !!note: this takes a while!!#
open_collaboration_pubmed_df <-
    map_dfr(pubmed_search, make_df_from_pubmed, .id = NULL)

# Cleaning dataset -------------------------------------------------------------

pubmed_df <- pubmed_df %>%
    select(lastname, year, title, abstract, jabbrv, email, pmid) %>%
    mutate(database = "pubmed")

# Count number of papers -------------------------------------------------------

nrow(open_collaboration_pubmed_df) #7339 papers identified

#Note: same search on pubmed gave 10.439 papers

# Save dataset -----------------------------------------------------------------

readr::write_csv(pubmed_df, here("data", "pubmed-search.csv.gz"))
