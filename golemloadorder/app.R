# Launch the ShinyApp (Do not remove this comment)
# To deploy, run: rsconnect::deployApp()
# Or use the blue button on top of this file

cli::cat_rule("app.R")

pkgload::load_all(export_all = FALSE,helpers = FALSE,attach_testthat = FALSE)


options( "golem.app.prod" = TRUE)

dat <- airquality$Ozone

golemloadorder::run_app(data = dat) # add parameters here (if any)
