module ->
  autocomplete = (event) ->
    if $('#search input').val().length >= 3
      $('#search form').trigger 'submit.rails'

  $('#search input').on 'keyup', _.debounce(autocomplete)

  $('#search form').on 'ajax:success', (event, response) ->
    $('#search #results').html(response)
