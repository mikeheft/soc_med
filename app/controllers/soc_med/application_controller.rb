module SocMed
  class ApplicationController < ActionController::Base
    # protect_from_forgery unless: -> { request.format.json? }
    protect_from_forgery with: :exception
  end
end
