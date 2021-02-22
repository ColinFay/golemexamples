#' @import shiny
app_server <- function(input, output,session) {
  # List the first level callModules here
  callModule(mod_my_first_module_server, "my_first_module_ui_1")
  callModule(mod_my_second_module_server, "my_second_module_ui_1")
}
