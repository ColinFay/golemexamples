#' The application server-side
#' 
#' @param input,output,session Internal parameters for {shiny}. 
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function( input, output, session ) {
  # List the first level callModules here
  callModule(mod_name_of_module1_server, "name_of_module1_ui_1")
  callModule(mod_name_of_module2_server, "name_of_module2_ui_1")
}
