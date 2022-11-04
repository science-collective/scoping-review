# Zenodo search using zen4R

#Link: https://github.com/eblondel/zen4R/wiki

# Load libraries ---------------------------------------------------------------

library(zen4R)

source(here("R/search-terms.R"))

# Running search -----------------------------------------------------------------------

## note that the token you use is private

zenodo <- ZenodoManager$new(
    token = "put token here",
    logger = "INFO" # use "DEBUG" to see detailed API operation logs, use NULL if you don't want logs at all
)

my_zenodo_records <- zenodo$getRecords(q = "title:(+open +collaboration) publication_date:(2017-01-01 TO 2022-11-02)")
