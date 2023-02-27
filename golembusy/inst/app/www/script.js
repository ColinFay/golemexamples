$(document).on('shiny:busy', function(event) {
  $("#hourglass").show();
});

$(document).on('shiny:idle', function(event) {
  $("#hourglass").hide();
});