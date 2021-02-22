#' name_of_module1 UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList plotOutput
mod_name_of_module1_ui <- function(id){
  ns <- NS(id)
  tagList(
    plotOutput(ns("plot"))
  )
}
    
#' name_of_module1 Server Function
#'
#' @importFrom shinipsum random_ggplot
#' @importFrom shiny renderPlot
#' @noRd 
mod_name_of_module1_server <- function(input, output, session){
  ns <- session$ns
  output$plot <- renderPlot({
    random_ggplot()
  })
}
    
## To be copied in the UI
# 
    
## To be copied in the server
# 
 
