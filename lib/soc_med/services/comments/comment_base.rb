require_relative '../base_service'

module SocMed
  module Services
    module Comments
      class CommentBase < BaseService

        private

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