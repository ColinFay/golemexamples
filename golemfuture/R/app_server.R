#' The application server-side
#' 
#' @param input,output,session Internal parameters for {shiny}. 
#'     DO NOT REMOVE.
#' @import shiny
#' @import future
#' @import promises
#' @noRd
app_server <- function( input, output, session ) {
  # Setting the reactiveValues that will store everything
  r <- reactiveValues(
    sample = NULL
  )
  
  # The clock logic
  observe({
    invalidateLater(1000)
    r$time <- Sys.time()
  })
  
  output$clock <- renderUI({
    tags$div(
      icon("clock"), tags$span(r$time)
    )
  })
  
  # Sending the future()
  observeEvent( input$send , {
    # Assigning the input to a variable so it can be used 
    # inside future()
    ff <- list()
    ff$n <- input$nsec
    ff$sys_sleep_and_run <- sys_sleep_and_run
    future({
      #pkgload::load_all()
      ff$sys_sleep_and_run(ff$n)
    }) %...>%
      (function(result){
        message(result)
        # When we get the result, we assign it to r
        r$sample <- result
      }) %...!%
      (function(error){
        # If ever the future fails, we add a NULL
        r$sample <- error
        warning(error)
      })
    # We need to return something from the observeEvent otherwise it 
    # will hang
    return(NULL)
  }, ignoreInit = TRUE)
  
  output$sample <- renderPrint({
    r$sample
  })
  
}
