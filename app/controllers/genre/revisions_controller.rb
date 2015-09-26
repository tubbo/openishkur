class Genre
  class RevisionsController < ApplicationController
    expose :genre
    expose :revision, ancestor: :genre

    def new
      render :new
    end

    def create
      revision.save
      respond_with revision
    end

    def update
      revision.update approved: params[:revision][:approved]
      respond_with revision
    end
  end
end
