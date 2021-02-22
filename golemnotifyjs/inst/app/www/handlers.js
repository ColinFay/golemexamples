$( document ).ready(function() {
  Shiny.addCustomMessageHandler('helloworld', function(arg) {
    $.notify("Hello World", "success");
  })
  Shiny.addCustomMessageHandler('success', function(arg) {
    $.notify(arg.text, "success");
  })
  Shiny.addCustomMessageHandler('error', function(arg) {
    $.notify(arg.text, "error");
  })
  Shiny.addCustomMessageHandler('successwtext', function(arg) {
    $.notify(arg.text, "success");
  })
});
