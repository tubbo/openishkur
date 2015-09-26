# Library code for the app.
module OpenIshkur
  extend ActiveSupport::Autoload

  autoload :Strategy
  autoload :Responder
  autoload :Seeds

  def self.eager_load!
    Seeds.eager_load!
    super
  end
end
