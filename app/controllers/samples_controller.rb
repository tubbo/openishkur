class SamplesController < ApplicationController
  resource :sample, ancestor: :genre
  before_action :authenticate_user!

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
