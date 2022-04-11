module Api

    module V1
  
      class AuthenticationController < ApplicationController
        rescue_from ActionController::ParameterMissing, with: :missing_parameter
        def create
          p params.require(:username).inspect
          p params.require(:username).inspect

          render json: {token: '123'}, status: :unprocessable_entity
        end

        private

        def missing_parameter(e)
          render json: {error: e.message }, status: :unprocessable_entity
        end
      end
    end
end