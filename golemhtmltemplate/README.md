
<!-- README.md is generated from README.Rmd. Please edit that file -->

# golemhtmltemplate

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
<!-- badges: end -->

The goal of golemhtmltemplate is to demonstrate how to use htmlTemplates
inside a `{golem}`-based, modularized `{shiny}` app.

This app show how to do the templating at two level:

  - General app, where the whole html is read and used in the UI:
      - [App ui](R/app_ui.R#12), where one module is linked to one
        `{{}}` in the template
      - For example, `mod_name_of_module1` is rendered in `{{first}}` in
        the html template, and powered through `first =
        mod_name_of_module1_ui("name_of_module1_ui_1")` in `app_ui`
      - [Inside a module](R/mod_name_of_module5.R), which renders a
        [piece of html](inst/app/www/imgrow.html)

## Code of Conduct

Please note that the golemhtmltemplate project is released with a
[Contributor Code of
Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.
