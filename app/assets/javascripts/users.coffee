module ->
  $('#editor a').on 'ajax:success', (event, response) ->
    $('#editor').html(response)
  $('#new_user')
    .on 'ajax:error', (xhr, error, status) ->
      $('#editor .alert-box').remove()
      $('#editor .title').append flash.alert(error.responseText)
    .on 'ajax:success', (event, response) ->
      if response.match(/alert/)
        $('#editor').html(response)
      else
        $('main').html(response)
        $('#editor').foundation('reveal', 'close')
