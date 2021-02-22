#' name_of_module2 UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList textOutput
mod_name_of_module2_ui <- function(id){
  ns <- NS(id)
  tagList(
    textOutput(ns("text"))
  )
}
    
#' name_of_module2 Server Function
#' @importFrom shinipsum random_text
#' @importFrom shiny renderText
#' @noRd 
mod_name_of_module2_server <- function(input, output, session){
  ns <- session$ns
 output$text <- renderText({
   random_text(nwords = 300)
 })
}
    
## To be copied in the UI
# 
    
## To be copied in the server
# 
 
