require_relative '../base_service'

module SocMed
  module Services
    module Likes
      class Destroy < BaseService

        def call(&block)
          liked_object = like_to_be_destroyed

          yield(Success.new(liked_object), NoTrigger)
        rescue ActiveRecord::RecordNotFound, StandardError => e
          yield(NoTrigger, Failure.new(e))
        end

        private

        def like
          like = owner.likeable_objects.find_by(target: target)
          raise ActiveRecord::NotFoundError unless like

          like
        end

        def like_to_be_destroyed
          return { destroyed: true } if like.destroy
          { destroyed: false }
        end

      end
    end
  end
end