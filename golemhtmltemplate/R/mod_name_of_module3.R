#' name_of_module3 UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
#' @importFrom DT DTOutput
mod_name_of_module3_ui <- function(id){
  ns <- NS(id)
  tagList(
    DTOutput(ns("dt"))
  )
}
    
#' name_of_module3 Server Function
#'
#' @importFrom shinipsum random_DT
#' @importFrom DT renderDT
#' @noRd 
mod_name_of_module3_server <- function(input, output, session){
  ns <- session$ns
 
  output$dt <- renderDT({
    random_DT(10, 5)
  })
}
    
## To be copied in the UI
# 
    
## To be copied in the server
# 
 
