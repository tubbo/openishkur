require 'rails_helper'

RSpec.describe Sample, type: :model do
  subject do
    build :sample
  end

  let :attacher do
    double 'Refile::Attacher', store!: true, delete!: true
  end

  before do
    allow(subject).to receive(:file_attacher).and_return(attacher)
  end

  it 'requires a file' do
    expect(subject).to be_valid
  end

  it 'uploads file' do
    expect(subject.save).to be true, errors.full_messages.to_sentence
  end
end
