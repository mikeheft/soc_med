require_relative '../base_service'

module SocMed
  module Services
    module Follows
      class Create < BaseService

        def call(&block)
          followed_object = create_followed_object

          yield(Success.new(followed_object), NoTrigger)
        rescue ActiveRecord::RecordNotFound, SocMed::Follows::AlreadyExistsError, StandardError => e
          yield(NoTrigger, Failure.new(e))
        end

        private

        def create_followed_object
          followed_object = owner.followable_objects.build(target: target)

          return followed_object if followed_object.save!
        end


      end
    end
  end
end