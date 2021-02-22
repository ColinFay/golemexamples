#' name_of_module4 UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList  verbatimTextOutput
mod_name_of_module4_ui <- function(id){
  ns <- NS(id)
  tagList(
    verbatimTextOutput(ns("out"))
  )
}
    
#' name_of_module4 Server Function
#' @importFrom shinipsum random_print
#' @importFrom shiny renderPrint
#' @noRd 
mod_name_of_module4_server <- function(input, output, session){
  ns <- session$ns

  output$out <- renderPrint({
    random_print("model")
  })
}
    
## To be copied in the UI
# 
    
## To be copied in the server
# 
 
