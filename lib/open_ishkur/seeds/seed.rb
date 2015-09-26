module OpenIshkur
  # Helper class for seeding the database, used to populate data into
  # the database as well as remove all records from it for a given
  # model.
  class Seed
    # @attr_reader [String] Full path to the YAML file.
    attr_reader :path

    # @attr_reader [Class] Model object this class is seeding.
    attr_reader :model

    # @param [String] path - Full path to the YAML file.
    def initialize(path)
      @path = path
      @name = File.basename(path).gsub(/\.yml/, '')
      @model = @name.classify.constantize
    end

    # Create all models that have not already been defined and persist
    # them to the database.
    #
    # @return [Boolean] whether all models were created.
    def populate
      params.reject do |_, attributes|
        model.where(attributes).any?
      end.all? do |name, attributes|
        puts "Creating #{model} :#{name}"
        model.create attributes
      end
    end

    # Remove all models related to this seed object from the database.
    # This is just calling +destroy_all+ on the model, and returning its
    # result.
    #
    # @return [Boolean] whether all models were destroyed.
    def destroy
      model.destroy_all
    end

    private

    def params
      yaml.with_indifferent_access
    end

    def yaml
      YAML.load_file contents
    end

    def contents
      erb.result(binding)
    end

    def erb
      ERB.new file
    end

    def file
      File.read path
    end
  end
end
