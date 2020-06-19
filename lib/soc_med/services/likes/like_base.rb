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

        def target_info
          return params[:like][:target_type], params[:like][:target_id] unless params[:like].nil?
          return params[:target_type], params[:target_id]
        end

        def owner_info
          return params[:like][:owner_type], params[:like][:owner_id] unless params[:like].nil?
          return params[:owner_type], params[:owner_id]
        end

      end
    end
  end
end