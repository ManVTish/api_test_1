module Api

    module V1
  
      class AuthenticationController < ApplicationController
        class AuthenticationError < StandardError
        end

        rescue_from ActionController::ParameterMissing, with: :missing_parameter
        rescue_from AuthenticationError, with: :handle_unauthenticated

        def create
          user = User.find_by(username: params.require(:username))
          #p params.require(:username).inspect
          raise AuthenticationError unless user.authenticate(params.require(:password))
          token = AuthenticationTokenService.call(user.id)

          render json: {token: token}, status: :unprocessable_entity
        end

        private

        def missing_parameter(e)
          render json: {error: e.message }, status: :unprocessable_entity
        end

        def handle_unauthenticated
          header :unauthorized
        end
      end
    end
end