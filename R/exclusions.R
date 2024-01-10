#' Exclude titles based on further criteria.
#'
#' @param data Reference/sources data frame.
#'
#' @return A tibble.
#'
#' @examples
#' readr::read_csv(here::here("data/records.csv")) |> exclude_from_title() |> View()
exclude_from_title <- function(data) {
# TODO: Use ggcohort to track what is removed?
  data |>
    # Items related to surgery
    exclude(title, "surgery|surgical|angle glaucoma|fracture|abdomen|abdominal|wound|vein|resection|urethroplasty|ectomy|inguinal|aortic") |>
    # Items related to healthcare or health study design
    exclude(title, "open( |-|, )(covid|defecation|comparative|cohort|pilot|double|label|trial|radical|radiology|acute|study|weighing|registry|care|selective|bay|chromatin|bite|repair|single-arm|wedge)|rehab|neuroscience|rt-qpcr|randomi[zs]ed|neuronal|neurons") |>
    # Items related to biology
    exclude(title, "open( |-|, )(microfluidic|membrane|pan-)") |>
    # Items related to government, politics, or social
    exclude(title, "open( |-|, )(government|governance|dialog(ue)?|letter|spaces|call|people|universit(y|ies)|stewardship|space)") |>
    # Items related to electronics or tech
    exclude(title, "open( |-|, )(electronics|circuit|shell|backend|set|iot|user|hollow|rdf)|hardware|blockchain|resonator|nanoparticle|robotic") |>
    # Items related to physics or engineering
    exclude(title, "heavy-flavor|resonator|nanoparticle|robotic|x-ray|open( |-)(clusters|universe|systems|quantum|polar|magnetic|architectur(e|al))|nanofluidic") |>
    # Items related to specific software
    exclude(title, "matlab|pathofusion|mrqy|imagej|opsef|open-tes") |>
    # Items related to dissemination
    exclude(title, "open( |-|, )(access|review(er)?)|publishing|communication") |>
    # Items related to education
    exclude(title, "open( |-|, )(textbooks?|doors?|education(al)?|seminar|learning|schools|course|book)|mooc|massive open online") |>
    # Items related to chemistry
    exclude(title, "open( |-|, )(cheminformatics)") |>
    # Items related to industry/business
    exclude(title, "open( |-|, )(leader(ship)?|marketplace|innovation|pit|economy|loop)") |>
    # Items related to ecology/environment
    exclude(title, "open( |-|, )(water|air|coastal|metal|forecast(ing)?|field|pollinated|hydroponic|fermentation|biomass|mapping|landscape)|hunter") |>
    # Items related to sports, games
    exclude(title, "open( |-|, )(tennis|games|competition|play)") |>
    # Items related to misc
    exclude(title, "open( |-|, )(end(ed)?|issues|synthesis|invitation|domain|platform|monitoring|questions|charm|porous|volume|case|top|disclosure|network|up|to |forensic|challenges|days?|symposium|plan|house|model)") |>
    # Random items that probably shouldn't be in the database
    exclude(title, "(ISSN|ISBN) \\d+|Chief Editor")
}

exclude <- function(data, variable, criteria) {
  data |>
    dplyr::filter(stringr::str_detect(
      string = {{variable}},
      pattern = stringr::regex(criteria, ignore_case = TRUE),
      negate = TRUE
    ))
}
