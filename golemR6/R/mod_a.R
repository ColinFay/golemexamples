#' a UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_a_ui <- function(id){
  ns <- NS(id)
  
  tagList(
    radioButtons(
      inputId = ns("gender"),
      label = "What is your sex?",
      choices = c("Male" = 1,
                  "Female" = 2),
      selected = character(0))
  )
}

#' a Server Functions
#'
#' @noRd 
mod_a_server <- function(input, output, session, questionnaire_responses){
  ns <- session$ns
  
  observeEvent(input$gender, {
    # Add time start to the output vector
    timestamp <- format(Sys.time(), "%Y-%m-%d %H:%M:%OS6")
    timezone <- Sys.timezone()
    
    # Generate a survey-specific ID number
    resp_id <- paste0(sample(c(letters, LETTERS, 0:9), 10), collapse = "")
    
    # Assign values to R6 object
    questionnaire_responses$resp_id <- resp_id
    questionnaire_responses$timezone <- timezone
    questionnaire_responses$timestamp <- timestamp
    questionnaire_responses$gender <- input$gender
    
    trigger("printinfo")
  })
  
}

## To be copied in the UI
# mod_a_ui("a_ui_1")

## To be copied in the server
# mod_a_server("a_ui_1")
