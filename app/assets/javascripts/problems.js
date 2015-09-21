// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).on('keyup', function(e) {
  var $el = $(e.target);
  if ($el.is('input')) {
    $el.closest('form').submit();
  }
});
