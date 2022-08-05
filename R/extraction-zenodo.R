library(zen4R)
library(lubridate)
library(glue)
library(stringr)

# For some reason Zenodo doesn't accept this publication_date query in the API
five_years_past <- glue("publication_date:[{today()-years(5)} TO {today()}]")

topic_search_terms <- "
    (open) AND
    (science OR research) AND
    (collaborat* OR team OR cooperat*) AND
    (technolog* OR tool OR framework OR guideline OR principles OR practices OR systems OR resources)
"

limiters <- "
    (access_right:open) AND
    (
        resource_type.type:publication
        resource_type.type:poster
        resource_type.type:presentation
        resource_type.type:lesson
        resource_type.type:other
    )
"

search_term <- glue("{limiters} AND {topic_search_terms}") %>%
    str_remove_all("\\n+") %>%
    str_squish() %>%
    str_remove_all("OR ")

# Requires token (PAT) from Zenodo to work
zenodo <- ZenodoManager$new(
    url = "https://zenodo.org/api",
    logger = "INFO",
    token = askpass::askpass()
)

test <- zenodo$getRecords(q = search_term, size = 1000)
test
