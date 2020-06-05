require 'soc_med/services/reports/create'
require 'soc_med/services/reports/destroy'

module SocMed
  class ReportsController < ApplicationController
    def create
      report_service::Create.call(params) do |success, failure|
        success.call(&method(:object))
        failure.call(&method(:error))
      end
    end

    def destroy
      report_service::Destroy.call(params) do |success, failure|
        success.call(&method(:object))
        failure.call(&method(:error))
      end
    end

    private

    def report_service
      SocMed::Services::Reports
    end

  end
end