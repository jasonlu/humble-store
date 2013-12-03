$(document).ready(function(){

/** Global variables **/
var navTop = 0;

$('.btn-close-dialog').click(function(e){
  $(this).parent('.dialog').hide();
  return false;
});

$('.btn-open-dialog').click(function(e){
  $(this).next('.dialog').show();
  return false;
});

function init() {
  $("#flash-msg-container").slideDown(500).delay(1000).slideUp(500);
  
}




init();

});