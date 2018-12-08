import $ from 'jquery';
import 'datatables'


$("#table-commitment").dataTable( {
  language: {
    search: "<i class='fas fa-search'></i>",
    searchPlaceholder: "ex : en attente "
  },
  "dom": '<"top"f>rt<"bottom"lip><"clear">'
});

