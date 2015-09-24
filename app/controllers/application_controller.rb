class ApplicationController < ActionController::Base
  self.responder = OpenIshkur::Responder

  respond_to :html

  include Resource
  include Pundit

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  decent_configuration do
    strategy OpenIshkur::ExposureStrategy
  end

  layout :use_layout?

  rescue_from Pundit::NotAuthorizedError, with: :unauthorized
  rescue_from Neo4j::DocumentNotFoundError, with: :not_found

  after_action :populate_flash_headers
  after_action :verify_authorized
  after_action :verify_policy_scoped

  def unuauthorized(exception)
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

  def populate_flash_headers
    flash.each do |type, message|
      request.env["X-Flash-#{type.titleize}"] = message
    end
  end
end
