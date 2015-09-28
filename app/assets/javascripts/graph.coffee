class Graph
  constructor: (container) ->
    @container = container
    @data =
      nodes: new vis.DataSet(@data.nodes)
      edges: new vis.DataSet(@data.edges)
    @options =
      interaction:
        navigationButtons: true
        zoomView: false

    @network = new vis.Network(@container, @data, @options)
    @network.on 'click', @select

  select: (params) =>
    id = params.nodes[0]
    $.get "/genres/#{id}", @_showGenre if id?

  _showGenre: (genre) ->
    $('#genre').showGenre(genre)


jQuery.fn.makeGraph = (url) ->
  element = $(this)
  $.getJSON url, (data) -> new Graph(element, data)
    graph.data = data
    graph = new Graph(element, data).on 'click', graph.select
    graph.network().on 'click', graph.select
