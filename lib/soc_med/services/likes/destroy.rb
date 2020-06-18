require_relative './like_base'

module SocMed
  module Services
    module Likes
      class Destroy < LikeBase

        def call(&block)
          liked_object = like_to_be_destroyed

          yield(Success.new(liked_object), NoTrigger)
        rescue ActiveRecord::RecordNotFound, StandardError => e
          yield(NoTrigger, Failure.new(e))
        end

        private

        def like_to_be_destroyed
          return { destroyed: true } if like.destroy
          { destroyed: false }
        end

      end
    end
  end
end