#' main UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_main_ui <- function(id){
  ns <- NS(id)
  tagList(
    h2("Random beer"), 
    tags$button(
      sprintf("Get me a %s", emo::ji("beer")), onclick = "get_rand_beer()"),
    tagAppendAttributes(
      uiOutput(
        ns("beer_rand")
      ), 
      class = "innerdiv"
    )
  )
}

#' main Server Function
#'
#' @noRd 
mod_main_server <- function(input, output, session){
  ns <- session$ns
  
  output$beer_rand <- renderUI({
    req(input$beer)
    this <- input$beer
    tagList(
      tags$h2(
        this[['name']]
      ),
      tags$h3(
        this[['tagline']]
      ), 
      tags$blockquote(
        this[['description']]
      ), 
      tags$h4(
        "Brewers tips"
      ), 
      tags$p(
        this[["brewers_tips"]]
      )
    )
  })
  
  
}

## To be copied in the UI
# 

## To be copied in the server
# 

