# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $(document).on 'change', '#type_id', ->
    $('#breed_id').load('/update_breeds', {type_id: $("#type_id").val()}, (complete) ->
      $("#breed_id").effect( "highlight", {color:"#ffff00"}, 1500 )
    )