require 'rails_helper'

RSpec.describe Genre::Revision, type: :model do
  subject do
    build :revision
  end

  it "validates changes were made" do
    subject.name = genre.name
    expect(subject).not_to be_valid
  end

  it "validates approval not set before created" do
    subject.approved = true
    expect(subject).not_to be_valid
  end

  context "when saved" do
    before { subject.save }

    it "syncs to genre after approval" do
      expect(subject.update(approval: true)).to be true
      expect(subject.genre.name).to eq(subject.name)
    end
  end
end
