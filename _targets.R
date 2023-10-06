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
source("R/search-terms.R")
source("R/utils.R")
source("R/zenodo-search.R")
source("R/arxiv-search.R")
source("R/pubmed-search.R")
source("R/medrxiv-search.R")

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
    command = save_list_as_csv(zenodo_records, here::here("data-raw/zenodo.csv")),
    format = "file"
  ),
  # PubMed ------------------------------------------------------------------
  tar_target(
    name = pubmed_search_terms,
    command = search_terms("pubmed")
  ),
  tar_target(
    name = pubmed_records,
    command = pubmed_retrieve_records(pubmed_search_terms)
  ),
  tar_target(
    name = data_raw_pubmed,
    command = save_list_as_csv(pubmed_records, here::here("data-raw/pubmed.csv")),
    format = "file"
  ),
  # arXiv ------------------------------------------------------------------
  tar_target(
    name = arxiv_search_terms,
    command = search_terms("arxiv")
  ),
  tar_target(
    name = arxiv_records,
    command = arxiv_retrieve_records(arxiv_search_terms)
  ),
  tar_target(
    name = data_raw_arxiv,
    command = save_as_csv(arxiv_records, here::here("data-raw/arxiv.csv")),
    format = "file"
  ),
  # medRxiv -----------------------------------------------------------------
  tar_target(
    name = medrxiv_search_terms,
    command = search_terms("medrxiv")
  ),
  tar_target(
    name = medrxiv_records,
    command = medrxiv_retrieve_records(medrxiv_search_terms)
  ),
  tar_target(
    name = data_raw_medrxiv,
    command = save_as_csv(medrxiv_records, here::here("data-raw/medrxiv.csv")),
    format = "file"
  ),
  # bioRxiv -----------------------------------------------------------------
  tar_target(
    name = biorxiv_search_terms,
    command = search_terms("biorxiv")
  ),
  tar_target(
    name = biorxiv_records,
    command = biorxiv_retrieve_records(biorxiv_search_terms)
  ),
  tar_target(
    name = data_raw_biorxiv,
    command = save_as_csv(biorxiv_records, here::here("data-raw/biorxiv.csv")),
    format = "file"
  ),
  # Join sources and apply exclusions ---------------------------------------
  tar_target(
    name = records,
    command = join_from_paths(c(
      data_raw_medrxiv,
      data_raw_arxiv,
      data_raw_pubmed,
      data_raw_zenodo
    ))
  ),
  tar_targets(
    name = records_after_title_exclusion,
    command = exclude_from_title(records)
  )
)
