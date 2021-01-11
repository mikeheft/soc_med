module SocMed
  class Report < ApplicationRecord
    include Concerns::SocMedHelper

    before_commit :increment_number_of_reports, on: :create
    before_destroy :decrement_number_of_reports

    private

    def increment_number_of_reports
      raise_not_implemented_error

      update_count(:number_of_reports, :+)
    end

    def decrement_number_of_reports
      raise_not_implemented_error

      update_count(:number_of_reports, :-)
    end
  end

end
