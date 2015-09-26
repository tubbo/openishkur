require 'rails_helper'

RSpec.describe GenresController, type: :controller do
  let :genre do
    create :genre
  end

  let :genre_params do
    { name: 'new genre' }
  end

  describe "GET #index" do
    before { get :index }

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "renders genre graph" do
      expect(response).to render_template('genres/index')
    end
  end

  describe "GET #show" do
    before { get :show, id: genre.id }

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "renders genre details" do
      expect(assigns(:genre)).to eq(genre)
      expect(response).to render_template('genres/show')
    end
  end

  describe "GET #new" do
    before { get :new }

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "renders new genre form" do
      expect(response).to render_template('genres/new')
    end
  end

  describe "POST #create" do
    before do
      post :create, genre: genre_params
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "creates a new genre" do
      expect(assigns(:genre)).to be_valid
      expect(assigns(:genre)).to be_persisted
    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      delete :destroy, id: genre
      expect(response).to have_http_status(:redirect)
    end

    it "deletes a genre" do
      expect(controller.genre).to be_destroyed
    end
  end
end
