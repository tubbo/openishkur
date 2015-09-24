class Genre
  include Neo4j::ActiveNode

  property :name, type: String
  property :description, type: String

  has_many :in, :samples

  validates :name, presence: true
  validates :description, presence: true
end
