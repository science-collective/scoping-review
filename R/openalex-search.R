#' Search terms to use.
#'
#' @return A list with character vectors.
#'
search_terms <- function() {
  # Can't use wildcards (*, ?)
  list(
    title_search = "open",
    general_search = "(science OR research) AND (collaborating OR collaboration OR collaborate OR team OR cooperate OR cooperation OR cooperating) AND (technology OR technologies OR tool OR framework OR guideline OR principles OR practices OR systems OR resources)"
  )
}

#' Search the Open Alex database
#'
#' See their website: https://openalex.org/
#'
#' @param search_term The search terms to use.
#'
#' @return A tibble.
#'
#' @examples
#' openalex_retrieve_titles(search_terms(), five_years_ago())
openalex_retrieve_titles <- function(search_term, from_date) {
  openalexR::oa_fetch(
    entity = "works",
    options = list(
      select = c("id", "doi", "display_name", "publication_date")
    ),
    search = search_term$general_search,
    title.search = search_term$title_search,
    open_access.is_oa = TRUE,
    from_publication_date = from_date,
    has_fulltext = TRUE,
    language = "en",
    type = c("article", "book-chapter", "book", "dissertation"),
    per_page = 200,
    mailto = "lwjohnst@gmail.com",
    abstract = FALSE
  ) |>
    dplyr::rename(title = display_name)
}

openalex_retrieve_abstracts <- function(ids) {
  openalexR::oa_fetch(
    identifier = ids,
    per_page = 200,
    mailto = "lwjohnst@gmail.com",
    abstract = TRUE
  ) |>
    dplyr::select(id, doi, display_name, publication_date, ab) |>
    dplyr::rename(title = display_name, abstract = ab)
}

openalex_retrieve_records <- function(ids) {
  records <- openalexR::oa_fetch(
    identifier = ids,
    mailto = "lwjohnst@gmail.com"
  ) |>
    dplyr::mutate(
      pdf_proj_path = stringr::str_replace(id, "https://openalex.org/", "oa-id-") |>
        fs::path_ext_set("pdf"),
      pdf_proj_path = fs::path("data/review/fulltext/", pdf_proj_path)
    )
}

openalex_retrieve_pdf <- function(data) {
  urls <- data |>
    dplyr::select(pdf_proj_path, pdf_url) |>
    tidyr::drop_na()

  purrr::walk2(
    urls$pdf_url,
    urls$pdf_proj_path,
    \(url, path) download.file(url, destfile = path)
  )
  urls$pdf_proj_path
}
