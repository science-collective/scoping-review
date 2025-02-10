doi_to_bib <- function(doi, curl_handle) {
  stopifnot(length(doi) == 1)
  curl::curl(doi, handle = curl_handle) |>
    readr::read_lines() |>
    stringr::str_trim()
}

download_doi_to_bib <- function(doi, curl_handle) {
  # This is to tell the website to give us the BibTeX format
  h <- curl::new_handle()
  curl::handle_setheaders(h, "accept" = "application/x-bibtex")

  output_path <- here::here("doc/reviewed-records.bib")
  doi |>
    purrr::map_chr(\(doi) doi_to_bib(doi, curl_handle = h)) |>
    readr::write_lines(output_path)
  cli::cli_alert("Note: The created {.file {output_path}} file requires manual cleaning, ideally through JabRef.")
  output_path
}
