$(function() {
   $('.flash').delay(300).fadeIn('normal', function() {
      $(this).delay(600).fadeOut();
   });
});
