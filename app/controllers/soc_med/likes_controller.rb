require 'soc_med/services/likes/create'
require 'soc_med/services/likes/destroy'
require_relative '../../blueprints/likes/overview_blueprint'

module SocMed
  class LikesController < ApplicationController
    def create
      like_service::Create.call(like_params) do |success, failure|
        success.call {|object| render json: { like: serialized_resource(object, ::Likes::OverviewBlueprint) } }
        failure.call(&method(:error_response))
      end
    end

    def destroy
      like_service::Destroy.call(like_params) do |success, failure|
        success.call(&method(:object))
        failure.call(&method(:error))
      end
    end

    private

    def like_params
      params.require(:like).permit(:owner_id, :owner_type, :target_id, :target_type)
    end

    def like_service
      SocMed::Services::Likes
    end

  end
end