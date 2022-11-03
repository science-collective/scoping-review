https://doi.org/10.17605/OSF.IO/K9DR5

# Study information

## Title

Towards open collaboration in biomedical and health research: A scoping
review

## Description

Scientific research now almost always requires working with other
people. With the increasing emphasis on and demand for science to be
more open, how we collaborate together is a key component to making
science more open from the start of any project. But how do we
collaborate in an open and transparent way? What are the best practices
and tools we can use? What is an ideal collaborative workflow and how
close or far are we from this ideal in reality? This project aims to
address some of these questions.

From our work in the health research field, we have experienced many
different ways of collaborating, but rarely in the form of open
collaboration. With the growing complexity and specialization in
scientific practices and methods, together with globalisation of health
and environmental issues, there is a great need for a paradigm shift in
research collaboration to be able to tackle these challenges.

We define open collaboration using the definition as found in Forte and
Lampe (2013):

> "*an online environment that (a) supports the collective production of
> an artifact (b) through a technologically mediated collaboration
> platform (c) that presents a low barrier to entry and exit and (d)
> supports the emergence of persistent but malleable social
> structures.*" This scoping review will focus on current practices of
> open collaboration and open science in relation to collaboration in
> the field of biomedical and health research.

## Hypotheses

This is a scoping review and does not have explicit hypotheses. Our
overarching aim of this scoping review is to identify current practices
of open collaboration in biomedical and health research.

The specific aims of this scoping review are to:

-   Provide an overview of current practices of or opinions about
    research collaboration that follow basic open principles (e.g.,
    transparency, accessibility)

-   Summarize existing online tools and resources available to improve
    open collaboration in research

# Design plan

## Study type

Scoping review on literature relating to open collaboration.

## Blinding

No blinding is involved in this study, since this is a scoping review of
existing literature.

## Study design

This is a scoping review, so we are following the framework described by
Arksey and O'Malley
([DOI:10.1080/1364557032000119616](https://doi.org/10.1080/1364557032000119616))
and by Levac, Colquhoun, and O'Brien
([DOI:10.1186/1748-5908-5-69](https://doi.org/10.1186/1748-5908-5-69))
as well as the guidelines outlined in the PRISMA-ScR
([DOI:10.7326/M18-0850](https://doi.org/10.7326/M18-0850) statement.

# Sampling Plan

## Existing data

**Registration prior to creation of data**. As of the date of submission
of this research plan for preregistration, the data have not yet been
collected, created, or realized.

## Data collection procedures

We developed the initial search strategy in consultation with a research
librarian. We will collect the data via systematic searches of
databases, as well as some hand searches.

### Document selection

-   **Document types**:

    -   Open access journal articles published in peer-reviewed and
        non-peer-reviewed journals.
    -   Websites, blogs, and other online resources.
    -   Books

-   **Information sources and search terms**: We will use these
    information sources and databases:

    -   Formal publication repositories: SCOPUS, Web of Science, MEDLINE
        (via PubMed), and EMBASE
    -   Preprint repositories: medRxiv, bioRxiv, and arXiv
    -   Other dissemination repositories: Zenodo and figshare
    -   Reference lists from extracted articles

-   **Search terms**: Each repository has some small differences in how
    to use their search terms, but in general, the search term we will
    use looks like:

    > (open) AND (science OR research) AND (collaborat\* OR team OR
    > cooperat\*) AND (technolog\* OR tool OR framework OR guideline OR
    > principles OR practices OR systems OR resources)

-   **Inclusion criteria**: This includes any document where open
    collaboration practices are not the primary focus. We will be guided
    by the definition of open collaboration from Forte and Lampe (2013)
    mentioned above in determining whether the records are relevant.

    -   Any published document with reporting on current open
        collaboration practices.
    -   Any published document with advice, guidance, tools, and/or
        recommendations for improving open collaboration.
    -   Article language in English.

-   **Exclusion criteria**:

    -   Documents that do not report on specific open collaboration
        practices.

    -   Documents published \>5 years in the past (defined as before
        2017-01-01) to capture current/most recent practices.

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

## Sample size

We aim to identify at least 1000 articles in the initial database
search.

## Sample size rationale

The sample size is based on our available time and resources to work on
this project.

## Stopping rule

In terms of database searches, we aim to limit the search until the end
date (maximum 2022-11-31). Searches will be concluded when we reach
conceptual saturation (i.e., when it is determined that we are not
identifying any new concepts/resources). Depending on the quantity of
records retrieved, even after further filtering, we may randomly select
a sample that each person can go through and manually review them. In
the interests of feasibility, a maximum for 4 books will be selected and
evaluated. Books will be selected based on consensus in the research
group.

# Variables

## Measured variables

The primary "variables" of interest will be the article title, abstract,
topic list, and full length article including content relating to open
collaboration. In addition to these variables, we will also obtain
article metadata, such as publication date, URL/DOI, and author list.

# Analysis Plan

## Statistical models

Since this is a scoping review, the purpose is to explore a research
topic and we will not be conducting any statistical modeling.

All data obtained from all searches in online databases will be exported
into text files or CVS files for further processing including removal of
duplicates.

At least two of us will extract data using a standardized and tested
template. Data regarding the data source (e.g., author, title,
publication year), open collaboration practices, and any other relevant
information, will be extracted. Extracted data will be summarized with
the descriptive analytical method described by Arksey and O'Malley
(2005). The descriptive analytical method is aimed at identifying and
summarizing different open collaboration practices.

Results will be presented in a descriptive way and general topics that
we extract from the sources will be subjectively grouped into common
themes. We will not do any formal analyses aside from descriptively
listing the perspectives or practices for doing open collaborative
research.

# Other

## Anticipated duration

+-------------------------------------+------------+------------+
| Phase                               | Start      | End        |
+=====================================+============+============+
| Overall                             | 2022-01-01 | 2023-12-31 |
+-------------------------------------+------------+------------+
| Research design and data collection | 2022-01-01 | 2022-11-31 |
+-------------------------------------+------------+------------+
| Screening resources                 | 2022-12-01 | 2023-06-01 |
+-------------------------------------+------------+------------+
| Analyses and manuscript writing     | 2023-06-01 | 2023-12-31 |
+-------------------------------------+------------+------------+

: Estimated timeline for project.

Estimated timeline for project.

# References

## 
