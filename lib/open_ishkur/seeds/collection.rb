module OpenIshkur
  module Seeds
    # Collects all seed files together to run commands on them as a
    # whole. Implements +Enumerable+, so all collection-style methods
    # can be run on this object.
    class Collection
      include Enumerable

      # Used to glob for files in db/seeds.
      #
      # @attr_reader [String]
      attr_reader :matcher

      def initialize
        @matcher = File.join(Rails.root, 'db', 'seeds', '*.yml')
      end

      # Instantiate a new collection and repopulate the database.
      #
      # @return [Boolean] whether all seeds repopulated
      def self.repopulate
        new.repopulate
      end

      # Implement +Enumerable+
      #
      # @return [Iterator]
      delegate :each, to: :seeds

      # Run +populate+ on all seeds.
      #
      # @return [Boolean] whether all seeds populated
      def populate
        all? do |seed|
          seed.populate
        end
      end

      # Run +destroy+ on all seeds.
      #
      # @return [Boolean] whether all seeds were destroyed
      def destroy
        all? do |seed|
          seed.destroy
        end
      end

      # Run +destroy+ and +populate+ on all seeds.
      #
      # @return [Boolean] whether all seeds were repopulated.
      def repopulate
        destroy && populate
      end

      private

      # Seed objects used to manipulate data.
      #
      # @private
      # @return [Array<Seed>]
      def seeds
        files.map do |file_path|
          Seed.new file_path
        end
      end

      # File names of each seed origin YAML.
      #
      # @private
      # @return [Array<String>] of file paths
      def files
        @files ||= Dir.glob matcher
      end
    end
  end
end
