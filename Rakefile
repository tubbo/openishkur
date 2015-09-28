# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

require 'elasticsearch/rails/tasks/import'

begin
  require 'rspec/core/rake_task'
  require 'rubocop/rake_task'
  require 'yard'

  RSpec::Core::RakeTask.new :test

  RuboCop::RakeTask.new :lint

  YARD::Rake::YardocTask.new :doc
rescue LoadError
  # NOTE: Development tasks are not loaded on production.
end
