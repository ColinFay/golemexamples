## code to prepare `i18n` dataset goes here
## 
i18n_for_pak <- shiny.i18n::Translator$new(
  translation_json_path = "inst/translation.json"
)
usethis::use_data(i18n_for_pak, overwrite = TRUE)
