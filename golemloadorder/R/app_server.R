#' The application server-side
#' 
#' @param input,output,session Internal parameters for {shiny}. 
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function( input, output, session ) {
  
  cli::cat_rule("app_server.R")
  
  # Your application server logic 
  mod_one_server("one_ui_1")
}
