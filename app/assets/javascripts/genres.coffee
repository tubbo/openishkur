jQuery ->
  $('.edit_genre, .new_genre, .new_sample')
    .on 'ajax:success', (genre) ->
      $('#editor').foundation 'reveal', 'close'
      $('#genre').showGenre(genre)

  $('#graph').makeGraph '/genres.json'
