#' The application server-side
#' 
#' @param input,output,session Internal parameters for {shiny}. 
#'     DO NOT REMOVE.
#' @import shiny
#' @import ggplot2
#' @noRd
app_server <- function( input, output, session ) {
  r <- reactiveValues(
    fls = tempfile()
  )
  # Your application server logic 
  mod_name_of_module1_server("name_of_module1_ui_1", r = r)
  mod_name_of_module2_server("name_of_module2_ui_1", r = r)
  mod_name_of_module3_server("name_of_module3_ui_1", r = r)
  
  observeEvent( input$reset , {
    whereami::counter_reset()
    unlink(r$fls)
    assign(
      "archives", 
      structure(
        list(
          where = character(0), 
          when = numeric(0), 
          count = numeric(0)), 
        class = c("whereamicounter", "data.frame"),
        row.names = integer(0)), 
      envir = whereami:::wenv
    )
  })
  
  pol <- reactivePoll(
    500, session, 
    checkFunc = function(){
      whereami::counter_state()
    }, valueFunc = function(){
      whereami::counter_get()
    }
  )
  
  output$plot <- renderPlot({
    if (nrow(pol()) > 0){
      pol() %>%
        dplyr::group_by(tag) %>%
        dplyr::top_n(1, count) %>%
        ggplot(aes(tag, count, fill = where)) + 
        geom_col() + 
        coord_flip()
    } else {
      ggplot()
    }
  })
  
  output$dt <- DT::renderDataTable({
    pol()
  }, options = list(scrollX = TRUE))
  
  
  output$console <- renderPrint({
    invalidateLater(500)
    req(file.exists(r$fls))
    lns <- readLines(r$fls)
    for (i in 1:length(lns)){
      cat(lns[i], "\n")
    }
  })
}
