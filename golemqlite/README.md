
<!-- README.md is generated from README.Rmd. Please edit that file -->

# golemqlite

<!-- badges: start -->

<!-- badges: end -->

Example of a golem app with a sqlite inside

  - DB is created at runtime in [R/app\_server.R](R/app_server.R)

  - A `trigger()` object is passed to update the output when clicked in
    module one

  - We write to the DB in
    [R/mod\_my\_first\_module.R](R/mod_my_first_module.R), with the
    function defined at [R/write\_db.R](R/write_db.R)

  - We read the output in
    [R/mod\_my\_other\_module.](R/mod_my_other_module.R)

  - With the `db_path` argument of `run_app`, we can point to another
    location for the DB
