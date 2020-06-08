require 'soc_med/services/follows/create'
require 'soc_med/services/follows/destroy'

module SocMed
  class FollowsController < ApplicationController
    def create
      follow_service::Create.call(params) do |success, failure|
        success.call { |object| success_response(like: serialized_resource(object, ::Likes::OverviewBlueprint)) }
        failure.call(&method(:error_response))
      end
    end

    def destroy
      follow_service::Destroy.call(params) do |success, failure|
        success.call { success_response(like: { destroyed: true }) }
        failure.call(&method(:error_response))
      end
    end

    private

    def follow_service
      SocMed::Services::Follows
    end

  end
end