import $ from 'jquery';

const modalSupplier = () => {
  $('#myModal').on('shown.bs.modal', function () {
   $('#myInput').focus()
  })
}

export { modalSupplier };
