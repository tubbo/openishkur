namespace :db do
  desc "Populate the graph with seed data"
  task seed: :environment do
    OpenIshkur::Seeds.install
    Rake::Task['elasticsearch:import:all'].invoke
  end

  desc "Install Neo4J if necessary, and start the server"
  task install: %w(neo4j:install neo4j:start)

  desc "Set up the database for the first time"
  task setup: %w(db:install db:seed)

  desc "Truncate the database and re-seed it with new data"
  task reset: %w(neo4j:reset_yes_i_am_sure db:seed)
end
