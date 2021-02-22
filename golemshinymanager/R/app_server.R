#' The application server-side
#' 
#' @param input,output,session Internal parameters for {shiny}. 
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function( input, output, session ) {
  # List the first level callModules here
  
  res_auth <- shinymanager::secure_server(
    check_credentials = shinymanager::check_credentials(
      data.frame(
        user = c("shiny", "shinymanager"), # mandatory
        password = c("azerty", "12345"), # mandatory
        start = c("2019-04-15"), # optinal (all others)
        expire = c(NA, "2019-12-31"),
        admin = c(FALSE, TRUE),
        comment = "Simple and secure authentification mechanism 
  for single ‘Shiny’ applications.",
        stringsAsFactors = FALSE
      )
    )
  )
  output$auth_output <- renderPrint({
    reactiveValuesToList(res_auth)
  })
}
