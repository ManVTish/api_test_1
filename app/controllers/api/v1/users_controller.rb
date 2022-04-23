module Api

  module V1

    class UsersController < ApplicationController

        def create
            user = User.new(user_params)

            if user.save
              render json: :user, status: :created
            else
              render json: user.errors, status: :unprocessable_entity
            end
        end

        def destroy
            user = User.find(params[:id])
            user.destroy!
            head :no_content
        end

        private

        def user_params
            params.require(:user).permit(:username, :password)
        end
    end

  end
end
