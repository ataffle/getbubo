import $ from 'jquery';

const modalSupplier = () => {
  $('#myModal').on('shown.bs.modal', function () {
   $('#myInput').focus()
   $('span.select2-dropdown--below').addClass("dropdown-inactive");
  })
  //$('span.select2-dropdown--below').removeClass("dropdown-inactive");
}

export { modalSupplier };
