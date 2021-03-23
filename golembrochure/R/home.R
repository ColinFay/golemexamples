home <- function(){
  page(
    href = "/",
    ui = tagList(
      h1("This is my first page"), 
      tags$p("It will contain BROCHURECOOKIE depending on the last page you've visited (/login or /logout)"),
      verbatimTextOutput("cookie"),
      nav_links
    ),
    server = function(input, output, session){
      output$cookie <- renderPrint({
        parse_cookie_string(
          get_cookies()
        )
      })
    }
  )
}
