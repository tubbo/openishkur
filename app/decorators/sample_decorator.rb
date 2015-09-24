class SampleDecorator < Draper::Decorator
  delegate_all

  def artist
    model.artist || "???"
  end

  def track
    model.track || "???"
  end
end
