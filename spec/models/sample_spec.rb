require 'rails_helper'

RSpec.describe Sample, type: :model do
  subject do
    build :sample
  end

  it 'requires a file' do
    expect(subject).to be_valid
  end

  it 'uploads file' do
    expect(subject.save).to be true
  end
end
