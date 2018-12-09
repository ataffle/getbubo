import $ from 'jquery';

const sidebar = () => {
  $(document).ready(function () {
    if(window.location.href.indexOf("sign_in") > -1) {
      $(".sidebar").css("display", "none");
    } else if (window.location.href.indexOf("sign_up") > -1) {
      $(".sidebar").css("display", "none");
    }
  });
}

export { sidebar };
