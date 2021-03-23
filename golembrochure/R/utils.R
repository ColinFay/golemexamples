# Creating a navlink
nav_links <- tags$ul(
  tags$li(
    tags$a(href = "/", "home"), 
  ),
  tags$li(
    tags$a(href = "/login", "login"), 
  ),
  tags$li(
    tags$a(href = "/logout", "logout"), 
  )
)
