class Application::CollectionDecorator < Draper::CollectionDecorator
  def new(params = {}, *args)
    object.create(params)
  end
end
