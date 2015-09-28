module OpenIshkur
  module Seeds
    class Model
      include ActiveModel::Model

      delegate :content, :metadata, to: :seed

      attr_reader :record

      attr_accessor :path

      validates :path, presence: true
      validate :name_is_not_taken

      def attributes
        {
          name: metadata[:name],
          description: content
        }
      end

      def connections
        [:antecedents, :descendants].select do |type|
          metadata[type].present?
        end.map do |type|
          metadata[type].map do |to_name|
            Connection.new(
              from_record: seed.record,
              to_record_name: to_name,
              type: type
            )
          end
        end.flatten
      end

      def save
        valid? && create && persisted?
      end

      def persisted?
        record.present? && record.persisted?
      end

      def name
        File.basename(path).gsub(/\.md/, '')
      end

      private

      def influences
        (metadata[:antecedents] + metadata[:descendants]).flatten
      end

      def seed
        @seed ||= Seed.find name
      end

      def name_is_not_taken
        if Genre.where(name: name).any?
          errors.add :name, 'is already a genre'
        end
      end

      def create
        @record = Genre.create! attributes
        errors[:genre] << record.errors unless record.persisted?
        persisted?
      end
    end
  end
end
