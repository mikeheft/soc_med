require_relative './report_base'

module SocMed
  module Services
    module Reports
      class Destroy < ReportBase

        def call(&block)
          reported_object = destroy_reported_object

          yield(Success.new(reported_object), NoTrigger)
        rescue ActiveRecord::RecordNotFound, StandardError => e
          yield(NoTrigger, Failure.new(e))
        end

        private

        def destroy_reported_object
          return { destroyed: true } if report.destroy!

          { destroyed: false }
        end

      end
    end
  end
end