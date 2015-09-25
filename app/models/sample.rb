# An uploaded MP3 file that serves as an exemplary work for a given
# Genre. Usually no more than 30 seconds in length, Samples are looped
# indefinitely when a user clicks on them.
class Sample
  include Neo4j::ActiveNode
  include Refile::Attachment

  property :artist,     type: String
  property :track,      type: String
  property :file_id,    type: String
  property :number,     type: Integer
  property :created_at, type: DateTime

  has_one :out, :genre

  before_validation :validate_file
  before_validation :generate_number

  validates :file, presence: true
  validates :genre, presence: true
  validates :number, presence: true, numericality: true

  validate :file_content_type

  before_save :store_file
  before_destroy :delete_file

  private

  def store_file
    file_attacher.store!
  end

  def delete_file
    file_attacher.delete!
  end

  def validate_file
    file_attacher.valid?
    file_attacher.errors.each do |error|
      errors.add :file, error
    end
  end

  def generate_number
    self.number = genre.samples.count + 1 if genre.present?
  end
end
