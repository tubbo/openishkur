require 'rails_helper'

RSpec.describe SamplesController, type: :controller do
  let :sample do
    create :sample
  end

  let :sample_params do
    {
      artist: 'artist',
      track: 'track',
      file: 'file'
    }
  end

  before do
    sign_in!
  end

  describe "GET #new" do
    it "returns http success" do
      get :new, genre_id: sample.genre.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "returns http success" do
      post :create, sample: sample_params, genre_id: sample.genre.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "DELETE #destroy" do
    it "returns http success" do
      delete :destroy, id: sample.id, genre_id: sample.genre.id
      expect(response).to have_http_status(:success)
    end
  end
end
