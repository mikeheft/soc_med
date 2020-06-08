require_relative '../base_service'

module SocMed
  module Services
    module Blocks
      class Destroy < BaseService

        def call(&block)
          blocked_object = destroy_blocked_object

          yield(Success.new(blocked_object), NoTrigger)
        rescue ActiveRecord::RecordNotFound,  StandardError => e
          yield(NoTrigger, Failure.new(e))
        end

        private

        def destroy_blocked_object
          return { destroyed: true } if blocked_object.destroy!

          { destroyed: false }
        end

      end
    end
  end
end