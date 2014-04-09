//= require jquery
//= require jquery_ujs
//= require jquery.ui.datepicker
//= require_tree .
//= require_tree ./libs

$(document).ready(function(){

  $('.timepicker').datetimepicker({
    language: 'fr',
    pickDate: false
  });

  $('.datepicker').datetimepicker({
    language: 'fr',
    pickTime: false
  });

  $("#item_feed_ids").multiselect({
    includeSelectAllOption: true,
    selectAllText: 'Tout sélectionner',
    nonSelectedText: 'Aucune sélection',
    enableFiltering: true,
    enableCaseInsensitiveFiltering: true,
    maxHeight: 300
  });


});

