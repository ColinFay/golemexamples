#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @importFrom shiny.i18n usei18n
#' @noRd
app_ui <- function(request) {
  # Request-local translator: renders the initial labels in the configured
  # default language without mutating the process-wide `i18n_for_pak`.
  i18n <- new_translator()
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # Your application UI logic
    fluidPage(
      # Inject the (read-only) translation table so the language can be
      # switched live on the client side.
      usei18n(i18n_for_pak),
      div(
        style = "float: right;",
        selectInput(
          inputId = "selected_language",
          label = i18n$t("label_change_lang"),
          choices = displayable_languages(),
          selected = get_default_language()
        )
      ),
      titlePanel(i18n$t("title_hello")),
      sidebarLayout(
        sidebarPanel(
          sliderInput(
            inputId = "bins",
            label = i18n$t("label_bins"),
            min = 1,
            max = 50,
            value = 30
          )
        ),
        mainPanel(
          plotOutput("distPlot")
        )
      )
    )
  )
}

#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function() {
  add_resource_path(
    'www',
    app_sys('app/www')
  )

  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys('app/www'),
      app_title = 'golemshinyi18n'
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert()
  )
}
