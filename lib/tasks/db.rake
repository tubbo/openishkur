namespace :db do
  desc "Populate the database with seeds from db/seeds"
  task seed: :environment do
    OpenIshkur::Seeds.repopulate!
  end
end

task db: %w(neo4j:start db:seed elasticsearch:import:all)
