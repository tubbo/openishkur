json.nodes genres do |genre|
  json.id genre.id
  json.label genre.name
end
json.edges genres.influences do |influence|
  json.from influence.from_id
  json.to influence.to_id
end
