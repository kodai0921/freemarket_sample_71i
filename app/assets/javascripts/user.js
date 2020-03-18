$(function(){
  $('.next').click(function(){
    $('.field').hide();
    $('.tel').show();
  })

  $('.back').click(function(){
    $('.tel').hide();
    $('.field').show();
  })
});