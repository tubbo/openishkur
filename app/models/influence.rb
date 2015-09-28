# Describes the relationship between two Genres on the graph.
class Influence
  include Neo4j::ActiveRel
  include Draper::Decoratable

  property :direction, type: String

  from_class 'Genre'
  to_class 'Genre'
  type 'influenced_by'

  validates :direction, presence: true, inclusion: {
    in: %w(antecedent descendant)
  }

  class << self
    alias_method :scoped, :all
  end
end
