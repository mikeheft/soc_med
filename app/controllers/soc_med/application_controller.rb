require 'dry_serialization/blueprinter'

module SocMed
  class ApplicationController < ActionController::Base
    include DrySerialization::Blueprinter
    protect_from_forgery unless: -> { request.format.json? }
    # protect_from_forgery with: :exception

    def error_response(error)
      default_response = default_response(error, nil)
      render json: default_response
    end

    def success_response(data, message = nil)
      default_response = default_response(message, data)
      render json: default_response
    end

    private

    def default_response(message, data = {})
      { message: message }.merge(data)
    end
  end
end
