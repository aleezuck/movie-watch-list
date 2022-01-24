import $ from 'jquery';
import 'select2';

const initSelect2 = () => {
  $('.select2').select2({
    dropdownParent: $('#bookmarkModal')
  });
};

export { initSelect2 };
