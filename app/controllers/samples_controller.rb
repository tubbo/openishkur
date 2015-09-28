# Samples API
class SamplesController < ApplicationController
  expose :genre do
    Genre.find params[:genre_id]
  end
  expose :sample do
    Sample.find_by id: params[:id], genre_id: params[:genre_id]
  end
  expose :new_sample do
    Sample.create edit_params
  end

  # Upload a new Sample.
  def new
    render :new
  end

  def create
    new_sample.genre = genre
    new_sample.save
    respond_with genre
  end

  def destroy
    sample.destroy
    respond_with genre
  end

  private

  def edit_params
    params.require(:sample).permit :artist, :track, :file
  end
end
