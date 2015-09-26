# Genres API
class GenresController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  expose :genres do
    Genre.all.to_a.map(&:decorate)
  end

  expose :genre do
    Genre.find(params[:id]).decorate
  end

  # Index page, all genres graph
  def index
    respond_with genres
  end

  # Show a single genre's details
  def show
    respond_with genre
  end

  def new
    authorize genre
    render :new
  end

  def edit
    authorize genre
    render :edit
  end

  def create
    @genre = Genre.new edit_params
    authorize @genre
    @genre.save
    respond_with @genre
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
      :name, :description, :antecedents, :descendants,
      samples: [:artist, :track, :file]
    )
  end
end
