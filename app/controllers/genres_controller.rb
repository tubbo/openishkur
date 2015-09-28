# Genres API
class GenresController < ApplicationController
  expose :genres do
    Genre.all
  end

  expose :genre do
    Genre.find(params[:id])
  end

  expose :revision, ancestor: :genre
  expose :influences do
    Influence.all.map(&:decorate)
  end

  # Index page, all genres graph
  def index
    respond_to do |format|
      format.html # show.html.haml
      format.json # show.json.jbuilder
    end
  end

  # Show a single genre's details
  def show
    respond_with genre
  end

  def new
    render :new
  end

  def create
    @genre = Genre.new edit_params
    @genre.save
    respond_with @genre
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
