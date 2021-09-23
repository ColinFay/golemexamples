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
    h2("Number passed from app.R"), 
    tags$p(golem::get_golem_options("random_numb_from_outside")),
    h2("Number passed from inside run_app"), 
    tags$p(golem::get_golem_options("random_numb_from_inside")),
    h2("Number passed from inside this module"), 
    tags$p(textOutput(ns("number"))),
    h2("a plot"),
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
    
    output$number <- renderText({
      rnorm(1)
    })
    
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
