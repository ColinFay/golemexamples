#' my_third_module UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_my_third_module_ui <- function(id){
  ns <- NS(id)
  fluidRow(
    align = "center",
    tags$h3("Browse source code"),
    tags$a(href = "https://github.com/ColinFay/golemexamples/tree/master/golemnotifyjs", "github.com/ColinFay/golemexamples/golemnotifyjs")
  )
}
    
#' my_third_module Server Functions
#'
#' @noRd 
mod_my_third_module_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_my_third_module_ui("my_third_module_ui_1")
    
## To be copied in the server
# mod_my_third_module_server("my_third_module_ui_1")
