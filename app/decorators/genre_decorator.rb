class GenreDecorator < Draper::Decorator
  delegate_all

  def node_cache_key
    "#{h.genre_graph_cache_key}/#{model.cache_key}"
  end
end
