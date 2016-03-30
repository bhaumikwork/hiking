$(document).on 'ready page:load', ->
  date = new Date
  date.setDate date.getDate()

  $('#start_date').datetimepicker
    format: 'DD/MM/YYYY'
    minDate: date
  $('#end_date').datetimepicker
  	useCurrent: false
  	format: 'DD/MM/YYYY'
  	minDate: date
  $('#start_date').on 'dp.change', (e) ->
    $('#end_date').data('DateTimePicker').minDate e.date
    return
  $('#end_date').on 'dp.change', (e) ->
    $('#start_date').data('DateTimePicker').maxDate e.date
    return

  $('#single_day').click ->
  	if $(this)[0].checked == true
  		$('#end_date').attr 'disabled', 'disabled'
  		$('#end_date').val('')
  	else
  	 	$('#end_date').removeAttr 'disabled'
  return