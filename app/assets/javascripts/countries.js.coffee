# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#jQuery ->
#   $("body").on 'change', '#country_id', ->
#     $('#province'_id').load ('/update_provinces', {country_id:
#     $country_id})

jQuery ->
  $(document).on 'change', '#country_id', ->
    $('#city_province_id').load('/update_provinces', {country_id: $("#country_id").val()}, (complete) ->
      $("#city_province_id").effect( "highlight", {color:"#ffff00"}, 1500 )
    )

#  $(document).on 'change', '#city_province_id', ->
#  Aca esta el error, tiene que ser el combo de localidades!
#    $('#city_province_id').load('/update_cities', {province_id: #$("#city_province_id").val()}, (complete) ->
#      $("#city_province_id").effect( "highlight", {color:"#ffff00"}, 1500 )
#    )

  $(document).on 'change', '#city_province_id', ->
    $('#city_id').load('/update_cities', {province_id: $("#city_province_id").val()}, (complete) ->
      $("#city_id").effect( "highlight", {color:"#ffff00"}, 1500 )
    )