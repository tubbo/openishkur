namespace :db do
  desc "Populate the database with seeds from db/seeds"
  task seed: :environment do
    OpenIshkur.seed!
  end
end
