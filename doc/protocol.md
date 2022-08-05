---
editor_options: 
  markdown: 
    wrap: 72
---

# Open science and open collaboration: A scoping review

TODO: Brainstorm title ideas. 
IDEA 1: *Towards open collaboration in biomedical and health research: A scoping review*
Hannah: I like this!

## Study information

This project is focused on open collaboration and is being conducted within the
Science Collective. The overall aim of the Science Collective is to build a
technical and social environment that encourages and makes it easy for science
to be done in an open, rigorous, and collaborative way. We define open
collaboration using the definition by Forte and Lampe (2013): "*an
online environment that (a) supports the collective production of an artifact
(b) through a technologically mediated collaboration platform (c) that presents
a low  barrier  to  entry  and  exit  and  (d)  supports  the  emergence  of
persistent  but  malleable social structures.*" This scoping review will focus
on current practices of open collaboration and open science in relation to
collaboration in the field of biomedical and health research.

From our work in this field, we have experienced many different ways of
collaborating, but rarely in the form of open collaboration. With the growing
complexity and specialization in scientific practices and methods, together with
globalisation of health and environmental issues, there is a great need for a
paradigm shift in research collaboration to be able to tackle these challenges.

### Research aims

The overarching aim of this scoping review is to identify current practices of
open collaboration in biomedical and health research.

The specific aims of this scoping review are to:

- Provide an overview of current practices of research collaboration that follow
basic open principles (e.g., transparency, accessibility)
- Summarize existing online tools and resources available to improve open
collaboration in research

### If helpful, please select the type of aim (non-exhaustive list):

Understanding

### Anticipated Duration

-   Overall: 12/2021 - 12/2023
-   Research design and data collection: 12/2021 - 12/2022
-   Screening resources: 12/2022 - 06/2023
-   Analyses and manuscript writing: 06/2023 - 12/2023

## Design plan

### Study design

Scoping review

The protocol for this review will be registered with the (Open Science
Framework)[<https://osf.io/>].

### Sampling and case selection

An initial search strategy was developed in consultation with a
research librarian. Data will be collected via
systematic searches of databases and hand searches.

## Document data collection

### Document types

-   Open access journal articles published in peer-reviewed and non-peer-reviewed journals.
-   Websites, blogs, and other online resources.
-   Books

### Information sources and search terms

-   SCOPUS, Web of Science, MEDLINE (via PubMed), and EMBASE

    -   Terms:
        `(open) AND (science OR research) AND (collaborat* OR team OR cooperat*) AND (technolog* OR tool OR framework OR guideline OR principles OR practices OR systems OR resources)`

-   medRxiv and bioRxiv preprint repositories 

-   Reference lists from extracted articles

-   Google and Google Scholar

    -   Terms:
        `(open) AND (science OR research) AND (collaborat* OR team OR cooperat*) AND (technolog* OR tool OR framework OR guideline OR principles OR practices OR systems OR resources)`

*DANIEL: Google Scholar usually gives a lot of
results, so I think that should be cut out. I have never heard of
Science Direct, so maybe also that one. Four databases should be more
than enough.*
Hannah: I agree that four databases is sufficient, particularly given that this is a scoping review and not a systematic review (and our aim is to "provide an overview" rather than an exhaustive list).

### Eligibility criteria

-   5 years in the past, to capture current/most recent practices

-   Language: English

### Software and tools used

We will create RStudio-based script files to search and retrieve results from the databases.

We will use the following packages:

TODO: Include citation to these packages.

-   [rvest](https://rvest.tidyverse.org/) package for scraping and
    downloading results from Google and Google Scholar searches.
    Hannah: Can remove this if we do end up removing Google/Google Scholar (as per above comment in the Information Sources section)

-   [easyPubMed](https://cran.r-project.org/web/packages/easyPubMed/vignettes/getting_started_with_easyPubMed.html)
    package for searching and retrieving from MEDLINE via PubMed.

-   [wosr](https://github.com/vt-arc/wosr) package for searching and
    retrieving from Web of Science.

-   [rscopus](https://github.com/muschellij2/rscopus) package for
    searching and retrieving from Scopus and EMBASE (?).

-   [medrxivr](https://github.com/ropensci/medrxivr) and
    [aRxiv](https://docs.ropensci.org/aRxiv/) packages for 
    searching and retrieving from preprint repositories.

*DANIEL: We could also do Rayyan, which is a free program for systematic
reviews. We can also use Covidence, but that requires a license. I have
one, but I guess it i not as open as Rayyan.* 

## Document selection

Inclusion criteria:

-   Any published document with reporting on current open collaboration practices.
-   Any published document with advice, guidance, tools, and/or recommendations for improving open collaboration

This includes any document where open collaboration practices are not the primary
    focus. We will be guided by the definition of open collaboration from Forte
    and Lampe (2013) mentioned above in determining whether the records are relevant.

Exclusion criteria:

-   Documents that do not report on specific open collaboration
    practices

### Stopping criteria

In terms of database searches, we aim to run the final search by 01/10/22. Searches
will be concluded when we reach conceptual saturation (i.e., when it is
determined that we are not identifying any new concepts/resources). The first
1000 records will be screened on Google. In the interests of feasibility, a maximum for 4 books will be selected and evaluated. Books will be selected based on a consensus in the research group.

DANIEL: why not search all the references? Do we want to have two people
review each paper or is it okay we search a database each? For this
study, I would think that it is okay not to have two reviewers, as it is
not a systematic reivew. It is more important to have more databases,
then double check each reference.
Hannah: I think I added this "1000 records" idea based on my discussions with the research librarian, who had done something similar. I'm happy to search all references. I agree with your proposal to search a database each, although maybe we should trial this together to ensure that we are using a similar approach/decision-making method.

## Analysis Plan

### Data analysis approach

Data from all searches in online databases will be exported into text files or
CVS files for further processing including removal of duplicates. Google Sheets
will be used to manage records including screening decisions.

One author will extract data using a standardized and tested template via Google
Sheets. Data regarding the data source (e.g., author, title, publciation year),
open collaboration practices, and any other relevant information, will be
extracted. A second author will check extracted data. Extracted data will be
summarized with the descriptive analytical method described by Arksey and
O'Malley (2005). The descriptive
analytical method is aimed at identifying and summarizing different open
collaboration practices.

TODO: Decide on how we will extract data 
Daniel: we could also use a
Google sheet instead - that is easier to share. If we use covidence, we
can also use the data extraction form there.
Hannah: Happy to use Google Sheets. I think Covidence would only be appropriate if we were doing a systematic review. I do have access to Covidence, though, if we decide to go down that route.

TODO: Decide on who will screen/extract data
Daniel: I don't think we
have to decide who now. Ok to write as it is.

### Data analysis process

Data analysis will be managed in NVivo Version 12.0. 

### Credibility strategies

- At least two authors will be involved in screening and data extraction
- Narrative synthesis to be conducted by several co-authors
- The review will be documented in accordance with the PRISMA-ScR Guidelines
- Preliminary results of the scoping review will be shared with groups of
biomedical and health researchers to understand their collaborative practices and discuss how
current practices can be shifted towards more open collaborative practices

### Please provide a short rationale for why you selected particular strategies and how they are appropriate given your study's aim(s), or specify your credibility strategies if not on the above list

In this project, we will identify current practices of open collaboration and
available tools. Given the broad search terms, we thought it more important to
scan several databases rather than double-checking abstracts in few databases. We chose the narrative synthesis approach so that we could understand open collaboration practices more deeply.

### Reflection on your positionality (optional)

*No response*
