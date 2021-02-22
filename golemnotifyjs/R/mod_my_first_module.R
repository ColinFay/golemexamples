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
  fluidRow(
    col_4(
      actionButton(
        ns("helloworld"), 
        "Hello world!"
      ) 
    ), 
    col_4(
      actionButton(
        ns("success"), 
        "Success"
      ) 
    ), 
    col_4(
      actionButton(
        ns("error"), 
        "Error"
      ) 
    )
  )
}

# Module Server

#' @rdname mod_my_first_module
#' @export
#' @keywords internal

mod_my_first_module_server <- function(input, output, session){
  ns <- session$ns
  
  observeEvent( input$helloworld , {
    session$sendCustomMessage(
      "helloworld", 
      TRUE
    )
  })
  
  observeEvent( input$success , {
    session$sendCustomMessage(
      "success", 
      list(text = "Yeay")
    )
  })
  
  observeEvent( input$error , {
    session$sendCustomMessage(
      "error", 
      list(text = "Nop")
    )
  })
  
}


