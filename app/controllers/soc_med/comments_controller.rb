require 'soc_med/services/comments/create'
require 'soc_med/services/comments/destroy'
require_relative '../../blueprints/comments/overview_blueprint'

module SocMed
  class FollowsController < ApplicationController
    def create
      comment_service::Create.call(params) do |success, failure|
        success.call { |object| success_response(follow: serialized_resource(object, ::Follows::OverviewBlueprint)) }
        failure.call(&method(:error_response))
      end
    end

    def update

    end

    def destroy
      comment_service::Destroy.call(params) do |success, failure|
        success.call { success_response(follow: { destroyed: true }) }
        failure.call(&method(:error_response))
      end
    end

    private

    def comment_service
      SERVICE_BASE::Comments
    end

  end
end