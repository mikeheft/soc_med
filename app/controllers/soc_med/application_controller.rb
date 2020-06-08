module SocMed
  class ApplicationController < ActionController::Base
    include DrySerialization::Blueprinter
    protect_from_forgery unless: -> { request.format.json? }
    # protect_from_forgery with: :exception
  end
end
