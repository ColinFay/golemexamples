#' Session/request-local translator
#'
#' Returns a private copy of the shared `i18n_for_pak` template, set to the
#' requested language. Cloning is what makes the app safe under concurrency:
#' `set_translation_language()` mutates its object, and `i18n_for_pak` is a
#' single instance shared by every session in the R process. Mutating it
#' directly would let one user's language switch leak into another user's
#' session. Each session/request works on its own clone instead.
#'
#' @param language Language code to display. Defaults to the app default.
#' @return A `shiny.i18n::Translator` set to `language`.
#' @noRd
new_translator <- function(language = get_default_language()) {
  tr <- i18n_for_pak$clone(deep = TRUE)
  tr$set_translation_language(language)
  tr
}

#' Languages that can actually be displayed
#'
#' The first language declared in `inst/translation.json` (`"id"`) is the
#' reference key used in `t()` calls, not a real language, so it must never
#' be offered to the user nor displayed.
#'
#' @return Character vector of displayable language codes.
#' @noRd
displayable_languages <- function() {
  setdiff(
    i18n_for_pak$get_languages(),
    i18n_for_pak$get_key_translation()
  )
}

#' Default display language for the app
#'
#' Read from the golem option set in [run_app()]; falls back to the first
#' displayable language if unset or invalid.
#'
#' @return A single language code.
#' @noRd
get_default_language <- function() {
  displayable <- displayable_languages()
  lang <- golem::get_golem_options("default_language")
  if (is.null(lang) || !lang %in% displayable) {
    lang <- displayable[[1]]
  }
  lang
}
