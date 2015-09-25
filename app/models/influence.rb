class Influence
  include Neo4j::ActiveRel

  property :direction, type: String

  from_class Genre
  to_class Genre
  type :influences

  validates :direction, presence: true, inclusion: {
    in: %w(antecedent descendant)
  }
end
