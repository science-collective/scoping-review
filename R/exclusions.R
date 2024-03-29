#' Exclude titles based on further criteria.
#'
#' @param data Reference/sources data frame.
#'
#' @return A tibble.
#'
#' @examples
#' readr::read_csv(here::here("data/records.csv")) |> exclude_from_title() |> dplyr::select(title) |> View()
exclude_from_title <- function(data) {
# TODO: Use ggcohort to track what is removed?
  data |>
    # Order so newest date is first, so distinct drops old duplicate titles.
    dplyr::arrange(dplyr::desc(publication_date)) |>
    dplyr::distinct(title, .keep_all = TRUE) |>
    # Items related to surgery
    exclude(title, "surgery|surgical|angle glaucoma|fracture|abdomen|abdominal|wound|vein|resection|urethroplasty|ectomy|inguinal|aortic|rhinoplasty|lumbar") |>
    # Items related to study designs
    exclude(title, "open( |-|, )(web-based|placebo|cross-sectional)") |>
    # Items related to healthcare or health study design
    exclude(title, "open( |-|, )(covid|defecation|comparative|cohort|pilot|double|label|trial|radical|radiology|acute|study|weighing|registry|care|selective|bay|chromatin|bite|repair|single-arm|wedge)|rehab|neuroscience|rt-qpcr|randomi[zs]ed|neuronal|neurons|technique|heart|transforaminal") |>
    # General health
    exclude(title, "mental health") |>
    # Items related to biology
    exclude(title, "open( |-|, )(microfluidic|membrane|pan-|texture)") |>
    exclude(title, "faecal|faeces") |>
    # Items related to government, politics, or social
    exclude(title, "open( |-|, )(government|governance|dialog(ue)?|letter|spaces|call|people|universit(y|ies)|stewardship|space|labour|employment)") |>
    exclude(title, "kindergarten") |>
    # Items related to electronics or tech
    exclude(title, "open( |-|, )(electronics|circuit|shell|backend|set|iot|user|hollow|rdf)|hardware|blockchain|resonator|nanoparticle|robotic") |>
    # Items related to physics or engineering
    exclude(title, "heavy-flavor|resonator|nanoparticle|robotic|x-ray|open( |-)(torque|industrial|clusters|universe|systems|quantum|polar|magnetic|architectur(e|al))|nanofluidic|LIGO") |>
    # Items related to specific software
    exclude(title, "matlab|pathofusion|mrqy|imagej|opsef|open-tes|open-unmix|rhizovision|opencitations|magpie|licsbas|sunpy|tigl|nutmeg|parasol|autotriage|OpInMod|ImmGen|QuPath|OpenSIM|epiq|CAROUSEL|CamPype|CalcUS|BioSounds|BioMAT|CRIMSON|Crop2ML|CyberSco\\.Py|UCNS3D|DOP|PRISMS-Plasticity TM|MUSE|DIAGRAPH|PROCSIM|EntropyHub|DIPEND") |>
    # A lot of the specific software follows the pattern "TOOLNAME:". So remove
    # any items that follow that pattern.
    exclude(title, "^\\w+:") |>
    # Items related to dissemination
    exclude(title, "open( |-|, )(access|review(er)?)|publishing|communication") |>
    # Items related to education
    exclude(title, "open( |-|, )(textbooks?|doors?|education(al)?|seminar|learning|schools|course|book|pedagogy|teaching|learning|online)") |>
    exclude(title, "mooc|massive open online") |>
    # Items related to chemistry
    exclude(title, "open( |-|, )(cheminformatics)") |>
    exclude(title, "spectral") |>
    # Items related to industry/business
    exclude(title, "open( |-|, )(leader(ship)?|marketplace|innovation|pit|economy|loop)") |>
    # Trade, economics, supply chains
    exclude(title, "trade openness|e-?SCM|supply chain|transport") |>
    # Items related to ecology/environment
    exclude(title, "open( |-|, )(water|air|coastal|metal|forecast(ing)?|field|pollinated|hydroponic|fermentation|biomass|mapping|landscape)|hunter|burning|land|green|environmental|climate|earth|ecosystem") |>
    # Items related to sports, games
    exclude(title, "open( |-|, )(tennis|games|competition|play|US)") |>
    # Items related to misc
    exclude(title, "open( |-|, )(end(ed)?|issues|synthesis|invitation|domain|platform|monitoring|questions|charm|porous|volume|case|top|disclosure|network|up|to |forensic|challenges?|days?|symposium|plan|house|model|multiscale|purpose)") |>
    exclude(title, "opened") |>
    # Random items that probably shouldn't be in the database
    exclude(title, "(ISSN|ISBN) \\d+|Chief Editor") |>
    # Journal specific things
    exclude(title, "editorial|reply") |>
    # Software/data projects
    exclude(title, "(R [Pp]ackages?|open( |-)database)") |>
    # Genomics
    exclude(title, "open( |-) (human)? ?(genom(ic|e)s?|genetics?)") |>
    # exclude(title, "covid(-19)?|SARS-CoV-2") |>
    # Things specific to datasets that are open
    exclude(title, "open( |-)(datasets?|data sets?|data portal|data framework|data platform|data resource|data exploration|system)") |>
    exclude(title, "data formats?|big data platform") |>
    # Things specific to software that are open
    exclude(title, "open( |-)source( |-)(library|simulation|machine learning|(software )?platform|Python (library|package)|tool |Python)") |>
    exclude(title, "text processing") |>
    exclude(title, "an open( |-)source software") |>
    # Security
    exclude(title, "cyber( |-)?security|safety")
}

exclude <- function(data, variable, criteria) {
  data |>
    dplyr::filter(stringr::str_detect(
      string = {{variable}},
      pattern = stringr::regex(criteria, ignore_case = TRUE),
      negate = TRUE
    ))
}
