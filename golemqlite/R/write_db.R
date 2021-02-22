write_db <- function(
  con, 
  val
){
  DBI::dbAppendTable(
    con, 
    "finance", 
    data.frame(
      date = as.character(Sys.time()), 
      val = val
    )
  )
}
