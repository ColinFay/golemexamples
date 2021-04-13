#' b UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_b_ui <- function(id){
  ns <- NS(id)
  tagList(
    
  )
}

#' b Server Functions
#'
#' @noRd 
mod_b_server <- function(input, output, session, questionnaire_responses){
  ns <- session$ns
  on("printinfo",{
      print(questionnaire_responses$resp_id)
    })
  
}
## To be copied in the UI
# mod_b_ui("b_ui_1")

## To be copied in the server
# mod_b_server("b_ui_1")
