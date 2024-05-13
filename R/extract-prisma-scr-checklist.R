library(docxtractr)
library(tidyverse)

docx_file <- fs::file_temp(ext = ".docx")
download.file(
  "http://www.prisma-statement.org/documents/PRISMA-ScR-Fillable-Checklist_10Sept2019.docx",
  destfile = docx_file
)

doc_contents <- read_docx(docx_file)
checklist <- docx_extract_tbl(doc_contents) %>%
  rename_with(snakecase::to_snake_case) %>%
  rename(subsection = section) %>%
  mutate(section = if_else(is.na(item), str_to_sentence(subsection), NA_character_)) %>%
  fill(section) %>%
  filter(!is.na(item)) %>%
  select(section, subsection, item, description = prisma_sc_r_checklist_item)

# Save to doc/instructions/primsa-scr-checklist.md file
knitr::kable(checklist) %>%
  write_lines(here::here("doc", "instructions", "primsa-scr-checklist.md"))

checklist_for_issue <- function(data) {
  header <- glue::glue("**{unique(data$section)}**:")
  check_lists <- data %>%
    glue::glue_data("- [ ] {subsection}: {description}")
  c("\n", header, "\n", check_lists)
}

text_for_issue <- checklist %>%
  mutate(section = fct_inorder(section)) %>%
  group_split(section) %>%
  map(checklist_for_issue) %>%
  unlist()

# Save to clipboard to paste into GitHub Issue.
c(
  "> Note: This checklist was generated with the script `R/extract-prisma-scr-checklist.R`.",
  "The checklist can also be found at `doc/instructions/prisma-scr-checklist.md`.",
  text_for_issue
) %>%
  clipr::write_clip()
