# Module UI

#' @title   mod_my_first_module_ui and mod_my_first_module_server
#' @description  A shiny Module.
#'
#' @param id shiny id
#' @param input internal
#' @param output internal
#' @param session internal
#'
#' @rdname mod_my_first_module
#'
#' @keywords internal
#' @export 
#' @importFrom shiny NS tagList 
mod_my_first_module_ui <- function(id){
  ns <- NS(id)
  tagList(
    numericInput(
      ns("num"), 
      "Add a number", 
      5, 
      1, 
      100, 
      1
    ), 
    actionButton(ns("go"), "go")
  )
}

# Module Server

#' @rdname mod_my_first_module
#' @export
#' @keywords internal

mod_my_first_module_server <- function(input, output, session, con, trigger){
  ns <- session$ns
  
  observeEvent( input$go , {
    write_db(con, input$num)
    trigger(trigger() + 1)
  })
  
  
}

