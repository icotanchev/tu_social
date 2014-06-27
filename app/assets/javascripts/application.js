// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require bootstrap-datepicker
//= require turbolinks
//= require_tree .

$(document).on("focus", "[data-behaviour~='datepicker']", function(e) {
  return $(this).datepicker({
    format: "dd-mm-yyyy",
    weekStart: 1,
    autoclose: true
  });
});

jQuery(function($) {
	listenCommentFullContent();
	// showDatePicker();	
});

// function showDatePicker() {
// 	var ids = ['from_date_id', 'to_date_id'];

// 	jQuery(ids).each(function(index, value) {
// 		jQuery("#" + value).bind("click", function () {
// 			return jQuery(this).datepicker({
// 		    format: "dd-mm-yyyy",
// 		    weekStart: 1,
// 		    autoclose: true
// 		  });
// 		});
// 	});
// }

function listenCommentFullContent() {
  jQuery('a.full_comment_content').bind('click', function() {
    jQuery.ajax({
      type: "POST",
      url: '/comments/full_content',
      data: { selected_id: jQuery(this).attr('value') }
    });
  });
}
