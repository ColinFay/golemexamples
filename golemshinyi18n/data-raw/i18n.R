## code to prepare `i18n` dataset goes here
##
## The first language listed in inst/translation.json ("id") is used as the
## reference key, so the app calls i18n_for_pak$t("title_hello") instead of
## referencing the English text directly. We set the default *display*
## language to "en" (the key language "id" must never be displayed).
i18n_for_pak <- shiny.i18n::Translator$new(
  translation_json_path = "inst/translation.json"
)
i18n_for_pak$set_translation_language("en")
usethis::use_data(i18n_for_pak, overwrite = TRUE)
