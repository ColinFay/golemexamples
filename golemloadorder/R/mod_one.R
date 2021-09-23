#' one UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_one_ui <- function(id){
  
  cli::cat_rule("mod_one_ui()")
  
  ns <- NS(id)
  tagList(
    plotOutput(ns("plot"))
  )
}
    
#' one Server Functions
#'
#' @noRd 
mod_one_server <- function(id){
  
  cli::cat_rule("mod_one_server()")
  
  moduleServer( id, function(input, output, session){
    
    cli::cat_rule("mod_one_server.moduleServer()")
    
    ns <- session$ns
    
    output$plot <- renderPlot({
      cli::cat_rule("mod_one_server.renderPlot()")
      
      barplot(
        golem::get_golem_options("data")
      )
      
    })
 
  })
}
    
## To be copied in the UI
# mod_one_ui("one_ui_1")
    
## To be copied in the server
# mod_one_server("one_ui_1")
