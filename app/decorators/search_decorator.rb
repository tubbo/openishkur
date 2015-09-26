class SearchDecorator < ApplicationDecorator
  delegate_all

  def results
    model.records
  end
end
