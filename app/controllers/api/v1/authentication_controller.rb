module Api

    module V1
  
      class AuthenticationController < ApplicationController
        rescue_from ActionController::ParameterMissing, with: :missing_parameter
        def create
          user = User.find_by(username: params.require(:username))
          #p params.require(:username).inspect
          token = AuthenticationTokenService.call(user)

          render json: {token: token}, status: :unprocessable_entity
        end

        private

        def missing_parameter(e)
          render json: {error: e.message }, status: :unprocessable_entity
        end
      end
    end
end