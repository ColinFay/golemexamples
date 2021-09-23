
<!-- README.md is generated from README.Rmd. Please edit that file -->

# golemloadorder

<!-- badges: start -->
<!-- badges: end -->

This is a simple app to log where things happen, how often, and when,
when running an app with `{golem}`.

Every piece of the app has a `cli::cat_rule()` that prints to the
console the place where it is.

There is also random numbers passed from different places of the app.

The idea here is to be able to use these simple logs to know how often
specific pieces of the apps are called inside your infra.

To test this, launch the app, and then open multiple windows inside your
browser on the given URL.

You’ll see that:

-   app.R & run\_app.R Are only run one time, all other parts are
    launched for every shiny session.
-   The rnorm() from app.R & run\_app.R are the same for all sessions,
    the one from the module is different for every session.
