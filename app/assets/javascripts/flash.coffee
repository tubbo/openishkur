class Flash
  constructor: ->
    @closeButton = $('<a href="#" class="close">&times;</a>')

  alert: (message) ->
    @_make('alert', message)

  notice: (message) ->
    @_make('success', message)

  _make: (type, message) ->
    $('<div class="alert-box" data-alert>')
      .addClass(type)
      .html(message)
      .append(@closeButton)

@flash = new Flash()
