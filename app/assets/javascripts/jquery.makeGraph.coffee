jQuery.fn.makeGraph = (graphDataURL) ->
  container = $(this)[0]
  $.getJSON graphDataURL, (graphData) ->
    graph =
      nodes: new vis.DataSet(graphData.nodes)
      edges: new vis.DataSet(graphData.edges)
    options = {}
    new vis.Network(container, graph, options)
