module OpenIshkur
  module Seeds
    class Seed
      attr_accessor :name

      delegate :content, to: :preamble

      def initialize(name)
        @name = name
      end

      def self.find(name)
        new(name)
      end

      def record
        Genre.find_by! name: preamble.metadata['name']
      end

      def persisted?
        record.present?
      end

      def metadata
        preamble.metadata.with_indifferent_access
      end

      def preamble
        @preamble ||= Preamble.load path
      end

      def path
        File.join Seeds.path, "#{name}.md"
      end
    end
  end
end
