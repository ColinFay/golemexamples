#' name_of_module5 UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList plotOutput htmlTemplate
mod_name_of_module5_ui <- function(id){
  ns <- NS(id)
  tagList(
    htmlTemplate(
      app_sys("app/www/imgrow.html"),
      one = plotOutput(ns("one")),
      two = plotOutput(ns("two")),
      three = plotOutput(ns("three"))
    )
  )
}
    
#' name_of_module5 Server Function
#' @importFrom shinipsum random_ggplot
#' @importFrom shiny renderPlot
#' @noRd 
mod_name_of_module5_server <- function(input, output, session){
  ns <- session$ns
  
  output$one <- renderPlot({
    random_ggplot()
  })
  
  output$two <- renderPlot({
    random_ggplot()
  })
  
  output$three <- renderPlot({
    random_ggplot()
  })
  
}
    
## To be copied in the UI
# 
    
## To be copied in the server
# 
 
