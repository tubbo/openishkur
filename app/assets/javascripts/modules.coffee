# Quick-n-dirty modules system for running JS bindings during Ajax
# calls, Turbolinks reloads, and on-ready events.

@modules = []

@module = (callback) ->
  @modules.push callback

jQuery.on 'ready page:load ajax:complete' ->
  _.each window.modules, (module) -> module()
