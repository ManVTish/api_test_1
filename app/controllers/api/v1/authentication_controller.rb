module Api

    module V1
  
      class AuthenticationController < ApplicationController
        def create
          p params.require(:username).inspect
          p params.require(:username).inspect

          render json: {token: '123'}, status: unprocessable_entity
        end
      end
    end
end