class User
  module FeatureTestHelpers
    extend ActiveSupport::Concern

    included do
      include Warden::Test::Helpers
    end

    def sign_in(user)
      login_as user, scope: :user
    end
  end
end
