module OpenIshkur
  module Seeds
    class Model
      include ActiveModel::Model

      delegate :content, to: :preamble

      attr_reader :record

      attr_accessor :path

      validates :path, presence: true
      validate :name_is_not_taken

      def attributes
        metadata.slice :name, :description
      end

      def connections
        [:antecedents, :descendants].flat_map do |type|
          metadata[type].split(", ").map do |name|
            Connection.new(
              from_record: record,
              to_record_name: name,
              type: type
            )
          end
        end
      end

      def save
        @record ||= Genre.create! attributes
      end

      def persisted?
        @record.present?
      end

      private

      def influences
        (metadata[:antecedents] + metadata[:descendants]).flatten
      end

      def metadata
        preamble.metadata.with_indifferent_access
      end

      def preamble
        @preamble ||= Preamble.load path
      end

      def name_is_not_taken
        if Genre.where(name: name).any?
          errors.add :name, 'is already a genre'
        end
      end
    end
  end
end
