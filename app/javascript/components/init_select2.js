import $ from 'jquery';
import 'select2';

const initSelect2 = () => {
  $('.select2').select2({
    "language": {
      "noResults": function(){
        return "<a href='#' target='_blank' data-toggle='modal' data-target='#myModal'>Add new supplier</a>";
      }
    },
    escapeMarkup: function (markup) {
      return markup;
    }
  });
};

export { initSelect2 };
