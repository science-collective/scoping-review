#' Engine-specific search terms.
#'
#' @param engine The "engine" to use for the search terms, like PubMed or Zenodo.
#'
#' @return A character vector.
#'
#' @examples
#' search_terms("pubmed")
search_terms <- function(engine) {
  # Avoid using wildcards in terms, since they slow things down when sending a query
  switch(engine,
    general = "(open) AND (science OR research) AND (collaborat* OR team OR cooperat*) AND (technolog* OR tool OR framework OR guideline OR principles OR practices OR systems OR resources)",
    pubmed = "(open[Title]) AND (science OR research) AND (collaborate OR collaboration OR collaborating OR team OR cooperate OR cooperation OR cooperating) AND (technology OR technologies OR tool OR framework OR guideline OR principles OR practices OR systems OR resources) AND (y_5[Filter])",
    # Doesn't like the wildcard...
    zenodo = "(title:open) AND (science OR research) AND (collaborate OR collaboration OR collaborating OR team OR cooperate OR cooperation OR cooperating) AND (technology OR technologies OR tool OR framework OR guideline OR principles OR practices OR systems OR resources)",
    # For some reason, arxiv doesn't like the * wildcard...
    arxiv = '(ti:open) AND (all:science OR all:research) AND (all:collaborate OR all:collaborating OR all:collaboration OR all:team OR all:cooperate OR all:cooperating OR all:cooperation) AND (all:technology OR all:technologies OR all:tool OR all:framework OR all:guideline OR all:principles OR all:practices OR all:systems OR all:resources)',
    # Changing according to the new tutorial: https://docs.ropensci.org/medrxivr/articles/medrxivr.html
    medrxiv = list(c("open"), c("science", "research"), c("collaborate","collaborating", "collaboration", "team", "cooperate", "cooperating", "cooperation"), c("technology", "technologies", "tool","framework", "guideline", "principles", "practices", "systems", "resources"))
  )
}
