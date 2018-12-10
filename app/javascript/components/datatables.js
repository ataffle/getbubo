import $ from 'jquery';
import 'datatables'


$("#table-commitment").dataTable( {
  language: {
    search: "<i class='fas fa-search'></i>",
    searchPlaceholder: "ex : en attente ",
    lengthMenu: "Afficher _MENU_ en-cours page page",
    zeroRecords: "Pas d'en-cours",
    info: "Page _PAGE_ sur _PAGES_",
    infoEmpty: "No records available",
    infoFiltered: "(filtré depuis _MAX_ en-cours)",
    paginate: {
      previous: "<i class='fas fa-chevron-left'></i>",
      next: "<i class='fas fa-chevron-right'></i>"
    }
  },
  "dom": '<"top"f>rt<"bottom"lip><"clear">'
});

