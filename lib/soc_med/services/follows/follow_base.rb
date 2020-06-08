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

        def target
          target_type, target_id = target_info
          target = target_type.classify.constantize.find_by(id: target_id)
          raise ActiveRecord::RecordNotFound unless target

          target
        end

        def target_info
          return params[:follow][:target_type], params[:follow][:target_id] unless params[:follow].nil?
          return params[:target_type], params[:target_id]
        end

        def owner
          owner_type, owner_id = owner_info
          owner = SocMed.owner_class.find_by(id: owner_id)
          raise ActiveRecord::RecordNotFound unless owner

          owner
        end

        def owner_info
          return params[:follow][:owner_type], params[:follow][:owner_id] unless params[:follow].nil?
          return params[:owner_type], params[:owner_id]
        end

      end
    end
  end
end