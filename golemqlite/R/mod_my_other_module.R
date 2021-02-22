# Module UI
  
#' @title   mod_my_other_module_ui and mod_my_other_module_server
#' @description  A shiny Module.
#'
#' @param id shiny id
#' @param input internal
#' @param output internal
#' @param session internal
#'
#' @rdname mod_my_other_module
#'
#' @keywords internal
#' @export 
#' @importFrom shiny NS tagList 
mod_my_other_module_ui <- function(id){
  ns <- NS(id)
  tagList(
    tableOutput(ns("tbl"))
  )
}
    
# Module Server
    
#' @rdname mod_my_other_module
#' @export
#' @keywords internal
    
mod_my_other_module_server <- function(input, output, session, con, trigger){
  ns <- session$ns

  output$tbl <- renderTable({
    trigger()
    DBI::dbReadTable(con, "finance")
  })
  
}

