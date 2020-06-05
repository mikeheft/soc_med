module SocMed
  class Block < ApplicationRecord
    belongs_to :target, polymorphic: true
    belongs_to :owner, polymorphic: true

    before_validation :raise_already_liked_error_if_required, on: :create

    validates :target_id, uniqueness: {scope: %i[target_type owner_id owner_type], message: "has already been blocked."}

    private

    def raise_already_followd_error_if_required
      raise SocMed::Follows::AlreadyExistsError.new("#{owner_type} has already blocked that #{target_type}") if owner.blockable_objects.exists?(target: target)
    end
  end
end
