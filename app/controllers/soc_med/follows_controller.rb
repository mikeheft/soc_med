require 'soc_med/services/follows/create'
require 'soc_med/services/follows/destroy'
require_relative '../../blueprints/follows/overview_blueprint'

module SocMed
  class FollowsController < ApplicationController
    def create
      follow_service::Create.call(params) do |success, failure|
        success.call { |object| success_response(follow: serialized_resource(object, ::Follows::OverviewBlueprint)) }
        failure.call(&method(:error_response))
      end
    end

    def destroy
      follow_service::Destroy.call(params) do |success, failure|
        success.call { success_response(follow: { destroyed: true }) }
        failure.call(&method(:error_response))
      end
    end

    private

    def follow_service
      SocMed::Services::Follows
    end

  end
end