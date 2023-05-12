# medRxiv search using medrxivr

#Link: https://github.com/ropensci/medrxivr

# Load libraries ---------------------------------------------------------------

library(medrxivr)
library(here)
library(tidyverse)
source(here("R/search-terms.R"))

# Running search ---------------------------------------------------------------

medrxiv_data <- mx_api_content(server = "medrxiv") #with this function we get the latest data! It takes a while, though

medrxiv_search <- mx_search(data = medrxiv_data,
                            query = search_terms("medrxiv"),
                            #query = list(c("open"), c("science", "research"), c("collaborate","collaborating", "collaboration", "team", "cooperate", "cooperating"), c("technology", "technologies", "tool","framework", "guideline", "principles", "practices", "systems","resources")),
                            from_date = "2017-01-01",
                            to_date = "2022-11-03", #should this be updated?
                            auto_caps = TRUE,
                            report = TRUE)

#Let's try to get to obtain only those that have open in the title to meet the criteria of the searches for other tools:

medrxiv_search_open_ti <- medrxiv_search[which(stringr::str_detect(string = medrxiv_search$title, pattern = "open") == TRUE |
                                                 stringr::str_detect(string = medrxiv_search$title, pattern = "Open") == TRUE),] #only 6/37

#Let's now save the data in the same format as arxiv data:

medrxiv_results <- medrxiv_search_open_ti %>% 
  select(id=ID, date, title, authors, link_abstract=link_page, link_pdf)

#Finally, let's save the data:

write_csv(
  medrxiv_results,
  file = here("data-raw/medrxiv-search.csv")
)
