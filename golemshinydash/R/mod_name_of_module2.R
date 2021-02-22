#' name_of_module2 UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_name_of_module2_ui <- function(id){
  ns <- NS(id)
  tagList(
    sliderInput(ns("n"),"n", 1, 150, 75), 
    DT::DTOutput("dt")
  )
}
    
#' name_of_module2 Server Function
#'
#' @noRd 
mod_name_of_module2_server <- function(input, output, session){
  ns <- session$ns
  output$dt <- DT::renderDT({
    head(iris, input$n)
  })
}
    
## To be copied in the UI
# 
    
## To be copied in the server
# 
 
