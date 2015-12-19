// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require turbolinks
//= require moment
//= require jquery
//= require jquery.ui.datepicker
//= require jquery_ujs
//= require bootstrap-sprockets
//= require bootstrap-datetimepicker
//= require_tree .

$(function() {
    $("img").addClass("hover-share-buttons");
 });

$(function() {
  $(document).on("click","#users_search th a, #users_search .pagination a",function(){
        $.getScript(this.href);
        return false;
    });
});

$(function() {
    $(document).on("click","#contacts_table th a, #contacts_table .pagination a",function(){
        $.getScript(this.href);
        return false;
    });
});

$(function() {
    $(document).on("click","#reviews_table th a, #reviews_table .pagination a",function(){
        $.getScript(this.href);
        return false;
    });
});


jQuery(function($){
    $(document).on("page:load ready", function(){
        $('#request_startTime, #request_endTime, #appointment_startTime, #appointment_endTime').datetimepicker({
            format: 'LT'
        });

        $('#request_apptDate, #appointment_apptDate').datetimepicker({
            format: 'L',
            format: 'YYYY/MM/DD'
        });    
    });
});


$(function() {  
    $(document).on("page:load ready", function(){
      $("#home-users_search").keyup(function(e) {
          
          var search_initial = "/profiles/search?search=";
          var search_value = $("#home-users_search").val();
          var search_path = search_initial + search_value;
          $("#home-users_search").next().attr('href',search_path);
          
          if(e.which == 10 || e.which == 13) {
                window.location.href = search_path;
            }
      });
  }); 
});



$(function() {
    $(window).on("resize", function () {
        $('footer').css('margin-top',$(document).height() -  $('.navbar').height() - $('#content').height()  - $('.mainfooter').height()); 
    // Invoke the resize event immediately
    }).resize();
});
