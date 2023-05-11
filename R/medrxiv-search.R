# medRxiv search using medrxivr

#Link: https://github.com/ropensci/medrxivr

# Load libraries ---------------------------------------------------------------

library(medrxivr)
library(here)

source(here("R/search-terms.R"))

# Running search ---------------------------------------------------------------

medrxiv_data <- mx_snapshot() #It says in the documentation that the snapshot is from here: https://github.com/mcguinlu/medrxivr-data
                              #however, it does not look like the it has been updated in 9 months.

medrxiv_search <- mx_search(data = medrxiv_data,
                            query = search_terms("medrxiv"),
                     from_date = "2017-01-01",
                     to_date = "2022-11-03", #should this be updated?
                     auto_caps = TRUE)
