class ApplicationDecorator < Draper::Decorator
  def self.collection_decorator_class
    Application::CollectionDecorator
  end
end
