#arxiv search using aRxiv

#Link: https://docs.ropensci.org/aRxiv/articles/aRxiv.html

# Load libraries ---------------------------------------------------------------

library(aRxiv)

# Running search -----------------------------------------------------------------------

# This is a narrow search, based on titles only

ax_search_title <- arxiv_search(query = 'ti:"open collaboration" OR ti:"open science" OR ti:"team science" OR ti:"open research"', limit=1000)
# 96 results as of 04/11/2022

# We could do a broader search instead, based on abstracts

ax_search_abstract <- arxiv_search(query = 'abs:"open collaboration" OR abs:"open science" OR abs:"team science" OR abs:"open research"', limit=1000)
# 200 results as of 04/11/2022

# Cleaning results -----------------------------------------------------------------------

ax_search_title <- ax_search_title %>% 
  select(id, title, abstract, authors, link_pdf, link_doi)

ax_search_abstract <- ax_search_abstract %>% 
  select(id, title, abstract, authors, link_pdf, link_doi)
