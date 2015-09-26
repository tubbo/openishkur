class ApplicationController < ActionController::Base
  include Resource
  include Pundit

  self.responder = OpenIshkur::Responder

  respond_to :html

  protect_from_forgery with: :exception

  decent_configuration do
    strategy OpenIshkur::Strategy
    attributes :edit_params
  end

  layout :use_layout?

  rescue_from Pundit::NotAuthorizedError, with: :unauthorized
  rescue_from Neo4j::RecordNotFound,      with: :not_found

  after_action :populate_headers

  def unauthorized(exception)
    logger.error exception.message
    render :unauthorized, status: :unauthorized, error: exception
  end

  def not_found(exception)
    logger.error exception.message
    render :not_found, status: :not_found, error: exception
  end

  private

  def use_layout?
    request.xhr? ? false : 'application'
  end

  def populate_headers
    flash.each do |type, message|
      request.env["X-Flash-#{type.titleize}"] = message
    end
  end
end
