class UsersController < ApplicationController
  expose :user

  def show
    respond_with user
  end
end
