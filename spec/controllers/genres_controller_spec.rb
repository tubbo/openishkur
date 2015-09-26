require 'rails_helper'

RSpec.describe GenresController, type: :controller do
  let :genre do
    create :genre
  end

  let :genre_params do
    { name: 'new genre' }
  end

  let :user do
    create :user
  end

  before do
    sign_in!
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, id: genre.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, id: genre.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "returns http success" do
      post :create, genre: genre_params
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #update" do
    it "returns http success" do
      put :update, id: genre, genre: genre_params
      expect(response).to have_http_status(:redirect)
    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      delete :destroy, id: genre
      expect(response).to have_http_status(:redirect)
    end
  end
end
