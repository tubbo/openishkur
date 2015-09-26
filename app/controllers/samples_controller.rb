# Samples API
class SamplesController < ApplicationController
  expose :genre
  resource :sample, ancestor: :genre
  before_action :authenticate_user!

  # Upload a new Sample.
  def new
    render :new
  end

  def create
    sample.save
    respond_with sample
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
