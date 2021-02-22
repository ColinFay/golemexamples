#' @import shiny
#' @import DBI
#' @import RSQLite
app_server <- function(input, output,session) {
  # List the first level callModules here
  
  con <- dbConnect(
    RSQLite::SQLite(), 
    golem::get_golem_options("db_path")
  )
  
  DBI::dbCreateTable(
    con, 
    "finance", 
    data.frame(
      date = character(0), 
      val = character(0)
    )
  )
  
  trigger <- reactiveVal(0)
  
  callModule(mod_my_first_module_server, "my_first_module_ui_1", con, trigger)
  callModule(mod_my_other_module_server, "my_other_module_ui_1", con, trigger)
}
