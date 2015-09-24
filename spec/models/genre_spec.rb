require 'rails_helper'

RSpec.describe Genre, type: :model do
  subject { build :genre }

  it "represents a node on the graph" do
    expect(subject).to be_valid
  end
end
