
<!-- README.md is generated from README.Rmd. Please edit that file -->

# golemfuture

This application demoes how to use `{future}` and `{promises}` for
asynchronous programming in `{shiny}`.

See `app_server.R` for a detail of the settings.

Note that for better perfs and for more customization, the
`future::plan(future::multisession)` should either be set inside the
`app.R` (for RStudio products deployment), or before the `run_app()`
call when building a Docker image. In other words, I wouldn’t advice to
set the `future::plan` inside the server function.

Application available at <https://connect.thinkr.fr/golemfuture>
