#' Exclude titles based on further criteria.
#'
#' @param data Reference/sources data frame.
#'
#' @return A tibble.
#'
#' @examples
#' readr::read_csv(here::here("data-raw/zenodo.csv")) |> exclude_from_title() |> View()
exclude_from_title <- function(data) {
# TODO: Use ggcohort to track what is removed?
  data |>
    # Items related to healthcare or surgery
    exclude(title, "open( |-)label|surgery|surgical|angle glaucoma|fracture|abdomen|wound") |>
    # Items related to government, politics, or social
    exclude(title, "open( |-)(government|governance|dialogue|letter|spaces|call|people|universit(y|ies))") |>
    # Items related to electronics or tech
    exclude(title, "open( |-)(circuit|shell|backend|set|iot)") |>
    # Items related to dissemination
    exclude(title, "open( |-)access|publishing|communication") |>
    # Items related to misc
    exclude(title, "open( |-)(end(ed)?|issues|water|air|education(al)?)")
}

exclude <- function(data, variable, criteria) {
  data |>
    dplyr::filter(stringr::str_detect(
      string = {{variable}},
      pattern = stringr::regex(criteria, ignore_case = TRUE),
      negate = TRUE
    ))
}
