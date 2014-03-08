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
//= require jquery-tablesorter
//= require twitter/bootstrap
//= require jquery_nested_form
//= require_tree .


// $(function() {
//   $("#event_date").datepicker({ dateFormat: "yy-mm-dd" });
// });
//

mobilizer = function() {
  var win = $(this);
  if (win.width() <= 767) {
    $(".tabbable.tabs-left").removeClass("tabs-left");
  } else {
    $(".tabbable").addClass("tabs-left");
  }
}

$(window).on('resize', mobilizer);
$(window).on('load', mobilizer);

$(function() {
  $(".has-tooltip").tooltip();

  $(".top-navbar-logo").mouseover(function() {
    $(".navbar-logo").addClass("spin-now");
  }).mouseout(function() {
    $(".navbar-logo").removeClass("spin-now");
  });

  $("#evaluations").tablesorter({
    sortList: [[2,1], [3,1]]
  });
});
