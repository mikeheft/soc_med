require 'soc_med/services/likes/create'
require 'soc_med/services/likes/destroy'
require_relative '../../blueprints/likes/overview_blueprint'

module SocMed
  class LikesController < ApplicationController
    def create
      like_service::Create.call(params) do |success, failure|
        success.call { |object| success_response(like: serialized_resource(object, ::Likes::OverviewBlueprint)) }
        failure.call(&method(:error_response))
      end
    end

    def destroy
      like_service::Destroy.call(params) do |success, failure|
        success.call { success_response(like: { destroyed: true }) }
        failure.call(&method(:error_response))
      end
    end

    private

    def like_service
      SocMed::Services::Likes
    end

  end
end