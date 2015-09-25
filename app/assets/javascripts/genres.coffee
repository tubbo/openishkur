jQuery ->
  $('#graph .node').on 'ajax:success', (event, response) ->
    $('#genre').html(response).show()
    sampleLinks = $('#genre .sample')
    sampleLinks
      .on 'ishkur.start', ->
        $(this)
          .addClass 'active'
          .find('audio')[0].start()
        $('.artist .name').text($(this).attr('data-artist'))
        $('.track .name').text($(this).attr('data-track'))
      .on 'ishkur.stop', ->
        $(this)
          .removeClass 'active'
          .find('audio')[0].stop()
      .on 'click', (event) ->
        event.preventDefault()
        sampleLinks.trigger 'ishkur.stop'
        $(this).trigger 'ishkur.start'

    $('#genres .current .stop-link').on 'click', (event) ->
      event.preventDefault()
      $('.artist .name, .track .name').text('')
