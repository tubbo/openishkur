json.nodes genres do |genre|
  json.id genre.id
  json.label genre.name
end
json.edges influences do |influence|
  json.from influence.from_node.id
  json.to influence.to_node.id
end
