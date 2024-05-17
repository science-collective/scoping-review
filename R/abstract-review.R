path_reviewer_abstracts <- function(reviewers) {
  here::here("data/review/abstracts", reviewers) |>
    fs::path_ext_set("yaml")
}
