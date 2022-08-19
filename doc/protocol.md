---
title: Towards open collaboration in biomedical and health research: A scoping review
format: html
---

<!--TODO: Include badge link to OSF-->

## Study information

This project is focused on open collaboration and is being conducted
within the Science Collective. The overall aim of the Science Collective
is to build a technical and social environment that encourages and makes
it easy for science to be done in an open, rigorous, and collaborative
way. We define open collaboration using the definition by Forte and
Lampe (2013):

> "*an online environment that (a) supports the collective production of
> an artifact (b) through a technologically mediated collaboration
> platform (c) that presents a low barrier to entry and exit and (d)
> supports the emergence of persistent but malleable social
> structures.*" This scoping review will focus on current practices of
> open collaboration and open science in relation to collaboration in
> the field of biomedical and health research.

From our work in this field, we have experienced many different ways of
collaborating, but rarely in the form of open collaboration. With the
growing complexity and specialization in scientific practices and
methods, together with globalisation of health and environmental issues,
there is a great need for a paradigm shift in research collaboration to
be able to tackle these challenges.

### Research aims

The overarching aim of this scoping review is to identify current
practices of open collaboration in biomedical and health research.

The specific aims of this scoping review are to:

-   Provide an overview of current practices of or opinions about
    research collaboration that follow basic open principles (e.g.,
    transparency, accessibility)
-   Summarize existing online tools and resources available to improve
    open collaboration in research

### If helpful, please select the type of aim (non-exhaustive list):

Understanding

### Anticipated Duration

| Phase                               | Start      | End        |
|-------------------------------------|------------|------------|
| Overall                             | 2022-01-01 | 2023-12-31 |
| Research design and data collection | 2022-01-01 | 2022-11-31 |
| Screening resources                 | 2022-12-01 | 2023-06-01 |
| Analyses and manuscript writing     | 2023-06-01 | 2023-12-31 |

: Estimated timeline for project.

## Design plan

### Study design

Scoping review

### Sampling and case selection

An initial search strategy was developed in consultation with a research
librarian. Data will be collected via systematic searches of databases
and hand searches.

## Document data collection

### Document types

-   Open access journal articles published in peer-reviewed and
    non-peer-reviewed journals.
-   Websites, blogs, and other online resources.
-   Books

### Information sources and search terms

We will use these information sources and databases:

-   Formal publication repositories: SCOPUS, Web of Science, MEDLINE
    (via PubMed), and EMBASE

-   Preprint repositories: medRxiv, bioRxiv, and arXiv

-   Other dissemination repositories: Zenodo and figshare

-   Reference lists from extracted articles

Each repository has some small differences in how to use their search
terms, but in general, the search term we will use looks like:

``` text
(open) AND 
(science OR research) AND 
(collaborat* OR team OR cooperat*) AND 
(technolog* OR tool OR framework OR guideline OR principles OR practices OR systems OR resources)
```

### Eligibility criteria

-   5 years in the past, until approximately 2017-01-01, to capture
    current/most recent practices

-   Language: English

### Software and tools used

We will use R to search and retrieve results from the databases using
the following packages:

-   [easyPubMed](https://cran.r-project.org/web/packages/easyPubMed/vignettes/getting_started_with_easyPubMed.html)
    package for searching and retrieving from MEDLINE via PubMed.

-   [wosr](https://github.com/vt-arc/wosr) package for searching and
    retrieving from Web of Science.

-   [rscopus](https://github.com/muschellij2/rscopus) package for
    searching and retrieving from Scopus and EMBASE.

-   [medrxivr](https://github.com/ropensci/medrxivr) and
    [aRxiv](https://docs.ropensci.org/aRxiv/) packages for searching and
    retrieving from preprint repositories.

-   [zen4R](https://github.com/eblondel/zen4R) and
    [rfigshare](https://cran.r-project.org/web/packages/rfigshare/) for
    searching and retrieving from Zenodo and figshare.

## Document selection

Inclusion criteria:

-   Any published document with reporting on current open collaboration
    practices.
-   Any published document with advice, guidance, tools, and/or
    recommendations for improving open collaboration.

This includes any document where open collaboration practices are not
the primary focus. We will be guided by the definition of open
collaboration from Forte and Lampe (2013) mentioned above in determining
whether the records are relevant.

Exclusion criteria:

-   Documents that do not report on specific open collaboration
    practices.

### Stopping criteria

In terms of database searches, we aim to limit the search until the end
date as listed in the timeline table above. Searches will be concluded
when we reach conceptual saturation (i.e., when it is determined that we
are not identifying any new concepts/resources). Depending on the
quantity of records retrieved, even after further filtering, we may
randomly select a large enough sample that each person can go through
and manually review them. In the interests of feasibility, a maximum for
4 books will be selected and evaluated. Books will be selected based on
a consensus in the research group.

## Analysis Plan

### Data analysis approach

Data from all searches in online databases will be exported into text
files or CVS files for further processing including removal of
duplicates. Google Sheets will be used to manage records including
screening decisions.

At least two of us will extract data using a standardized and tested
template via Google Sheets. Data regarding the data source (e.g.,
author, title, publciation year), open collaboration practices, and any
other relevant information, will be extracted. Extracted data will be
summarized with the descriptive analytical method described by Arksey
and O'Malley (2005). The descriptive analytical method is aimed at
identifying and summarizing different open collaboration practices.

TODO: Add the template here.

Results will be presented in a descriptive way and general topics that
we extract from the sources will be grouped into common themes. We will
not do any formal analyses aside from descriptively listing the
perspectives or practices for doing open collaborative research.

### Credibility strategies

-   At least two authors will be involved in screening and data
    extraction
-   Narrative synthesis to be conducted by several authors
-   The review will be documented in accordance with the PRISMA-ScR
    Guidelines
-   Preliminary results of the scoping review will be shared with groups
    of biomedical and health researchers to understand their
    collaborative practices and discuss how current practices can be
    shifted towards more open collaborative practices

### Please provide a short rationale for why you selected particular strategies and how they are appropriate given your study's aim(s), or specify your credibility strategies if not on the above list

In this project, we will identify current practices of open
collaboration and available tools. Given the broad search terms, we
thought it more important to scan several databases rather than
double-checking abstracts in few databases. We chose the narrative
synthesis approach so that we could understand open collaboration
practices more deeply.

