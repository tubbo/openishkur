jQuery ->
  $('.edit_genre, .new_genre').on 'ajax:success', (event, response) ->
    $('#genre').html(response)
    $('#editor').foundation('reveal', 'close')

  $('.new_sample').on 'ajax:success', ->
    id = $(this).attr 'data-genre'
    $('#editor').foundation('reveal', 'close')
    $.get "/genres/#{id}", (response) -> $('#genre').html(response)

  graphContainer = $('#graph')
  if graphContainer.length
    graphDataURL = "/genres.json"
    $.getJSON graphDataURL, (graphData) ->
      graph =
        nodes: new vis.DataSet(graphData.nodes)
        edges: new vis.DataSet(graphData.edges)
      options = {}
      network = new vis.Network(graphContainer[0], graph, options)

      network.on 'click', (params) ->
        genreID = params.nodes[0]
        if genreID?
          $.get "/genres/#{genreID}", (genre) ->
            $('#genre').showGenre(genre)
