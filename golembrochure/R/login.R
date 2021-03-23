login <- function(){
  page(
    href = "/login",
    ui =  tagList(
      h1("You've just logged!"),
      verbatimTextOutput("cookie"),
      actionButton("redirect", "Redirect to the home page"),
      nav_links
    ), 
    server = function(input, output, session){
      output$cookie <- renderPrint({
        parse_cookie_string(
          get_cookies()
        )
      })
      observeEvent( input$redirect , {
        # Using brochure to redirect to another page
        server_redirect("/")
      })
      
    },
    res_handlers = list(
      # We'll add a cookie here
      ~ set_cookie(.x, "BROCHURECOOKIE", 12)
      # If you had to do it yourself
      # function(res, req){
      #   res$headers$`Set-Cookie` <- "BROCHURECOOKIE=12; HttpOnly;"
      #   res
      # }
    )
  )
}
