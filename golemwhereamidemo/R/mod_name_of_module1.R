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
    actionButton(ns("a"),"a")
  )
}
    
#' name_of_module1 Server Functions
#'
#' @noRd 
mod_name_of_module1_server <- function(id, r = r){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    observeEvent( input$a , {
      sink(r$fls, append = TRUE)
      whereami::cat_where(whereami::whereami(tag = id))
      sink()
      lns <- readLines(r$fls)
      cat(lns[length(lns)], "\n")
    })
  })
}
    
## To be copied in the UI
# mod_name_of_module1_ui("name_of_module1_ui_1")
    
## To be copied in the server
# mod_name_of_module1_server("name_of_module1_ui_1")
