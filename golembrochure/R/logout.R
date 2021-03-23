logout <- function(){
  page(
    href = "/logout",
    ui =  tagList(
      h1("You've logged out"),
      nav_links,
      verbatimTextOutput("cookie")
    ), 
    server = function(input, output, session){
      output$cookie <- renderPrint({
        parse_cookie_string(
          get_cookies()
        )
      })
    },
    res_handlers = list(
      # We'll remove the cookie here
      ~ remove_cookie(.x, "BROCHURECOOKIE")
      # If you had to do it yourself
      # function(res, req){
      #   res$headers$`Set-Cookie` <- "BROCHURECOOKIE=''; Max-Age = 0;"
      #   res
      # }
    )
  )
}