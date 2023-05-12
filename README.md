# Open collaboration within scientific research: Where we are, where we should be, and how to get there

[![OSF
DOI](https://img.shields.io/badge/OSF-10.17605%252FOSF.IO%252FK9DR5-blue)](https://doi.org/10.17605/OSF.IO/K9DR5)

The overall aim of the Science Collective is to build a technical and
social environment that encourages and makes it easy for science to be
done in an open, rigorous, and collaborative way. Since scientific
research now almost always requires working with other people. With the
increasing emphasis on and demand for science to be more open, how we
collaborate together is a key component to making science more easily
open from the start of any project. But how do we collaborate in an open
and transparent way? What are the best practices and tools we can use?
What is an ideal collaborative workflow and how close or far are we from
this ideal in reality? This project aims to address some of these
questions.

Our three general outputs for this project are:

1.  A scoping review looking for knowledge on current best practices and
    how researchers collaborate presently.

    -   Largely this is to map out the space and provide a list of
        resources for ourselves and others to learn what we already do
        or know about collaborating.
    -   The scoping review is more than just the review itself, but also
        the way we work together and the code we use to do the tasks for
        the output.
    -   A side aim is to make this output as automated as possible using
        R code to extract and present the results into a website format.

2.  An opinionated and theoretical paper on what an ideal open
    collaboration workflow and setup should look like.

3.  A comparison of where we are right now and where we should be, and
    how we can start moving towards the ideal.

Another output(s) we are considering include:

-   A survey sent out determining what researchers and research groups
    currently do for collaboration.

## Brief description of the folder and file contents

The following folders contain:

-   `data/`: Contains the processed and extracted reference and resource
    lists for the scoping review.
-   `data-raw/`: Contains the raw data obtained from the first pass of
    the scoping review.
-   `doc/`: Contains the documents for the review, protocol, and the
    other output documents.
-   `R/`: R scripts for extracting the references for the scoping review
    as well as for project management.

## Installing and updating sources

You'll need to install all the packages for this project with:

``` r
# install.packages("pak")
pak::pak()
```

And to rebuild the sources, run:

``` r
targets::tar_make()
```

## Contributing to this project

If you are interested in contributing, read our [contributing
guidelines](CONTRIBUTING.md) for more details on how and what you can
do.

## Code of Conduct

Please note that the scoping-review project is released with a
[Contributor Code of
Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.
