# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  table=$('#products').dataTable({
		#sPaginationType: "full_numbers",
    sPaginationType: "two_button",
    bPaginate: false,
    bLengthChange: true,
    bFilter: false,
    bSort: false,
    bInfo: false,
    bAutoWidth: true,
    bJQueryUI: true,
    bProcessing: true,
    bServerSide: true,
    aoColumnDefs: [{"bVisible": false,"aTargets": [0]}],
    sAjaxSource: $('#products').data('source')
  });
  
  table.makeEditable({
		sUpdateURL: "/ajax_update"
  });