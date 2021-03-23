
<!-- README.md is generated from README.Rmd. Please edit that file -->

# golembrochure

<!-- badges: start -->

<!-- badges: end -->

An example of using `{brochure}` & `{golem}`.

## Steps

1.  Remove the app\_server.R file, and the top of app\_ui =\> You’ll
    still need `golem_add_external_resources()`.

2.  Build the pages inside separate R scripts

<!-- end list -->

``` r
fs::dir_tree()
#> .
#> ├── DESCRIPTION
#> ├── Dockerfile
#> ├── NAMESPACE
#> ├── R
#> │   ├── app_config.R
#> │   ├── app_ui.R
#> │   ├── home.R
#> │   ├── login.R
#> │   ├── logout.R
#> │   ├── run_app.R
#> │   └── utils.R
#> ├── README.Rmd
#> ├── README.md
#> ├── dev
#> │   ├── 01_start.R
#> │   ├── 02_dev.R
#> │   ├── 03_deploy.R
#> │   └── run_dev.R
#> ├── golembrochure.Rproj
#> ├── inst
#> │   ├── app
#> │   │   └── www
#> │   │       └── favicon.ico
#> │   └── golem-config.yml
#> └── man
#>     └── run_app.Rd
```

3.  Replace `shinyApp` with `brochureApp` in `run_app()`, add the
    external resources, then your pages.

<!-- end list -->

``` r
run_app <- function(
  onStart = NULL,
  options = list(), 
  enableBookmarking = NULL,
  ...
) {
  with_golem_options(
    app = brochureApp(
      # Putting the resources here
      golem_add_external_resources(),
      home(),
      login(),
      logout(),
      onStart = onStart,
      options = options, 
      enableBookmarking = enableBookmarking
    ), 
    golem_opts = list(...)
  )
}
```

## Building the Docker container

    docker build -t brochure .
    docker run -p 1234:80 -d brochure && \
      sleep 5 && \
      open http://localhost:1234
