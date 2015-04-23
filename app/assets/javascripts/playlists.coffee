# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$ ->
  $('#why').click ->
    alert "hey?"
  $('#new_comment')
    .on 'ajax:complete', (event, ajax, data, status) ->
      response = $.parseJSON(ajax.responseText)
      result = response.result
      console.log(response)
      console.log(result)
      if result == "success"
        id = $('#title').attr('value')
        $('#comments').load("/playlists/#{id}/comments")
      else if result == "fail"
        $('#comments').prepend("<p>コメントを記入してください<p>")
  $('#comments')
    .on 'ajax:complete', (event, ajax, status) ->
      id = $('#title').attr('value')
      console.log(id)
      $('#comments').load("/playlists/#{id}/comments")
