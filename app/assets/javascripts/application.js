//= require jquery
//= require jquery_ujs
//= require foundation
//= require lodash
//= require jquery_nested_form
//= require jquery.tokeninput
//= require jquery.turbolinks
//= require turbolinks
//= require_self
//= require_tree .

$.turbo.use('page:load', 'page:fetch', 'ajax:complete');

$(function() { $(document).foundation(); });
