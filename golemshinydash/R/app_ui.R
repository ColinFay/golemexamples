#' The application User-Interface
#' 
#' @param request Internal parameter for `{shiny}`. 
#'     DO NOT REMOVE.
#' @import shiny
#' @import shinydashboard
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # List the first level UI elements here 
    dashboardPage(
      dashboardHeader(title = "My Dashboard"),
      dashboardSidebar(
        sidebarMenu(
          menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
          menuItem("Widgets", icon = icon("th"), tabName = "widgets",
                   badgeLabel = "new", badgeColor = "green")
        )
      ),
      dashboardBody(
        tabItems(
          tabItem(tabName = "dashboard",
                  mod_name_of_module1_ui("name_of_module1_ui_1")
          ),
          
          tabItem(tabName = "widgets",
                  mod_name_of_module2_ui("name_of_module2_ui_1")
          )
        )
      )
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
      app_title = 'golemshinydash'
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert() 
  )
}

