require 'soc_med/services/blocks/create'
require 'soc_med/services/blocks/destroy'

module SocMed
  class BlocksController < ApplicationController
    def create
      block_service::Create.call(params) do |success, failure|
        success.call(&method(:object))
        failure.call(&method(:error))
      end
    end

    def destroy
      block_service::Destroy.call(params) do |success, failure|
        success.call(&method(:object))
        failure.call(&method(:error))
      end
    end

    private

    def block_service
      SocMed::Services::Blocks
    end

  end
end