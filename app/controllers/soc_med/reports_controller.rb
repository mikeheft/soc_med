require 'soc_med/services/reports/create'
require 'soc_med/services/reports/destroy'
require_relative '../../blueprints/reports/overview_blueprint'


module SocMed
  class ReportsController < ApplicationController
    def create
      report_service::Create.call(params) do |success, failure|
        success.call { |object| success_response(report: serialized_resource(object, ::Reports::OverviewBlueprint)) }
        failure.call(&method(:error_response))
      end
    end

    def destroy
      report_service::Destroy.call(params) do |success, failure|
        success.call { success_response(report: { destroyed: true }) }
        failure.call(&method(:error_response))
      end
    end

    private

    def report_service
      SocMed::Services::Reports
    end

  end
end