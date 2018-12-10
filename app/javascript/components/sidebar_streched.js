import $ from 'jquery';

const sidebarStr = () => {
  $(document).ready(function () {
    $('.side-btn').click(function(){
      $('.sidebar').toggleClass('active-side');
      if ($('.side-btn i').hasClass('fas fa-bars'))
        $('.side-btn i').removeClass("fas fa-bars").addClass("fas fa-times");
      else {
        $('.side-btn i').removeClass("fas fa-times").addClass("fas fa-bars");
      }
    });
  });
}

export { sidebarStr };
