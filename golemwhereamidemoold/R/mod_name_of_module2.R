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
    actionButton(ns("b"),"b")
  )
}
    
#' name_of_module2 Server Functions
#'
#' @noRd 
mod_name_of_module2_server <- function(id, r = r){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    observeEvent( input$b , {
      sink(r$fls, append = TRUE)
      
      whereami::cat_where(whereami::whereami(tag = id))
      sink()
      lns <- readLines(r$fls)
      cat(lns[length(lns)], "\n")
    })
  })
}
    
## To be copied in the UI
# mod_name_of_module2_ui("name_of_module2_ui_1")
    
## To be copied in the server
# mod_name_of_module2_server("name_of_module2_ui_1")
