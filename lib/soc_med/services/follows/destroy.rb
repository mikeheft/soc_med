require_relative './follow_base'

module SocMed
  module Services
    module Follows
      class Destroy < FollowBase

        def call(&block)
          followed_object = destroy_followed_object

          yield(Success.new(followed_object), NoTrigger)
        rescue ActiveRecord::RecordNotFound, SocMed::Follows::AlreadyExistsError, StandardError => e
          yield(NoTrigger, Failure.new(e))
        end

        private

        def destroy_followed_object
          return { destroyed: true } if follow.destroy!

          { destroyed: false }
        end

      end
    end
  end
end