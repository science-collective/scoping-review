# Created by use_targets().
# Follow the comments below to fill in this target script.
# Then follow the manual to check and run the pipeline:
#   https://books.ropensci.org/targets/walkthrough.html#inspect-the-pipeline # nolint

# Load packages required to define the pipeline:
library(targets)
library(tarchetypes)

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
source("R/title-review.R")
source("R/abstract-review.R")

list(
  # Open Alex Title Search --------------------------------------------------
  tar_target(
    name = search_term,
    command = search_terms()
  ),
  tar_target(
    name = five_years_from_today,
    command = five_years_ago()
  ),
  tar_target(
    name = records_title_only,
    command = openalex_retrieve_titles(search_term, five_years_from_today)
  ),
  # Exclude and save --------------------------------------------------------
  tar_target(
    name = records_after_title_exclusion,
    command = exclude_from_title(records_title_only)
  ),
  tar_target(
    name = records_titles_path,
    command = save_as_csv(records_after_title_exclusion, here::here("data/review/titles.csv"))
  ),

  # Title review stage ------------------------------------------------------
  tar_target(
    name = reviewers,
    command = c("daniel", "mario", "luke")
  ),
  tar_target(
    name = reviewers_title_files,
    command = reviewers |>
      path_reviewer_titles() |>
      purrr::walk(\(path) copy_if_not_exists(records_titles_path, path)),
    format = "file"
  ),
  tar_target(
    name = titles_kept,
    command = reviewers_title_files |>
      read_title_reviews()
  ),
  tar_target(
    name = titles_agreed_on,
    command = titles_kept |>
      get_agreed_on_titles()
  ),
  tar_target(
    name = titles_disagreed_on,
    command = titles_kept |>
      get_disagreed_on_titles(titles_agreed_on)
  ),
  tar_target(
    name = titles_disagreed_on_path,
    command = save_as_csv(titles_disagreed_on, here::here("data/review/titles/disagreements.csv")),
    format = "file"
  ),
  tar_target(
    name = titles_resolved_path,
    command = titles_disagreed_on |>
      copy_if_not_exists(
        here::here("data/review/titles/resolved.csv")
      )
  ),
  tar_target(
    name = titles_selected,
    command = purrr::list_rbind(list(
      titles_agreed_on,
      titles_resolved_path |>
        readr::read_csv()
    )) |>
      dplyr::distinct()
  ),

  # Abstract retrieval ------------------------------------------------------
  tar_target(
    name = records_abstracts,
    command = openalex_retrieve_abstracts(titles_selected$id)
  ),
  tar_target(
    name = records_abstracts_path,
    command = save_as_yaml(records_abstracts, here::here("data/review/abstracts.yaml")),
    format = "file"
  ),
  tar_target(
    name = reviewers_abstract_files,
    command = reviewers |>
      path_reviewer_abstracts() |>
      purrr::walk(\(path) copy_if_not_exists(records_abstracts_path, path)),
    format = "file"
  ),
  tar_quarto(
    name = review_steps,
    path = here::here("doc/review-stages.qmd")
  )
)
