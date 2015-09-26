class GenreDecorator < ApplicationDecorator
  delegate_all

  def description
    h.simple_format model.description
  end
end
