require 'dry_serialization/blueprinter'

module SocMed
  class ApplicationController < ActionController::Base
    SERVICE_BASE = SocMed::Services

    include DrySerialization::Blueprinter
    protect_from_forgery unless: -> { request.format.json? }

    private

    def error_response(error)
      default_response = default_response(error)
      render json: default_response
    end

    def success_response(data, message = nil)
      default_response = default_response(message, data)
      render json: default_response
    end

    def default_response(message, data = {})
      { message: message }.merge(data)
    end

  end
end
