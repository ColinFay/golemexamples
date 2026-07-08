#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @importFrom shiny.i18n usei18n
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # Your application UI logic
    fluidPage(
      # Inject the shiny.i18n translations so the language can be
      # switched live on the client side.
      usei18n(i18n_for_pak),
      div(
        style = "float: right;",
        selectInput(
          inputId = "selected_language",
          label = i18n_for_pak$t("label_change_lang"),
          # The key language ("id") is a reference, not a displayable
          # language, so keep it out of the dropdown.
          choices = setdiff(
            i18n_for_pak$get_languages(),
            i18n_for_pak$get_key_translation()
          ),
          selected = "en"
        )
      ),
      titlePanel(i18n_for_pak$t("title_hello")),
      sidebarLayout(
        sidebarPanel(
          sliderInput(
            inputId = "bins",
            label = i18n_for_pak$t("label_bins"),
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
