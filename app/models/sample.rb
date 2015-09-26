require 'refile/attachment/neo4j'

# An uploaded MP3 file that serves as an exemplary work for a given
# Genre. Usually no more than 30 seconds in length, Samples are looped
# indefinitely when a user clicks on them.
class Sample
  include Neo4j::ActiveNode
  include Draper::Decoratable

  extend Refile::Neo4j::Attachment

  property :artist,     type: String
  property :track,      type: String
  property :file_id,    type: String
  property :number,     type: Integer
  property :created_at, type: DateTime

  attachment :file

  has_one :out, :genre, type: :belongs_to

  before_validation :generate_number

  validates :number, presence: true, numericality: true

  private

  def generate_number
    self.number = genre.samples.count + 1 if genre.present?
  end
end
