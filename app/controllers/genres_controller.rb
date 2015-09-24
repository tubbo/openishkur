class GenresController < ApplicationController
  resource :genre

  def index
    respond_with genres
  end

  def show
    respond_with genre
  end

  def create
    genre.save
    respond_with genre
  end

  def update
    genre.update(edit_params)
    respond_with genre
  end

  def destroy
    genre.destroy
    respond_with genre
  end

  private

  def edit_params
    params.require(:genre).permit :name, :description, :samples
  end
end
