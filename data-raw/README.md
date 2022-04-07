# Contents of data folder

Should contain the *raw* (unedited) data used specifically for the
project.

The "data" for this project include website URLs and academic reference DOIs
on effective and evidence-based practices for doing research as a group and/or
organization of researchers.

Each URL and/or DOI should be stored in the `references.yaml` file by copying
and pasting this text below into the bottom of the file. 

```yaml
- reference:
    # Can add both, but need at least one
    - identifier:
        - url: ""
        - doi: ""
    # Add one or more tags you think are appropriate for the reference.
    # Some examples: "open data", "open science", "reproducibility", "open collaboration",
    # "reporting", "workflows", "checklists", "organization" (or "institution"),
    # "courses". Add any other tag you think isn't covered above.
    - tags:
        # Each new line is a new tag
        - ""
        - ""
    # Write some comments or notes you might have about the link/reference
    - notes: ""
```

With this file, the R scripts (to be developed and added later) will extract the
relevant information from the reference link and save it into a final working dataset
in the `data/` folder.
