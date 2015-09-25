class Genre
  include Neo4j::ActiveNode

  property :name,         type: String
  property :description,  type: String

  has_many :in, :samples, type: false

  has_many :out, :antecedents, model_class: 'Genre', rel_class: 'Influence'
  has_many :out, :descendants, model_class: 'Genre', rel_class: 'Influence'

  validates :name,        presence: true
  validates :description, presence: true

  # Return the last updated at in UNIX Epoch time.
  def self.last_updated_at
    all.pluck(:updated_at).max.to_i
  end
end
