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
      sidebarLayout(
        sidebarPanel = sidebarPanel(
          fluidRow(
            h1("golemfuture"), 
            h2("Using {future} & {golem}"), 
            tags$p("Clicking on the button below will send, inside a future(), a Sys.sleep() and a sample(1:1000, 10)."),
            tags$p("When the output is computed, it will be displayed on the right."),
            tags$p("While the code is sent to the future(), the clock will continue to be updated from the server."),
            sliderInput("nsec", "Number of seconds to wait", 2, 10, 5),
            actionButton("send", "Send the process in a {future}"),
          ),
          fluidRow(
            tags$p(
              "Code available at", 
              tags$a(
                href = "https://github.com/ColinFay/golemexamples/tree/master/golemfuture",
                "github.com/ColinFay/golemexamples/golemfuture"
              )
            )
            
          )
        ), 
        mainPanel = mainPanel(
          fluidRow(
            tags$h3("This clock is updated by the server every second:"),
            uiOutput("clock")
          ),
          fluidRow(
            tags$h3("When the future() resolves, the output is printed here:"),
            verbatimTextOutput("sample")
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
      app_title = 'golemfuture'
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert() 
  )
}

