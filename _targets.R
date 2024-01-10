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
library(magrittr)
source("R/utils.R")
source("R/openalex-search.R")
source("R/exclusions.R")

list(
  # Open Alex ---------------------------------------------------------------
  tar_target(
    name = search_term,
    command = search_terms()
  ),
  tar_target(
    name = records_title_only,
    command = openalex_retrieve_titles(search_term)
  ),
  # Exclude and save --------------------------------------------------------
  tar_target(
    name = records_after_title_exclusion,
    command = exclude_from_title(records_title_only)
  ),
  tar_target(
    name = data_records,
    command = save_as_csv(records_after_title_exclusion, here::here("data/records.csv"))
  )
)
