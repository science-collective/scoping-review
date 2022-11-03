# medRxiv search using medrxivr

#Link: https://github.com/ropensci/medrxivr

# Load libraries ---------------------------------------------------------------

library(medrxivr)

source(here("R/search-terms.R"))

# Running search ---------------------------------------------------------------

medrxiv_data <- mx_snapshot()

medrxiv_search <- mx_search(data = medrxiv_data,
                     query = search_terms$medrxiv,
                     from_date = "2017-01-01",
                     to_date = "2022-11-03",
                     auto_caps = TRUE)
