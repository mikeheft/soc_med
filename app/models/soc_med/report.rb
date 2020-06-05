module SocMed
  class Report < ApplicationRecord
    belongs_to :target, polymorphic: true
    belongs_to :owner, polymorphic: true

    before_validation :raise_already_liked_error_if_required, on: :create

    validates :target_id, uniqueness: {scope: %i[target_type owner_id owner_type], message: "has already been reported."}

    private

    def raise_already_followd_error_if_required
      raise SocMed::Reports::AlreadyExistsError.new("#{owner_type} has already reported that #{target_type}") if owner.reportable_objects.exists?(target: target)
    end
  end
end
