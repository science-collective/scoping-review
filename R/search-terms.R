#' Engine-specific search terms.
#'
#' @param engine The "engine" to use for the search terms, like PubMed or Zenodo.
#'
#' @return A character vector.
#'
#' @examples
#' search_terms("pubmed")
search_terms <- function(engine) {
  switch(engine,
    general = "(open) AND (science OR research) AND (collaborat* OR team OR cooperat*) AND (technolog* OR tool OR framework OR guideline OR principles OR practices OR systems OR resources)",
    pubmed = "(open[Title]) AND (science OR research) AND (collaborat* OR team OR cooperat*) AND (technolog* OR tool OR framework OR guideline OR principles OR practices OR systems OR resources) AND (y_5[Filter])",
    zenodo = "(title:open) AND (science OR research) AND (collaborat* OR team OR cooperat*) AND (technolog* OR tool OR framework OR guideline OR principles OR practices OR systems OR resources)",
    wos = "(TI=(open)) AND ((ALL=(science)) OR ALL=(research)) AND (((ALL=(collaborat*)) OR ALL=(team)) OR ALL=(cooperat*)) AND ((((((((ALL=(technolog*)) OR ALL=(tool)) OR ALL=(framework)) OR ALL=(guideline)) OR ALL=(principles)) OR ALL=(practices)) OR ALL=(systems)) OR ALL=(resources))",
    # For some reason, arxiv doesn't like the * wildcard... #Daniel: okay not to include. We will just state why here.
    arxiv = '(ti:open) AND (all:science OR all:research) OR (all:collaborate OR all:collaborating OR all:collaboration OR all:team OR all:cooperate OR all:cooperating OR all:cooperation) AND (all:technology OR all:technologies OR all:tool OR all:framework OR all:guideline OR all:principles OR all:practices OR all:systems OR all:resources)'
    #Changing according to the new tutorial: https://docs.ropensci.org/medrxivr/articles/medrxivr.html
    medrxiv = list(c("open"), c("science", "research"), c("collaborate","collaborating", "collaboration", "team", "cooperate", "cooperating"), c("technology", "technologies", "tool","framework", "guideline", "principles", "practices", "systems","resources"))
  )
}
