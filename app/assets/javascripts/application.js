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
//= require jquery.ui.dialog
//= require jquery.scrollTo.min
//= require jquery.localScroll.min
//= require jquery.ui.totop.min

$(document).ready(function() {
  //NAVIGATION

  $('#navigation').localScroll();
  $('#navigation li a').click( function () {
    $('#navigation li a').removeClass("active");
    $(this).addClass("active");
  });

  $('#logo h1 a').click(function(){ 		
    $('#navigation li a').removeClass("active");
    $('#navigation li:first a').addClass("active");
    $('html, body').animate({scrollTop: 0});

  });

  $('#right').UItoTop()
});	//END of jQuery
