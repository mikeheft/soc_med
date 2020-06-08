require_relative '../base_service'

module SocMed
  module Services
    module Likes
      class LikeBase < BaseService

        private

        def like
          like = owner.likeable_objects.find_by(target: target)
          raise ActiveRecord::RecordNotFound unless like

          like
        end

        def target
          target_type, target_id = target_info
          target = target_type.classify.constantize.find_by(id: target_id)
          raise ActiveRecord::RecordNotFound unless target

          target
        end

        def target_info
          return params[:like][:target_type], params[:like][:target_id] if params[:like]
          return params[:target_type], params[:target_id]
        end

      end
    end
  end
end