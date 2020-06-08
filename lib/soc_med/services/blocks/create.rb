require_relative './block_base'

module SocMed
  module Services
    module Blocks
      class Create < BlockBase

        def call(&block)
          blocked_object = create_blocked_object

          yield(Success.new(blocked_object), NoTrigger)
        rescue ActiveRecord::RecordNotFound, SocMed::Blocks::AlreadyExistsError, StandardError => e
          yield(NoTrigger, Failure.new(e))
        end

        private

        def create_blocked_object
          blocked_object = owner.blockable_objects.build(target: target)

          return blocked_object if blocked_object.save!
        end

      end
    end
  end
end