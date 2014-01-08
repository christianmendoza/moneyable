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
//= require foundation
// require foundation-datetimepicker
//= require turbolinks
//= require_tree .

$(function(){
  $(document).foundation();
});

// fadeout flash messages
$('.alert-box').not('.warning').slideDown(function() {
  setTimeout(function() {
      $('.alert-box').slideUp(600);
  }, '2000');
});

// $(document.body).on('change', '#period', function() {
//   alert('here');
// });
// $('#period').on('change', function(){
//     alert('here');
// });


// $(document.body).on('change','select',function(){
//     alert('Change Happened');
// });

// $('#period').on('change', function(){
//     alert('here');
// });

// $("#period").change(function() {
//     var thes = $(this).attr('value');
//     var next = $('option:selected').next().attr('value');
//     alert(next);
// });

// date period select
// $('select#period').change(function() {
//   window.location.replace('/hours?user_id='+$(this).val());
// });

// $( "#period" ).change(function() {
//   alert( "Handler for .change() called." );
// });

// $('select#period').on('change', function (e) {
//     // var optionSelected = $("option:selected", this);
//     // var valueSelected = this.value;
//     // ....
//     alert( "Handler for .change() called." );
// });