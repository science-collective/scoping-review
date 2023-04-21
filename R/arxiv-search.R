# arxiv search using aRxiv

# Load libraries ---------------------------------------------------------------

library(tidyverse)
library(lubridate)
library(aRxiv)
library(here)
source(here("R/search-terms.R"))

# Running search -----------------------------------------------------------------------

number_found <- arxiv_count(query = search_terms("arxiv"))
arxiv_results <- arxiv_search(
  query = search_terms("arxiv"),
  # Round to nearest tenth.
  limit = as.integer(round(number_found*1.5, -2))
) %>%
  as_tibble()

# Cleaning results -----------------------------------------------------------------------

# Keep only some columns, drop anything before 5 years.

five_years_ago <- "2017-01-01 00:00:00" #Could not run the code since this was not included. Change if we want it as an variable that we should load.

arxiv_results_filtered <- arxiv_results %>% 
  select(id, date = updated, title, authors, link_abstract, link_pdf) %>%
  filter(ymd(as_date(date)) >= five_years_ago) #or directly write it here...

#Small test to check if we did it right:

summary(as_date(arxiv_results_filtered$date))

#And now extract the number of results:

nrow(arxiv_results_filtered) #126

write_csv(
  arxiv_results_filtered,
  file = here("data-raw/arxiv-search.csv")
)
