# Search all genres
class SearchesController < ApplicationController
  skip_after_action :verify_authorized
  skip_after_action :verify_policy_scoped

  # GET /search?q=genre+name
  def show
    respond_to do |format|
      format.html # show.html.haml
      format.json # show.json.jbuilder
    end
  end

  private

  def results
    Genre.search(params[:q]).records
  end
  helper_method :results
end
