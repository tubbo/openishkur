require File.expand_path('../boot', __FILE__)

require "rails"

%w(
  action_controller
  action_view
  action_mailer
  sprockets
  neo4j
).each do |framework|
  begin
    require "#{framework}/railtie"
  rescue LoadError
  end
end

# Require the gems listed in Gemfile
Bundler.require :default, Rails.env

require 'open_ishkur'

module OpenIshkur
  class Application < Rails::Application
    # Use the responders controller from the responders gem
    config.app_generators.scaffold_controller :responders_controller

    # Use EST as our local time zone. (UTC is default)
    config.time_zone = 'Eastern Time (US & Canada)'

    # Always show debug logs, because we filter them out in syslog.
    config.log_level = :debug

    # Use localhost as mail server (for Devise)
    config.action_mailer.default_url_options = { host: 'localhost:3000' }

    # Use this as the app title
    config.title = 'OpenIshkur'

    # Configure Neo4J
    config.neo4j.session_type = :server_db
    config.neo4j.session_path = ENV['NEO4J_URL'] || 'http://localhost:7474'
    config.neo4j.storage_path = File.join(config.root, 'db', Rails.env)
  end
end
