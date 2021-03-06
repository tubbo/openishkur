jQuery.fn.showGenre = (genrePageHTML) ->
  $(this).html(genrePageHTML)

  # Sample playback controls
  $('#genre .sample')
    .on 'ishkur.start', ->
      $(this)
        .addClass('active')
        .find('audio')[0].play()

      $('#artist').text $(this).attr('data-artist')
      $('#track').text $(this).attr('data-track')
      $('.part').show()
    .on 'ishkur.stop', ->
      $(this)
        .removeClass('active')
        .find('audio')[0].pause()
    .on 'click', (event) ->
      event.preventDefault()
      $('.sample').trigger 'ishkur.stop'
      $(this).trigger 'ishkur.start'

  # Stop all samples
  $('#genre .stop')
    .on 'click', (event) ->
      event.preventDefault()
      $('#artist, #track').text ''
      $('.label').hide()
      $('.sample').trigger 'ishkur.stop'

  # If a current sample is selected, play it
  unless location.hash == '#'
    $(".sample[href=\"#{location.hash}\"]").trigger 'ishkur.play'
