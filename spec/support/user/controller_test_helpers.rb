class User
  module ControllerTestHelpers
    extend ActiveSupport::Concern

    included do
      include Devise::TestHelpers

      before do
        @request.env["devise.mapping"] = Devise.mappings[:user]
      end
    end

    def sign_in!
      user = create(:user)
      user.confirm
      sign_in user
    end
  end
end
