jQuery ->
  # Autocomplete genre names to associate with
  $('[data-tagsInput]').tokenInput '/search.json'

  # When a genre is clicked on the graph, load its contents into the
  # current genre block.
  $('#graph .node')
    .on 'ajax:success', (event, response) ->
      $('#genre').html(response)


  $('#graph').makeGraph '/genres.json'
