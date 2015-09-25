module OpenIshkur
  class Seed
    attr_reader :path
    attr_reader :model

    def initialize(path)
      @path = path
      @name = File.basename(path).gsub(/\.yml/, '')
      @model = @name.classify.constantize
    end

    def self.populate!(path)
      new(path).populate
    end

    def populate
      yaml.each do |key, attributes|
        Rails.logger.debug ":#{key} #{model}"
        model.create attributes
      end
    end

    def yaml
      YAML.load_file(contents).with_indifferent_access
    end

    def contents
      ERB.new(File.read(path)).result(binding)
    end
  end
end
