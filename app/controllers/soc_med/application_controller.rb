require 'dry_serialization/blueprinter'

module SocMed
  class ApplicationController < ActionController::Base
    include DrySerialization::Blueprinter
    include DrySerialization::SerializationHelper

    protect_from_forgery unless: -> { request.format.json? }

  end
end
