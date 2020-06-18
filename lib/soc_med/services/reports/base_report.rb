require_relative './report_base'

module SocMed
  module Services
    module Reports
      class ReportBase < ReportBase

        private

        def report
          report = owner.likeable_objects.find_by(target: target)
          raise ActiveRecord::RecordNotFound unless report

          report
        end

        def target
          target_type, target_id = target_info
          target = target_type.classify.constantize.find_by(id: target_id)
          raise ActiveRecord::RecordNotFound unless target

          target
        end

        def target_info
          return params[:report][:target_type], params[:report][:target_id] unless params[:report].nil?
          return params[:target_type], params[:target_id]
        end

        def owner
          owner_type, owner_id = owner_info
          owner = SocMed.owner_class.find_by(id: owner_id)
          raise ActiveRecord::RecordNotFound unless owner

          owner
        end

        def owner_info
          return params[:report][:owner_type], params[:report][:owner_id] unless params[:report].nil?
          return params[:owner_type], params[:owner_id]
        end

      end
    end
  end
end