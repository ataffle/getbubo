import $ from 'jquery';
import 'datatables'


$(".table").dataTable( {
  language: {
    search: "<i class='fas fa-search'></i>",
    searchPlaceholder: "eg: Pending "
  },
  "dom": '<"top"f>rt<"bottom"lip><"clear">'
});

