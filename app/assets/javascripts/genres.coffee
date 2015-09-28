jQuery ->
  $('.edit_genre, .new_genre, .new_sample').on 'ajax:success', (genre) ->
    $('#editor').foundation 'reveal', 'close'
    $('#genre').showGenre(genre)

  if $('#graph').length
    $.getJSON '/genres.json', (data) ->
      graph =
        nodes: new vis.DataSet(data.nodes)
        edges: new vis.DataSet(data.edges)
      options =
        interaction:
          navigationButtons: true
          zoomView: false
      network = new vis.Network($('#graph')[0], graph, options)
      network.on 'click', (params) ->
        id = params.nodes[0]
        if id?
          $.get "/genres/#{id}", (genre) -> $('#genre').showGenre(genre)
