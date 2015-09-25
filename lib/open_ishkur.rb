# Library code for the app.
module OpenIshkur
  extend ActiveSupport::Autoload

  autoload :Strategy
  autoload :Responder
  autoload :Seed

  def self.seed_files
    Dir.glob File.join(Rails.root, 'db', 'seeds', '*.yml')
  end

  def self.seed!
    seed_files.each do |path|
      Seed.populate! path
    end
  end
end
