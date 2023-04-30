# Created by use_targets().
# Follow the comments below to fill in this target script.
# Then follow the manual to check and run the pipeline:
#   https://books.ropensci.org/targets/walkthrough.html#inspect-the-pipeline # nolint

# Load packages required to define the pipeline:
library(targets)
# library(tarchetypes) # Load other packages as needed. # nolint

# Set target options:
tar_option_set(
  packages = desc::desc_get_deps()$package,
  format = "rds" # default storage format
  # Set other options as needed.
)

# tar_make_clustermq() configuration (okay to leave alone):
# options(clustermq.scheduler = "multicore")

# tar_make_future() configuration (okay to leave alone):
# Install packages {{future}}, {{future.callr}}, and {{future.batchtools}} to allow use_targets() to configure tar_make_future() options.

# Saved in .Renviron
# Sys.setenv(ZENODO_PAT = askpass::askpass("Please provide the PAT for Zenodo."))

# Run the R scripts in the R/ folder with your custom functions:
# tar_source()
source("R/search-terms.R")
source("R/zenodo-search.R")
source("R/pubmed-search.R")
source("R/utils.R")

list(
  # Zenodo ------------------------------------------------------------------
  tar_target(
    name = zenodo_search_terms,
    command = search_terms("zenodo")
  ),
  tar_target(
    name = zenodo_records,
    command = zenodo_retrieve_records(zenodo_search_terms)
  ),
  tar_target(
    name = data_raw_zenodo,
    command = save_list_as_yaml(zenodo_records, here::here("data-raw/zenodo.yaml")),
    format = "file"
  ),
  # PubMed ------------------------------------------------------------------
)
