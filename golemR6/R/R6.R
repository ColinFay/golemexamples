# Generate R6 Class
QuestionnaireResponses <- R6::R6Class(
  classname = "QuestionnaireResponses",
  public = list(
    resp_id = NULL,
    timezone = NULL,
    timestamp = NULL,
    gender = NULL
  )
)