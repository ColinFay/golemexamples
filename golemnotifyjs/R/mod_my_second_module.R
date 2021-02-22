# Module UI

#' @title   mod_my_second_module_ui and mod_my_second_module_server
#' @description  A shiny Module.
#'
#' @param id shiny id
#' @param input internal
#' @param output internal
#' @param session internal
#'
#' @rdname mod_my_second_module
#'
#' @keywords internal
#' @export 
#' @importFrom shiny NS tagList 
mod_my_second_module_ui <- function(id){
  ns <- NS(id)
  fluidRow(
    col_12(
      textInput(
        ns("what"), 
        "Enter Text"
      )
    ), 
    col_12(
      actionButton(
        ns("successwtext"), 
        "Success with text"
      )
    )
  )
}

# Module Server

#' @rdname mod_my_second_module
#' @export
#' @keywords internal

mod_my_second_module_server <- function(input, output, session){
  ns <- session$ns
  
  observeEvent( input$successwtext , {
    session$sendCustomMessage(
      "successwtext", 
      list(text = input$what)
    )
  })
  
}
