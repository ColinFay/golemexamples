#' name_of_module1 UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_name_of_module1_ui <- function(id) {
  ns <- NS(id)
  tagList(
    h1("golemshinymanager"),
    verbatimTextOutput(ns("auth_output"))
  )
}

#' name_of_module1 Server Functions
#'
#' @noRd
mod_name_of_module1_server <- function(id, res_auth) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns
    output$auth_output <- renderPrint({
      reactiveValuesToList(res_auth)
    })
  })
}

## To be copied in the UI
# mod_name_of_module1_ui("name_of_module1_ui_1")

## To be copied in the server
# mod_name_of_module1_server("name_of_module1_ui_1")