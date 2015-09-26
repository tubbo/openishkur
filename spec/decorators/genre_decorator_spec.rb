require 'rails_helper'

RSpec.describe GenreDecorator do
  let :genre do
    create :genre
  end

  subject do
    GenreDecorator.decorate genre
  end

  let :h do
    subject.send :h
  end

  it "generates node cache key" do
    expect(subject.node_cache_key).to match(%r{genres/graph/\d{10}/genres})
  end

  it "formats description" do
    expect(subject.description).to eq(h.simple_format(genre.description))
  end
end
