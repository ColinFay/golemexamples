
<!-- README.md is generated from README.Rmd. Please edit that file -->

# golemshinyi18n

<!-- badges: start -->
<!-- badges: end -->

Example of using `{shiny.i18n}` inside a `{golem}` app:

1.  Create translation.json inside your inst/ folder/
    <https://github.com/ColinFay/golemexamples/blob/master/golemshinyi18n/inst/translation.json>
2.  Create a package object, inside data-raw,
    `usethis::use_data_raw( name = "i18n")`
    <https://github.com/ColinFay/golemexamples/blob/master/golemshinyi18n/data-raw/i18n.R>
3.  Set the language inside run\_app
    <https://github.com/ColinFay/golemexamples/blob/master/golemshinyi18n/R/run_app.R#L18>
4.  Use this object inside the app
    <https://github.com/ColinFay/golemexamples/blob/master/golemshinyi18n/R/app_ui.R#L14>

Note that you’ll need to recompile the object (relaunch the script
inside data-raw) every time you change the translation file.
