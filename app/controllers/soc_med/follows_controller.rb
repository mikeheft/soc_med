require 'soc_med/services/follows/create'
require 'soc_med/services/follows/destroy'

module SocMed
  class FollowsController < ApplicationController
    def create
      follow_service::Create.call(params) do |success, failure|
        success.call(&method(:object))
        failure.call(&method(:error))
      end
    end

    def destroy
      follow_service::Destroy.call(params) do |success, failure|
        success.call(&method(:object))
        failure.call(&method(:error))
      end
    end

    private

    def follow_service
      SocMed::Services::Follows
    end

  end
end