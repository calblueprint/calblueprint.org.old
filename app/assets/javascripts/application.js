// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require_tree .


// $(function() {
//   $("#event_date").datepicker({ dateFormat: "yy-mm-dd" });
// });

$(function() {
  $(".click-header").click(function(event) {
    event.preventDefault();
    $("html, body").animate({ scrollTop: $('#navbar').offset().top + 1 }, 1000);
  });
});

window.onload = function() {
  $("#navbar").affix({
    offset: { top: $("#navbar").offset().top }
  });

  if (window.location.pathname !== "/") {
    $("html, body").animate({ scrollTop: $("#navbar").offset().top + 1 }, 1);
  }
};
