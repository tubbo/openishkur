module OpenIshkur
  module Seeds
    class Connection
      include ActiveModel::Model

      attr_accessor :from_record, :to_record_name, :type

      validates :from_record, presence: true
      validates :to_record, presence: true
      validates :type, presence: true, inclusion: { in: [:antecedents, :descendants] }

      def to_record
        Genre.find_by name: to_record_name.titleize
      end

      def save
        valid? && create
      end

      private

      def create
        from_record.send(type) << to_record
        from_record.save
      end

      def model_saved
        errors.add :model, 'was not saved' unless model.persisted?
      end
    end
  end
end
