class Genre
  include Neo4j::ActiveNode

  property :name, type: String
  property :description, type: String

  has_many :in, :samples, type: false

  has_many :out, :antecedents, class_name: 'Genre', type: :influences
  has_many :out, :descendants, class_name: 'Genre', type: :influences

  validates :name, presence: true
  validates :description, presence: true
end
