module OpenIshkur
  module Seeds
    class Collection
      def initialize(path)
        @path = path
        @matcher = File.join path, '*.yml'
      end

      def all
        Dir[@matcher].map do |path|
          Model.new path: path
        end
      end

      delegate :each, to: :all
    end
  end
end
