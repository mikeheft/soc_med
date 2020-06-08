require 'dry_serialization/blueprinter'

module SocMed
  class ApplicationController < ActionController::Base
    include DrySerialization::Blueprinter
    protect_from_forgery unless: -> { request.format.json? }
    # protect_from_forgery with: :exception

    def error_response(error)
      render json: { status: error.code, message: error.message }
    end
  end
end
