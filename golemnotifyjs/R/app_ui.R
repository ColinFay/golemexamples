#' @import shiny
app_ui <- function() {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # List the first level UI elements here 
    fluidPage(
      h1("Notifyjs in Shiny Example"), 
      mod_my_first_module_ui("my_first_module_ui_1"), 
      mod_my_second_module_ui("my_second_module_ui_1"),
      mod_my_third_module_ui("my_third_module_ui_1")
    )
  )
}

#' @import shiny
#' @import golem
golem_add_external_resources <- function(){
  
  add_resource_path(
    'www', app_sys('app/www')
  )
 
  tags$head(
    bundle_resources(
      path = app_sys('app/www'),
      app_title = "notifyjsexample" #with_i18("Fishing subsidies — How is public money used?", 'ui_title')
    ),
    golem::favicon(),
    # Add here all the external resources
    # If you have a custom.css in the inst/app/www
    # Or for example, you can add shinyalert::useShinyalert() here
    htmltools::htmlDependency(
      "notifyjs", version = "0.1.0", 
      src = system.file('app/www', package = 'notifyjsexample'), 
      script = "notify.js"
    )
  )
}
