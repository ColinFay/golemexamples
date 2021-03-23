# Sourcing user .Rprofile if it exists 
home_profile <- file.path(
  Sys.getenv("HOME"), 
  ".Rprofile"
)
if (file.exists(home_profile)){
  source(home_profile)
}
# Setting shiny.autoload.r to FALSE 
options(shiny.autoload.r = FALSE)
