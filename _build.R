# This is to fix a bug that PDF can only use one bibliography file
c(
  readr::read_lines(here::here("doc/references.bib")),
  readr::read_lines(here::here("doc/reviewed-records.bib"))
) |>
  readr::write_lines(here::here("doc/temp-combined.bib"))
