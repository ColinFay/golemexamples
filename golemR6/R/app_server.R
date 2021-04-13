#' The application server-side
#' 
#' @param input,output,session Internal parameters for {shiny}. 
#'     DO NOT REMOVE.
#' @import shiny
#' @import gargoyle
#' @noRd
app_server <- function( input, output, session ) {
  # Your application server logic 
  
  # Triggers
  init("printinfo")
  
  # Create new object to share data across modules using the R6 Class
  questionnaire_responses <- QuestionnaireResponses$new()
  
  # List the first level callModules here
  callModule(mod_a_server, "a_ui_1", questionnaire_responses)
  callModule(mod_b_server, "b_ui_1", questionnaire_responses)
}
