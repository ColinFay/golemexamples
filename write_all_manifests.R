alls <- list.dirs(recursive = FALSE)
alls[alls != "./.git"] |>
  purrr::map(~ {
    cli::cat_rule(.x)
    remotes::install_deps(.x, upgrade = TRUE)
    rsconnect::writeManifest(.x)
  })
