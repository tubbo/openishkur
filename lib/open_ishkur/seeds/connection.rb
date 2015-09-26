module OpenIshkur
  module Seeds
    class Connection
      include ActiveModel::Model

      attr_accessor :from_record, :to_record_name, :type, :influence

      validates :from_record, presence: true
      validates :to_record, presence: true
      validates :type, presence: true, inclusion: { in: [:antecedents, :descendants] }

      def to_record
        Seed.find(to_record_name).record
      end

      def save
        valid? && create
      end

      def persisted?
        influence.present?
      end

      def attributes
        {
          from_node: from_record,
          to_node: to_record,
          direction: type.to_s.singularize
        }
      end

      private

      def create
        self.influence = Influence.create(attributes)
        raise influence.errors.full_messages.to_sentence if influence.errors.any?
        influence.persisted?
      end

      def model_saved
        errors.add :model, 'was not saved' unless model.persisted?
      end
    end
  end
end
