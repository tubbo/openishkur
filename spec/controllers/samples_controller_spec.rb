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

  describe "GET #new" do
    before do
      get :new, genre_id: sample.genre.id
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "renders new sample form" do
      expect(response).to render_template('samples/new')
    end
  end

  describe "POST #create" do
    before do
      request.env['HTTP_REFERER'] = '/'
      post :create, sample: sample_params, genre_id: sample.genre.id
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "uploads a new sample" do
      expect(controller.sample).to be_valid
      expect(controller.sample).to be_persisted
    end
  end

  describe "DELETE #destroy" do
    before do
      delete :destroy, id: sample.id, genre_id: sample.genre.id
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "removes the selected sample" do
      expect(controller.sample).to be_destroyed
    end
  end
end
