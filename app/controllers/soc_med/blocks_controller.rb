require 'soc_med/services/blocks/create'
require 'soc_med/services/blocks/destroy'
require_relative '../../blueprints/blocks/overview_blueprint'

module SocMed
  class BlocksController < ApplicationController
    def create
      block_service::Create.call(params) do |success, failure|
        success.call { |object| success_response(block: serialized_resource(object, ::Blocks::OverviewBlueprint)) }
        failure.call(&method(:error_response))
      end
    end

    def destroy
      block_service::Destroy.call(params) do |success, failure|
        success.call { success_response(block: { destroyed: true }) }
        failure.call(&method(:error_response))
      end
    end

    private

    def block_service
      SocMed::Services::Blocks
    end

  end
end