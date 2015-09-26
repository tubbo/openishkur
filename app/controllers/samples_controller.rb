# Samples API
class SamplesController < ApplicationController
  expose :genre
  expose :sample, ancestor: :genre

  # Upload a new Sample.
  def new
    render :new
  end

  def create
    @genre = genre.samples.create(edit_params)
    respond_with @sample
  end

  def destroy
    sample.destroy
    respond_with sample
  end

  private

  def edit_params
    params.require(:sample).permit :artist, :track, :file
  end
end
