#' The application User-Interface
#' 
#' @param request Internal parameter for `{shiny}`. 
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # List the first level UI elements here 
      htmlTemplate(
        app_sys("app/www/template.html"), 
        first = mod_name_of_module1_ui("name_of_module1_ui_1"), 
        second = mod_name_of_module2_ui("name_of_module2_ui_1"), 
        third = mod_name_of_module3_ui("name_of_module3_ui_1"), 
        fourth = mod_name_of_module4_ui("name_of_module4_ui_1"), 
        fifth = mod_name_of_module5_ui("name_of_module5_ui_1"),
        sixth = mod_name_of_module5_ui("name_of_module5_ui_2")
      )
    )
}

#' Add external Resources to the Application
#' 
#' This function is internally used to add external 
#' resources inside the Shiny application. 
#' 
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function(){
  
  add_resource_path(
    'www', app_sys('app/www')
  )
 
  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys('app/www'),
      app_title = 'golemhtmltemplate'
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert() 
  )
}

