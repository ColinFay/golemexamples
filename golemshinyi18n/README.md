
<!-- README.md is generated from README.Rmd. Please edit that file -->

# golemshinyi18n

<!-- badges: start -->
<!-- badges: end -->

Example of using `{shiny.i18n}` inside a `{golem}` app:

1.  Create translation.json inside your inst/ folder/
2.  Create a package object, inside data-raw,
    `usethis::use_data_raw( name = "i18n")`
3.  Use this object inside the app.

Note that you’ll need to recompile the object (relaunch the script
inside data-raw) every time you change the translation file.
