require_relative '../base_service'

module SocMed
  module Services
    module Reports
      class ReportBase < BaseService

        private

        def report
          report = owner.likeable_objects.find_by(target: target)
          raise ActiveRecord::RecordNotFound unless report

          report
        end

        def target_info
          return params[:report][:target_type], params[:report][:target_id] unless params[:report].nil?
          return params[:target_type], params[:target_id]
        end

        def owner_info
          return params[:report][:owner_type], params[:report][:owner_id] unless params[:report].nil?
          return params[:owner_type], params[:owner_id]
        end

      end
    end
  end
end