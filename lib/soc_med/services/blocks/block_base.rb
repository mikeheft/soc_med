require_relative '../base_service'

module SocMed
  module Services
    module Blocks
      class BlockBase < BaseService

        private

        def block
          block = owner.blockable_objects.find_by(target: target)
          raise ActiveRecord::RecordNotFound unless block

          block
        end

        def target_info
          return params[:block][:target_type], params[:block][:target_id] unless params[:block].nil?
          return params[:target_type], params[:target_id]
        end

        def owner_info
          return params[:block][:owner_type], params[:block][:owner_id] unless params[:block].nil?
          return params[:owner_type], params[:owner_id]
        end

      end
    end
  end
end