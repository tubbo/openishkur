module GenresHelper
  def genre_graph_cache_key
    "genres/graph/#{Genre.last_updated_at}"
  end
end
