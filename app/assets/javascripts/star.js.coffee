# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $('#star').on 'click', (event) -> 
    event.preventDefault
    target = $(event.target)
    $.post({
      contentType: 'application/json'
      dataType: 'json',
      url: target.attr('href')
      success: ->
        target.text('Remove from Favorites')
    })
