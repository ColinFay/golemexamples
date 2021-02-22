#' name_of_module1 UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_name_of_module1_ui <- function(id){
  ns <- NS(id)
  tagList(
    sliderInput(ns("n"),"n", 1, 150, 75), 
    plotOutput(ns("plot"))
  )
}
    
#' name_of_module1 Server Function
#'
#' @noRd 
mod_name_of_module1_server <- function(input, output, session){
  ns <- session$ns
  output$plot <- renderPlot({
    plot(head(iris, input$n))
  })
}
    
## To be copied in the UI
# 
    
## To be copied in the server
# 
 
