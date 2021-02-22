#' global_dash UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_global_dash_ui <- function(id){
  ns <- NS(id)
  
}
    
#' global_dash Server Function
#'
#' @noRd 
mod_global_dash_server <- function(input, output, session){
  ns <- session$ns
 
}
    
## To be copied in the UI
# mod_global_dash_ui("global_dash_ui_1")
    
## To be copied in the server
# callModule(mod_global_dash_server, "global_dash_ui_1")
 
