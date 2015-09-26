class ApplicationController < ActionController::Base
  self.responder = OpenIshkur::Responder

  respond_to :html

  include Resource
  include Pundit

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  decent_configuration do
    strategy OpenIshkur::Strategy
    attributes :edit_params
  end

  layout :use_layout?

  rescue_from Pundit::NotAuthorizedError, with: :unauthorized

  after_action :populate_headers
  after_action :verify_authorized, unless: :devise?
  after_action :verify_policy_scoped, unless: :devise?

  def unuauthorized(exception)
    logger.error exception.message
    render :unauthorized, status: :unauthorized, error: exception
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

  def devise?
    self.class.name =~ /Devise/
  end
end
