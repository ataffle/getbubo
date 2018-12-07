import $ from 'jquery';
import 'datatables'


$(".table").dataTable( {
  language: {
    search: "<i class='fas fa-search'></i>"
  },
  "dom": '<"top"f>rt<"bottom"lip><"clear">'
});

