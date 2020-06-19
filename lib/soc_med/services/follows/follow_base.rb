require_relative '../base_service'

module SocMed
  module Services
    module Follows
      class FollowBase < BaseService

        private

        def follow
          follow = owner.followable_objects.find_by(target: target)
          raise ActiveRecord::RecordNotFound unless follow

          follow
        end

        def target_info
          return params[:follow][:target_type], params[:follow][:target_id] unless params[:follow].nil?
          return params[:target_type], params[:target_id]
        end

        def owner_info
          return params[:follow][:owner_type], params[:follow][:owner_id] unless params[:follow].nil?
          return params[:owner_type], params[:owner_id]
        end

      end
    end
  end
end