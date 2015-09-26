class GenreDecorator < Draper::Decorator
  delegate_all

  def description
    h.simple_format model.description
  end
end
