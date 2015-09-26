require 'rails_helper'

RSpec.describe SearchesController, type: :controller do
  let(:genre) { create :genre }

  it "searches genres" do
    get :show, q: genre.name

    expect(response).to be_success
    expect(controller.results).to include(genre)
  end
end
