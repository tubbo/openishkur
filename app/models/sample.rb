class Sample
  include Neo4j::ActiveNode
  include Refile::Attachment

  property :artist, type: String
  property :track, type: String
  property :file_id, type: String

  has_one :out, :genre

  validates :file_id, presence: true

  before_save :store_file
  before_destroy :delete_file
  before_validation :validate_file

  private

  def store_file
    file_attacher.store!
  end

  def delete_file
    file_attacher.delete!
  end

  def bubble_file_errors_up
    file_attacher.valid?
    file_attacher.errors.each do |error|
      errors.add :file, error
    end
  end
end
