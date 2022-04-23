class UsersController < ApplicationController
  def create
    user = User.new(user_params)
  end

  def destroy
  end

  private

  def user_params
    params.require(:users).permit(:username, :password)
  end
end
