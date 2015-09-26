jQuery ->
  # Autocomplete genre names to associate with
  $('[data-tagsInput]').tokenInput '/search.json'

  # When a genre is clicked on the graph, load its contents into the
  # current genre block.
  $('#graph .node')
    .on 'ajax:success', (event, response) ->
      $('#genre').html(response)

  graphContainer = $('#graph')
  if graphContainer.length
    graphDataURL = "/genres.json"
    $.getJSON graphDataURL, (graphData) ->
      graph =
        nodes: new vis.DataSet(graphData.nodes)
        edges: new vis.DataSet(graphData.edges)
      options = {}
      new vis.Network(graphContainer[0], graph, options)
