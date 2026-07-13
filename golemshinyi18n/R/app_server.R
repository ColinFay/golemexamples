#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @importFrom shiny.i18n update_lang
#' @importFrom graphics hist
#' @noRd
app_server <- function( input, output, session ) {
  # Per-session translator: a private clone of the shared template, so
  # switching language here never affects any other concurrent session.
  # It re-derives whenever the user picks another language.
  i18n <- reactive({
    lang <- input$selected_language
    if (is.null(lang)) lang <- get_default_language()
    new_translator(lang)
  })

  # Switch the language live in the browser for every UI-embedded string.
  observeEvent(input$selected_language, {
    update_lang(input$selected_language, session)
  })

  output$distPlot <- renderPlot({
    tr <- i18n()
    x <- datasets::faithful[, 2]
    bins <- seq(min(x), max(x), length.out = input$bins + 1)

    hist(
      x,
      breaks = bins,
      col = "darkgray",
      border = "white",
      main = tr$t("title_histogram"),
      xlab = tr$t("label_frequency"),
      ylab = tr$t("label_frequency")
    )
  })
}
