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
  navTop = $("div#nav-container").offset();
  navTop = navTop.top;
}

$(document).scroll(function(){
  if($(window).scrollTop() > navTop){ //200 = height of the top section
      var viewportWidth = $(".container").width();
      $("div#nav-container").css("display", "inline-block").addClass('nav-fix').find("ul.nav").css({ width: viewportWidth, margin: '0 auto'});
  } else {
      $("div#nav-container").removeClass('nav-fix').find("ul.nav").css({ width: "100%" });
  }
});


init();

});