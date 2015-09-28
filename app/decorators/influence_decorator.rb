class InfluenceDecorator < ApplicationDecorator
  delegate_all

  def from
    model.from_node.id
  end

  def to
    model.to_node.id
  end

  def label
    if model.direction == 'antecedent'
      'was influenced by'
    else
      'influences'
    end
  end
end
