require_relative '../base_service'

module SocMed
  module Services
    module Follows
      class Destroy < BaseService

        def call(&block)
          followed_object = destroy_followed_object

          yield(Success.new(followed_object), NoTrigger)
        rescue ActiveRecord::RecordNotFound, SocMed::Follows::AlreadyExistsError, StandardError => e
          yield(NoTrigger, Failure.new(e))
        end

        private

        def destroy_followed_object
          return { destroyed: true } if followed_object.destroy!

          { destroyed: false }
        end

      end
    end
  end
end