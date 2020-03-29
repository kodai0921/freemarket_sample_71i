$(function(){
  $('.next-box').click(function(){
    $('.field').hide();
    $('.tel').show();
    $('.next-box').hide();
    $('.end-btn').show();
    $('.back').show();
  })

  $('.back').click(function(){
    $('.tel').hide();
    $('.field').show();
  })
});