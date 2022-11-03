# Web of Science search using wosr

# Load libraries ---------------------------------------------------------------

library(wosr)

source(here("R/search-terms.R")) #forgot to add the 5-year restriction!!

# Input username and password --------------------------------------------------

#<NOT SURE HOW WE WILL DO THIS, I USUALLY ACCESS THROUGH AU LIBRARY>

Sys.setenv(WOS_USERNAME = "your_username", WOS_PASSWORD = "your_password")

# Get session ID
sid <- auth()

# Running the search -----------------------------------------------------------

## Seeing how many results
query_wos(search_terms$wos, sid = sid)
#tested the search on the web and identified 7780 records

## extracting data from the search
wos_search <- pull_wos(search_terms$wos, sid = sid)

# Data wrangling ---------------------------------------------------------------


