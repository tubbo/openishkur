class Genre
  # An edit made to an existing genre page, which must be approved by an
  # admin before being applied to the genre.
  class Revision
    include Neo4j::ActiveNode

    property :name, type: String
    property :description, type: String
    property :approved, type: Boolean
    property :approved_on, type: Date

    has_one :out, :genre, type: :belongs_to
    has_one :out, :user, type: :belongs_to

    validates :name,        presence: true
    validates :genre,       presence: true
    validates :description, presence: true
    validates :user,        presence: true

    validate :changes_made
    validate :approval_not_set, on: :create

    before_save :sync, if: :just_approved?

    class << self
      # All revisions which have been approved.
      def approved
        where approved: true
      end

      # All revisions which have been declined.
      def declined
        where approved: false
      end

      # All revisions waiting to be approved.
      def enqueued
        where approved: nil
      end
    end

    def just_approved?
      approved_changed? && approved?
    end

    def sync
      approve_revision && update_genre
    end

    def applicable_attributes
      attributes.slice(:name, :description).select do |_, value|
        value.present?
      end
    end

    private

    def changes_made
      if name == genre.name && description == genre.description
        errors.add :base, 'makes no changes to the genre'
      end
    end

    def approval_not_set
      errors.add :approved, 'cannot be set' if approved.present?
    end

    def approve_revision
      return true if approved_on.present?
      self.approved_on = Date.now
    end

    def update_genre
      genre.update_attributes applicable_attributes
    end
  end
end
