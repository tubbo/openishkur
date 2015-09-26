# Genres API
class GenresController < ApplicationController
  expose :genres
  expose :genre
  expose :revision, ancestor: :genre
  expose :influences

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
    authorize genre
    render :new
  end

  def create
    @genre = Genre.new edit_params
    authorize @genre
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
