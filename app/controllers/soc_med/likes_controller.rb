require 'soc_med/services/likes/create'
require 'soc_med/services/likes/destroy'

module SocMed
  class LikesController < ApplicationController
    def create
      like_service::Create.call(params) do |success, failure|
        success.call {|object| render json: { like: serialized_resource(object, ::Blueprints::Likes::OverviewBlueprint, view: :extended) } }
        failure.call(&method(:error))
      end
    end

    def destroy
      like_service::Destroy.call(params) do |success, failure|
        success.call(&method(:object))
        failure.call(&method(:error))
      end
    end

    private

    def like_service
      SocMed::Services::Likes
    end

  end
end