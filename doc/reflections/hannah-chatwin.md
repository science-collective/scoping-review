# Reflections on co-working

## Friday 2022-04-11

aRxiv:

-   "Open research"" produced many irrelevant results
-   Forgot to apply date filter - Can re-run once when we have confirmed
    that the search strategy is suitable

rScopus:

-   scopus_search doesn't attach abstracts, and I couldn't get
    abstract_retrieval to work (seemed to produce all metadata other
    than the abstract)
-   Many irrelevant journal articles due to abstracts mentioning
    "Data/material being available on the Open Science Framework" --
    Should we filter this out now or later (manually)?
-   Do we want to exclude "corrections" and "corrigendum" results?
-   **Next time: Find out how to attach abstracts**

## Friday 2022-05-08

-   Still unsure what we are expecting from the data, though I guess
    that is the point!
-   I am super keen on Luke's idea RE: using a broad search strategy and
    then using filtering afterwards, once we know what sort of search
    results we get
-   Struggling to get up and running with rscopus, but just need more
    time

## Thursday 2022-07-04

-   I'm wondering how "systematic" we should be in conducting the
    database searches, without turning this into a systematic review
-   Updated protocol
-   Trialed search of MEDLINE (via Ovid)
-   Need to get a better sense of the data analysis approach (e.g., come
    up with step-by-step guide to share with SC)

## Friday 2023-08-04

-   Today, I worked mostly on building a list of terms we will automatically exclude
-   This list is provided via https://github.com/science-collective/scoping-review/issues/56#issuecomment-1576677260
-   I wrote some preliminary code on this and created a Pull Request to upload this to R/
-   Note: These terms will be particularly helpful with the PubMed search (i.e., 947 to 583 results) but less so with the Zenodo search (i.e., only removed a handful of records)
-   It appears that most of the Zenodo search results include "open science" and "open source" in the title
-   I didn't get a chance to work on writing but I will start with this next time
