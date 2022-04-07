# Contributing to scoping-review

This outlines how to propose a change to scoping-review. 

<!-- TODO: Eventually convert this over into its own generic document that other files can refer to? -->

If you are a beginner or unfamiliar with using RStudio and GitHub together for
writing and collaborating, check out the beginner guide (TODO: Create guide and add link).

## Adding links, references, or resources to review

<!-- TODO: Add explanation once its been determined. -->

## Fixing typos

You can fix typos, spelling mistakes, or grammatical errors in the documentation
directly using the GitHub web interface or by using the Git workflow (TODO: Add link to this workflow).

## Bigger changes

If you want to make a bigger change, it's a good idea to first file an issue and
make sure someone from the team agrees that it’s needed.

### Pull request process

*   Fork the package and clone onto your computer. If you haven't done this before, we recommend using `usethis::create_from_github("science-collective/scoping-review", fork = TRUE)`.

*   Create a Git branch for your pull request (PR). We recommend using `usethis::pr_init("brief-description-of-change")`.
    For more details on using the usethis PR helpers, read this [webpage](https://usethis.r-lib.org/articles/pr-functions.html).

*   Make your changes, commit to git, and then create a PR by running
    `usethis::pr_push()`, and following the prompts in your browser.
    The title of your PR should briefly describe the change.
    The body of your PR should contain `Fixes #issue-number`.

## Code of Conduct

Please note that the scoping-review project is released with a
[Contributor Code of Conduct](CODE_OF_CONDUCT.md). By contributing to this
project you agree to abide by its terms.
