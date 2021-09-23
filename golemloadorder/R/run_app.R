#' Run the Shiny Application
#'
#' @param ... arguments to pass to golem_opts. 
#' See `?golem::get_golem_options` for more details.
#' @inheritParams shiny::shinyApp
#'
#' @export
#' @importFrom shiny shinyApp
#' @importFrom golem with_golem_options 
run_app <- function(
  onStart = NULL,
  options = list(), 
  enableBookmarking = NULL,
  uiPattern = "/",
  data, 
  random_numb_from_outside
) {
  
  cli::cat_rule("run_app()")
  
  random_numb_from_inside <- rnorm(1)
  
  with_golem_options(
    app = shinyApp(
      ui = app_ui,
      server = app_server,
      onStart = onStart,
      options = options, 
      enableBookmarking = enableBookmarking, 
      uiPattern = uiPattern
    ), 
    golem_opts = list(
      data = data, 
      random_numb_from_outside = random_numb_from_outside, 
      random_numb_from_inside = random_numb_from_inside
    )
  )
}
