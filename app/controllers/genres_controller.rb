# Genres API
class GenresController < ApplicationController
  resource :genre
  before_action :authenticate_user!, except: [:index, :show]

  # Index page, all genres graph
  def index
    respond_with genres
  end

  # Show a single genre's details
  def show
    respond_with genre
  end

  def new
    render :new
  end

  def edit
    render :edit
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
    params.require(:genre).permit(
      :name, :description, samples: [:artist, :track, :file]
    )
  end
end
