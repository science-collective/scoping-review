#arxiv search using aRxiv

#Link: https://docs.ropensci.org/aRxiv/articles/aRxiv.html

# Load libraries ---------------------------------------------------------------

library(aRxiv)

source(here("R/search-terms.R"))

# Running search -----------------------------------------------------------------------

#just a test but there are 3 interesting papers
ax_search <- arxiv_search('ti:"open collaboration"')



