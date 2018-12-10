import $ from 'jquery';

$(function(){
  $('.nav-item').click(function(){
      $(this).parent().addClass('active').siblings().removeClass('active')
  })
})
