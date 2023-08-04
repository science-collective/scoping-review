# Function to exclude titles containing excluded terms
title_screening <- function(title, exclusions) {
    any(grepl(paste(exclusions, collapse = "|"), title, ignore.case = TRUE))
}

# Load data
pubmed_data <- read.csv("C:/Users/au711684/Documents/Science Collective/data-raw/pubmed.csv")

# List of automatic exclusions
automatic_exclusions <- c("open-label", "open label", "open surgery", "open government", "open governance", "open-angle glaucoma", "open dialogue", "open-circuit", "open circuit", "open-ended", "open fracture", "open issues", "open-shell", "open letter", "open abdomen", "open spaces", "open wound", "open call", "open people", "open water", "open university", "open universities")

# Apply screening function to dataset
pubmed_data_clean <- pubmed_data[!sapply(pubmed_data$title, title_screening, exclusions = automatic_exclusions), ]
