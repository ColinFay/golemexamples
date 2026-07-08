#' Run the Shiny Application
#'
#' @param language Default display language code. Must be one of the
#'   non-key languages declared in `inst/translation.json` (e.g. "en", "pl").
#'   It is exposed to the app through golem options rather than mutating the
#'   shared translator, so concurrent sessions stay isolated.
#' @inheritParams shiny::shinyApp
#'
#' @export
#' @importFrom shiny shinyApp
#' @importFrom golem with_golem_options
run_app <- function(
  onStart = NULL,
  options = list(),
  enableBookmarking = NULL,
  uiPattern = "/",
  language = "en"
) {
  with_golem_options(
    app = shinyApp(
      ui = app_ui,
      server = app_server,
      onStart = onStart,
      options = options,
      enableBookmarking = enableBookmarking,
      uiPattern = uiPattern
    ),
    golem_opts = list(default_language = language)
  )
}
