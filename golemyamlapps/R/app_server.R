#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @import ggplot2
#' @noRd
app_server <- function( input, output, session ) {
  # Getting the theme function from {ggplot2}
  gg_theme <- getFromNamespace(
    get_golem_config("ggtheme"),
    ns = "ggplot2"
  )

  output$plot <- renderPlot({
    # Getting the dataset
    get(
      get_golem_config("dataset")
    ) %>%
      ggplot2::ggplot(
        # Using .data for non standard selection in `ggplot()`
        ggplot2::aes(x = .data[[
          get_golem_config("column")
        ]])
        ) +
      ggplot2::geom_bar() +
      gg_theme()

  })
}
