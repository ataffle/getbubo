import $ from 'jquery';
import 'select2';

const initSelect2 = () => {
  $('.select2').select2({
    "language": {
      "noResults": function(){
        return "<a href='/suppliers/new' target='_blank'>Add new supplier</a>";
      }
    },
    escapeMarkup: function (markup) {
      return markup;
    }
  });
};

export { initSelect2 };
