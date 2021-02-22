
<!-- README.md is generated from README.Rmd. Please edit that file -->

# notifyjsexample

<!-- badges: start -->

<!-- badges: end -->

The goal of notifyjsexample is to provide an example of a Shiny App
integrating `notifyjs`.

> <https://notifyjs.jpillora.com/>

# Bringing `notifyjs` in your golem app

## Notes

### Creating a custom JavaScript handler

``` r
golem::add_js_handler("name")
```

or add

    $( document ).ready(function() {
      Shiny.addCustomMessageHandler('fun', function(arg) {
        
      })
    });

In `inst/app/www/handler.js`

### Calling custom handler

From the server side:

``` r
session$sendCustomMessage("fun", arg)
```

**Good practice**

    $( document ).ready(function() {
      Shiny.addCustomMessageHandler('fun', function(arg) {
        arg.this + arg.that
      })
    });

Call them with

``` r
session$sendCustomMessage(
  "fun", 
  list(
    this = 40, 
    that = 42
  )
)
```

## About

`notifyjs` is an open source JavaScript library designed to create
custom notification boxes, released under the MIT License.

> Notify.js is a jQuery plugin to provide simple yet fully customisable
> notifications.

<https://notifyjs.jpillora.com/>

JS available at:
<https://rawgit.com/notifyjs/notifyjs/master/dist/notify.js>
