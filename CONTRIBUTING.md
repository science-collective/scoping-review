# Guide to contributing to the scoping-review project

This document serves as a starting point to know what and how you might
contribute to this project. It starts with covering the most common thing you
will encounter as a contributor: Not knowing where to start or what to work on.
This includes us too, since this project is largely a side project we work on.

<!-- TODO: Eventually convert this over into its own generic document that other files can refer to? -->

Before getting further into the document, there are a few things you will need to
know how to use in order to contribute.

- At a *minimum*, you need to know how to use the GitHub interface for
contributing. If you are just starting out, check out the [GitHub's
Quickstart](https://docs.github.com/en/get-started/quickstart). Specifically, read
these:
    - Get a quick overview of using GitHub with their 
    ["Hello World"](https://docs.github.com/en/get-started/quickstart/hello-world) guide.
    - We follow a popular style of contributing called the "branch-based workflow",
    described in the guide [GitHub flow](https://docs.github.com/en/get-started/quickstart/github-flow).
    - We use GitHub for many aspects of communication, described in the guide
    [Communicating on GitHub](https://docs.github.com/en/get-started/quickstart/communicating-on-github).
- For larger contributions, we strongly recommend using RStudio with Git
(connected to GitHub) to write text or code. More details and resources on this 
are later in this guide.

## Not sure where to start?

Because this is a side project for us, we often work on this maybe once or twice
a month. So we often forget where we are, what's been done so far, what's the
status of the project, and what we should work on next. So let's break it down
into two topics: What's been done so far and what to work on.

### What's been done so far

Newly entering or returning to a project after some time is always a bit disorienting.
So, if you are in this situation or feel a bit overwhelmed or confused about what's
been done or what the status of the project is, review this documents in this order:

1. [ROADMAP](ROADMAP.md): This document is the first place to look to see what's 
been done and what the next steps are. It can help

        - review in order:
            - roadmap, commit history, open PRs, closed PR

### What to work on next

- review in order:
    - readme, contributing, roadmap
- See typos in these docs? fix them
- inside roadmap contains some help to know where to work on
    - protocol.md
- See the next sections below on dtails of what to contribute and how to do it.
    
## Types of contributions

- types of contributions
    - adding to discussions on issues or in Discord
    - reviewing and, if appropriate, approving open PRs
    - proofreading and fixing typos/grammar in text
    - reviewing code, running it yourself, and fixing bugs/reformatting, adding code comments
    - adding larger amounts of new text or code 
- how to contribute
    - for small things like fixing typos, grammar, and adding code comments/formatting use the GitHub interface.
        - create a branch (if you have access, otherwise create a fork first which GitHub should do automatically)
        - make the changes in the branch, commit the changes (with an appropriate comment)
        - create a Pull Request of your branch 
    - for running code or for adding more new text or code
        - Wh


## Not sure where to start or continue?

Considering this is a side project for many of us that we

## Adding links, references, or resources to review

<!-- TODO: Add explanation once its been determined. -->

## Types of contributions

### Fixing typos

You can fix typos, spelling mistakes, or grammatical errors in the documentation
directly using the GitHub web interface or by using the Git workflow (TODO: Add link to this workflow).

### Bigger changes

If you want to make a bigger change, it's a good idea to first file an issue and
make sure someone from the team agrees that it’s needed.

## Workflow for adding text or code



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
