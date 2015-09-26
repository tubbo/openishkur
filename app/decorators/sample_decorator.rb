class SampleDecorator < Draper::Decorator
  delegate_all

  def artist
    model.artist || "???"
  end

  def track
    model.track || "???"
  end

  def href
    "#" + model.number.to_s
  end
end
