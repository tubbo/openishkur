module OpenIshkur
  module Seeds
    autoload :Collection
    autoload :Model
    autoload :Connection

    def self.path
      File.join Rails.root, 'db', 'seeds'
    end

    def self.models
      @models ||= Collection.new path
    end

    def self.connections
      models.flat_map(&:connections)
    end

    def self.install
      puts "Seeding genre data"
      models.each do |model|
        model.save
      end
      puts "Creating graph connections"
      connections.each do |connection|
        connection.save
      end
    end
  end
end
