jQuery ->
  # Sample playback controls
  $('.sample')
    .on 'ishkur.start', ->
      $(this)
        .addClass('active')
        .find('audio')[0].start()

      $('#artist').text $(this).attr('data-artist')
      $('#track').text $(this).attr('data-track')
    .on 'ishkur.stop', ->
      $(this)
        .removeClass('active')
        .find('audio')[0].stop()
    .on 'click', (event) ->
      event.preventDefault()
      $('.sample').trigger 'ishkur.stop'
      $(this).trigger 'ishkur.start'

  # Stop all samples
  $('#genre .stop')
    .on 'click', (event) ->
      event.preventDefault()
      $('#artist, #track').text ''
      $('.sample').trigger 'ishkur.stop'

  # If a current sample is selected, play it
  unless location.hash == '#'
    $(".sample[href=\"#{location.hash}\"]").trigger 'ishkur.play'
