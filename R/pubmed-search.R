# Pubmed search using easypubmed
# last search was: 19/08/2022

#load libraries ----------------------------------------------------------------

#install.packages("easyPubMed")
library(easyPubMed)
library(tidyverse)
library(here)
library(purrr)
library(readr)

#Search pubmed using the easyPubMed package ------------------------------------

## making a list with the search terms
open_collaboration_query <-  '(open) AND (science OR research) AND (collaborat* OR team OR cooperat*) AND (technolog* OR tool OR framework OR guideline OR principles OR practices OR systems OR resources) AND (y_5[Filter])'

## search and download pubmed records
open_collaboration_pubmed_search <- batch_pubmed_download(pubmed_query_string = open_collaboration_query,
                                                          dest_file_prefix = "open_collab_",
                                                          encoding = "UTF-8")

# Extracting info and combining into single dataframe --------------------------

## make a function that convert each XML file to a dataset
make_df_from_pubmed <- function(dataset){
    new_PM_df <- table_articles_byAuth(pubmed_data = dataset,
                                       included_authors = "first",
                                       encoding = "UTF-8")
    new_PM_df <- as.data.frame(new_PM_df)
    return(new_PM_df)
}

## use map to single dataframe of all the batches

#!!note: this takes a while!!#
open_collaboration_pubmed_df <- map_df(open_collaboration_pubmed_search, make_df_from_pubmed, .id = NULL)

# Cleaning dataset -------------------------------------------------------------

open_collaboration_pubmed_df <- open_collaboration_pubmed_df %>% select(lastname, year, title, abstract, jabbrv, email, pmid)
open_collaboration_pubmed_df$database <- "pubmed"

# Count number of papers -------------------------------------------------------

nrow(open_collaboration_pubmed_df) #7339 papers identified

#Note: same search on pubmed gave 10.439 papers

# Save dataset -----------------------------------------------------------------

write.csv(open_collaboration_pubmed_df, here("data", "pubmed_search_19082022.csv"), row.names = TRUE)
