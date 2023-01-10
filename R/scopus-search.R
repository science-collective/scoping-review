# Scopus search using rscopus

# Link: https://github.com/muschellij2/rscopus

# Load libraries ---------------------------------------------------------------

# 1devtools::install_github("muschellij2/rscopus")

library(rscopus)
library(tidyverse)
library(dplyr)

# Save API key ---------------------------------------------------------------

apikey = INSERT KEY HERE
## Hannah has a key that others can use

# Search for "open collaboration" ---------------------------------------------------------------

query_open_collab1 <- 'TITLE(\"open collaboration\")'

open_collaboration1 <- scopus_search(query = query_open_collab1, api_key = apikey, count = 20,
                      view = 'STANDARD', start = 0, verbose = TRUE,
                      max_count = 20000, http = 'https://api.elsevier.com/content/search/scopus',
                      headers = NULL, wait_time = 0)

# Convert list to data frame
open_collab_df1 <- gen_entries_to_df(open_collaboration1$entries, scrub=FALSE)
open_collab_df1 <- open_collab_df1$df
## 472 results

# Select and rename relevant columns
open_collab_df <- open_collab_df %>% 
  select('dc:identifier', 'dc:title', 'dc:creator', 'prism:coverDate', 'prism:doi') %>% 
  rename(Scopus_ID = 'dc:identifier',
         Title = 'dc:title',
         Author = 'dc:creator',
         Date = 'prism:coverDate',
         DOI = 'prism:doi')

# Filter out older results as per exclusion criteria
open_collab_df <- open_collab_df %>% 
  filter(Date > '2017-01-01')
## 177 results (~300 less than original set)

# Search for "team science" ---------------------------------------------------------------

query_team_science <- 'TITLE-ABS-KEY(\"team science\")'

team_science <- scopus_search(query = query_team_science, api_key = apikey, count = 20,
                                    view = 'STANDARD', start = 0, verbose = TRUE,
                                    max_count = 20000, http = 'https://api.elsevier.com/content/search/scopus',
                                    headers = NULL, wait_time = 0)

# Convert list to data frame
team_sci_df <- gen_entries_to_df(team_science$entries, scrub=FALSE)
team_sci_df <- team_sci_df$df
## 718 results

# Select and rename relevant columns
team_sci_df <- team_sci_df %>% 
  select('dc:identifier', 'dc:title', 'dc:creator', 'prism:coverDate', 'prism:doi') %>% 
  rename(Scopus_ID = 'dc:identifier',
       Title = 'dc:title',
       Author = 'dc:creator',
       Date = 'prism:coverDate',
       DOI = 'prism:doi')

# Filter out older results as per exclusion criteria
team_sci_df <- team_sci_df %>% 
  filter(Date > '2017-01-01')
## 439 results (~300 less than original set)

# Search for "open science practices" ---------------------------------------------------------------

query_open_sci_prac <- 'TITLE-ABS-KEY(\"open science practices\")'

open_sci_prac <- scopus_search(query = query_open_sci_prac, api_key = apikey, count = 20,
                              view = 'STANDARD', start = 0, verbose = TRUE,
                              max_count = 20000, http = 'https://api.elsevier.com/content/search/scopus',
                              headers = NULL, wait_time = 0)

# Convert list to data frame
open_sci_prac_df <- gen_entries_to_df(open_sci_prac$entries, scrub=FALSE)
open_sci_prac_df <- open_sci_prac_df$df
## 275 results

# Select and rename relevant columns
open_sci_prac_df <- open_sci_prac_df %>% 
  select('dc:identifier', 'dc:title', 'dc:creator', 'prism:coverDate', 'prism:doi') %>% 
  rename(Scopus_ID = 'dc:identifier',
         Title = 'dc:title',
         Author = 'dc:creator',
         Date = 'prism:coverDate',
         DOI = 'prism:doi')

# Filter out older results as per exclusion criteria
open_sci_prac_df <- open_sci_prac_df %>% 
  filter(Date > '2017-01-01')
## 267 results (~10 less than original set)

# Search for "open science framework" ---------------------------------------------------------------

query_open_sci_frame <- 'TITLE-ABS-KEY(\"open science framework\")'

open_sci_frame <- scopus_search(query = query_open_sci_frame, api_key = apikey, count = 20,
                               view = 'STANDARD', start = 0, verbose = TRUE,
                               max_count = 20000, http = 'https://api.elsevier.com/content/search/scopus',
                               headers = NULL, wait_time = 0)

# Convert list to data frame
open_sci_frame_df <- gen_entries_to_df(open_sci_frame$entries, scrub=FALSE)
open_sci_frame_df <- open_sci_frame_df$df
## 848 results

# Select and rename relevant columns
open_sci_frame_df <- open_sci_frame_df %>% 
  select('dc:identifier', 'dc:title', 'dc:creator', 'prism:coverDate', 'prism:doi') %>% 
  rename(Scopus_ID = 'dc:identifier',
         Title = 'dc:title',
         Author = 'dc:creator',
         Date = 'prism:coverDate',
         DOI = 'prism:doi')

# Filter out older results as per exclusion criteria
open_sci_frame_df <- open_sci_frame_df %>% 
  filter(Date > '2017-01-01')
## 834 results (~10 less than original set)

# Search for "open science principles" ---------------------------------------------------------------

query_open_sci_prin <- 'TITLE-ABS-KEY(\"open science principles\")'

open_sci_prin <- scopus_search(query = query_open_sci_prin, api_key = apikey, count = 20,
                                view = 'STANDARD', start = 0, verbose = TRUE,
                                max_count = 20000, http = 'https://api.elsevier.com/content/search/scopus',
                                headers = NULL, wait_time = 0)

# Convert list to data frame
open_sci_prin_df <- gen_entries_to_df(open_sci_prin$entries, scrub=FALSE)
open_sci_prin_df <- open_sci_prin_df$df
## 88 results

# Select and rename relevant columns
open_sci_prin_df <- open_sci_prin_df %>% 
  select('dc:identifier', 'dc:title', 'dc:creator', 'prism:coverDate', 'prism:doi') %>% 
  rename(Scopus_ID = 'dc:identifier',
         Title = 'dc:title',
         Author = 'dc:creator',
         Date = 'prism:coverDate',
         DOI = 'prism:doi')

# Filter out older results as per exclusion criteria
open_sci_prin_df <- open_sci_prin_df %>% 
  filter(Date > '2017-01-01')
## 83 results (5 less than original set)

# Merging all search results ---------------------------------------------------------------

df_list <- list(open_collab_df, team_sci_df, open_sci_frame_df, open_sci_prac_df, open_sci_prin_df)

all_df <- df_list %>% 
  reduce(full_join)
# 1772 results
