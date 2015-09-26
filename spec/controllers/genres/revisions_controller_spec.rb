require 'rails_helper'

RSpec.describe Genres::RevisionsController, type: :controller do
  let :genre do
    create :genre
  end

  let :revision do
    create :revision, genre: genre
  end

  let :params do
    {
      name: genre.name,
      description: 'a totally new description'
    }
  end

  describe "GET #new" do
    before { get :new, genre_id: genre.id }

    it "responds successfully" do
      expect(response).to have_http_status(:success)
    end

    it "returns the edit genre form" do
      expect(response).to render_template('new')
    end
  end

  describe "POST #create" do
    before do
      post :create, genre_id: genre.id, id: revision.id, revision: params
    end

    it "responds successfully" do
      expect(response).to have_http_status(:success)
    end

    it "creates a revision" do
      expect(assigns(:revision)).to be_valid
      expect(assigns(:revision)).to be_persisted
    end
  end

  describe "PUT #update" do
    context "when revision is approved" do
      before do
        patch :update, \
          genre_id: genre.id,
          id: revision.id,
          revision: { approved: true }
      end

      it "responds successfully" do
        expect(response).to have_http_status(:success)
      end

      it "sets approval on revision" do
        expect(assigns(:revision)).to be_approved
      end

      it "applies updates to genre" do
        genre.reload
        expect(genre.name).to eq(revision.name)
        expect(genre.description).to eq(revision.description)
      end
    end

    context "when revision is declined" do
      before do
        patch :update, \
          genre_id: genre.id, id: revision.id, revision: { approved: false }
      end

      it "responds successfully" do
        expect(response).to have_http_status(:success)
      end

      it "sets approval on revision" do
        expect(assigns(:revision)).not_to be_approved
      end
    end
  end
end
