module OpenIshkur
  # Library for seeding data into the database.
  module Seeds
    extend ActiveSupport::Autoload

    autoload :Collection
    autoload :Seed

    # Repopulate the database with seed data.
    #
    # @return [Boolean]
    def self.populate!
      Collection.repopulate
    end
  end
end
