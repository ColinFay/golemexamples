+ `a` logs in `./R/mod_name_of_module1_ui`, line 26

```r
observeEvent( input$a , {
  whereami::cat_where(whereami::whereami(tag = id))
})
```

+ `b` logs in `./R/mod_name_of_module2_ui`, line 26

```r
observeEvent( input$b , {
  whereami::cat_where(whereami::whereami(tag = id))
})
```

+ `c` logs in `./R/mod_name_of_module3_ui`, line 27

```r
observeEvent( input$c , {
  whereami::cat_where(whereami::whereami(tag = id))
})
```

See code at [ColinFay/golemexamples/golemwhereamidemo](https://github.com/ColinFay/golemexamples/tree/master/golemwhereamidemo)