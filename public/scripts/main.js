$(document).ready(function() {
  $(".top").click(function(e) {
    $(".bottom.hidden").slideToggle("fast");
    e.preventDefault();
  });
});
