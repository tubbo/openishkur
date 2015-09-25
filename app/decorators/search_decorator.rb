class SearchDecorator < Draper::Decorator
  delegate_all

  def results
    model.records
  end
end
