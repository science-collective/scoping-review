---
editor_options: 
  markdown: 
    wrap: 72
---

# Open science and open collaboration: A scoping review

TODO: Brainstorm title ideas. 
IDEA 1: *Towards open collaboration in biomedical and health research: A scoping review*

## Study information

This project focus on open collaboration and is being conducted within the
Science Collective. The overall aim of the Science Collective is to build a
technical and social environment that encourages and makes it easy for science
to be done in an open, rigorous, and collaborative way. We define open
collaborative systems using the definition by Forte and Lampe (2013): "*an
online environment that (a) supports the collective production of an artifact
(b) through a technologically mediated collaboration platform (c) that presents
a low  barrier  to  entry  and  exit  and  (d)  supports  the  emergence  of
persistent  but  malleable social structures.*" This scoping review will focus
on current practices of open collaboration and open science in relation to
collaboration in medical research.

From our work in medical research, we have experienced many different ways of
collaborating, but rarely in the form of open collaboration. With the growing
complexity and specialication in scientific practices and mehtods, together with
globalisation of health and environmental issues, there is a great need for a
paradigm shift in research collaboration in medical research to be able to
tackle these challenges.

### Research aims

The overarching aim of this scoping review is to map out current practices for
open collaboration in medical research.

The specific aims of this scoping review are to:

- Provide an overview of current practices of research collaboration that follow
basic open principles (e.g. transparency, accessibility)
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

First, an initial search strategy was developed in consultation with a
research librarian. Data was then collected in two main ways, via
systematic searches of databases and hand searches.

Data from all searches in online databases will be exported into text files or
CVS files for further processing including removal of duplicates. Google sheets
will be used to manage records including screening decisions.


## Document data collection

### Document types

-   Journal articles published in non-peer- and peer-reviewed journals.
-   Websites, blogs, and other online resources.

TODO: Books too?
A maximum for 4 books will be selected and evaluated. Books will be selected based on a consensus in the research group.  

### Information sources and search terms

-   SCOPUS, Web of Science, MEDLINE, and EMBASE

    -   Terms:
        `(open) AND (science OR research) AND (collaborat* OR team OR cooperat*) AND (technolog* OR tool OR framework OR guideline OR principles OR practices OR systems OR resources)`

-   Reference lists from extracted articles

-   Google and Google Scholar

    -   Terms:
        `(open) AND (science OR research) AND (collaborat* OR team OR cooperat*) AND (technolog* OR tool OR framework OR guideline OR principles OR practices OR systems OR resources)`

*DANIEL: Google Scholar usually gives a lot of
results, so I think that should be cut out. I have never heard of
Science Direct, so maybe also that one. Four databases should be more
than enough.*

### Eligibility criteria

-   5 years in the past

-   Language: English

### Software and tools used

Code and scripts used to search and retrieve results from the databases
and archives

Packages used are:

TODO: Include citation to these packages.

-   [rvest](https://rvest.tidyverse.org/) package for scraping and
    downloading results from Google and Google Scholar searches.

-   [easyPubMed](https://cran.r-project.org/web/packages/easyPubMed/vignettes/getting_started_with_easyPubMed.html)
    package for searching and retrieving from PubMed.

-   [wosr](https://github.com/vt-arc/wosr) package for searching and
    retrieving from Web of Science.

-   [rscopus](https://github.com/muschellij2/rscopus) package for
    searching and retrieving from Scopus and EMBASE (?).

-   [medrxivr](https://github.com/ropensci/medrxivr) and
    [aRxiv](https://docs.ropensci.org/aRxiv/) packages for

*DANIEL: We could also do Rayyan, which is a free program for systematic
reviews. We can also use Covidence, but that requires a license. I have
one, but I guess it i not as open as Rayyan.* 

## Document selection

Inclusion criteria:

-   Any formal document with advice, guidance, tools, and/or
    recommendations for improving open collaboration (including
    documents where open collaboration practices are not the primary
    focus). We will use the definition of open collaboration from Forte
    and Lampe (2013) mentioned above.

Exclusion criteria:

-   Documents that do not report on specific open collaboration
    practices

### Stopping criteria

In terms of database searches, we run the final search 01/10/22. Hand searching
will be concluded when we reach conceptual saturation (i.e., when it is
determined that we are not identifying any new concepts/resources). The first
1000 records will be screened on Google.

DANIEL: why not search all the references? Do we want to have two people
review each paper or is it okay we search a database each? For this
study, I would think that it is okay not to have two reviewers, as it is
not a systematic reivew. It is more important to have more databases,
then double check each reference.

## Analysis Plan

### Data analysis approach

One author will extract data using a standardized and tested template via Google
Sheets. Data regarding the data source (e.g., author, title, publciation year),
open collaboration practices, and any other relevant information, will be
extracted. A second author will check extracted data. Extracted data will be
summarized with the descriptive analytical method described by Arksey and
O'Malley (2005).

TODO: Decide on how we will extract data 
Daniel: we could also use a
Google sheet instead - that is easier to share. If we use covidence, we
can also use the data extraction form there.

TODO: Decide on who will screen/extract data Daniel: I don't think we
have to decide who now. Ok to write as it is.

Extracted data will be summarized with the descriptive analytical method
described by Arksey and O'Malley (2005).

### Data analysis process

Data analysis will be managed in NVivo Version 12.0. The descriptive
analytical method is aimed at identifying and summarizing different open
collaboration practices.

### Credibility strategies

- Data extraction to be double-coded
- Screening and data extraction to be double-coded *or double-check?*
- Narrative synthesis to be conducted by several co-authors
- The review will be documented in accordance with the PRISMA-ScR Guidelines
- Preliminary results of the scoping review will be shared with groups of
medical researchers to understand their collaborative practices and discuss how
current practices can be shifted towards more open collaborative practices

### Please provide a short rationale for why you selected particular strategies and how they are appropriate given your study's aim(s), or specify your credibility strategies if not on the above list

In this project we will map out current practices of open collaboration and
available tools. Given the broad search terms, it was more important for us to
scan several databases than double-checking abstracts in few databases. The aim
was to understand and create several vignettes of possible research
collaborations, both open and closed, and this we conducted a narrative
synthesis from the studies.

### Reflection on your positionality (optional)

*No response*
