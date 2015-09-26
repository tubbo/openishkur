class User
  module FeatureTestHelpers
    extend ActiveSupport::Concern

    included do
      include Warden::Test::Helpers

      after do
        test_reset!
      end
    end

    def sign_in(user)
      login_as user, scope: :user
    end
  end
end
