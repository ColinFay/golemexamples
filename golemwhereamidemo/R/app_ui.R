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
    # Your application UI logic 
    fluidPage(
      h1("Demo of {whereami} logs in {shiny}"),
      column(
        6, 
        fluidRow(
          h3("Click on a button to generate a {whereami} log"),
          mod_name_of_module1_ui("name_of_module1_ui_1"),
          mod_name_of_module2_ui("name_of_module2_ui_1"),
          mod_name_of_module3_ui("name_of_module3_ui_1")
        ),
        br(),
        includeMarkdown(app_sys("explanation.md")),
        br(),
        fluidRow(
          actionButton("reset", "Reset the counter")
        ),
        br(),
        fluidRow(
          h3("Here is what is printed to the console:"),
          verbatimTextOutput("console")
        )
      ),
      column(
        6,
        HTML("<h3><code>counter_get()</code> + <code>ggplot() + ...</code></h3>"),
        plotOutput("plot"), 
        HTML("<h3><code>counter_get()</code></h3>"),
        DT::dataTableOutput("dt")
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
      app_title = 'golemwhereamidemo'
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert() 
  )
}

