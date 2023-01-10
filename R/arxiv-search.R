# arxiv search using aRxiv

# Load libraries ---------------------------------------------------------------

library(tidyverse)
library(lubridate)
library(aRxiv)
library(here)
source(here("R/search-terms.R"))

# Running search -----------------------------------------------------------------------

number_found <- arxiv_count(query = search_terms$arxiv)
arxiv_results <- arxiv_search(
  query = search_terms$arxiv,
  # Round to nearest tenth.
  limit = as.integer(round(number_found*1.5, -2))
) %>%
  as_tibble()

# Cleaning results -----------------------------------------------------------------------

# Keep only some columns, drop anything before 5 years.
arxiv_results <- arxiv_results %>%
  select(id, date = updated, title, authors, link_abstract, link_pdf) %>%
  filter(ymd(as_date(date)) >= five_years_ago)

nrow(arxiv_results)

write_csv(
  arxiv_results,
  file = here("data-raw/arxiv-search.csv")
)
