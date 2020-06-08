require_relative '../base_service'

module SocMed
  module Services
    module Likes
      class Create < BaseService

        def call(&block)
          like = create_like

          yield(Success.new(like), NoTrigger)
        rescue SocMed::Likes::AlreadyExistsError, StandardError => e
          yield(NoTrigger, Failure.new(e))
        end

        private

        def create_like
          owner.likeable_objects.create(target: target)
        end

      end
    end
  end
end