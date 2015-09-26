module OpenIshkur
  module Seeds
    extend ActiveSupport::Autoload

    autoload :Collection
    autoload :Model
    autoload :Connection
    autoload :Seed

    def self.path
      File.join Rails.root, 'db', 'seeds'
    end

    def self.models
      @models ||= Collection.new path
    end

    def self.connections
      models.map(&:connections).flatten
    end

    def self.install
      puts "Seeding genre data"
      models.each do |model|
        model.save
        puts model.errors.full_messages.to_sentence unless model.persisted?
      end
      puts "Creating graph connections"
      connections.each do |connection|
        connection.save
        puts connection.errors.full_messages.to_sentence unless connection.persisted?
      end
    end
  end
end
