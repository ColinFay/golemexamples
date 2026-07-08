#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @importFrom shiny.i18n update_lang
#' @importFrom graphics hist
#' @noRd
app_server <- function( input, output, session ) {
  # Your application server logic

  # Switch the language live when the user picks another one.
  observeEvent(input$selected_language, {
    update_lang(input$selected_language, session)
  })

  output$distPlot <- renderPlot({
    x <- datasets::faithful[, 2]
    bins <- seq(min(x), max(x), length.out = input$bins + 1)

    hist(
      x,
      breaks = bins,
      col = "darkgray",
      border = "white",
      main = i18n_for_pak$t("title_histogram"),
      xlab = i18n_for_pak$t("label_frequency"),
      ylab = i18n_for_pak$t("label_frequency")
    )
  })
}
