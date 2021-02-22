#' helpers 
#'
#' @description A fct function
#'
#' @return The return value, if any, from executing the function.
#'
#' @noRd
# sys_sleep_and_run <- 
# 
# functions_for_future <- new.env()
# functions_for_future$sys_sleep_and_run <- function(n_sec){
#   Sys.sleep(n_sec)
#   sample(1:1000, 10)
# }


sys_sleep_and_run <- function(n_sec){
  Sys.sleep(n_sec)
  sample(1:1000, 10)
}

functions_for_future <- new.env()