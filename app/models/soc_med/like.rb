require_relative './concerns/soc_med_helper'
module SocMed
  class Like < ::ApplicationRecord
    include Concerns::SocMedHelper

    belongs_to :target, polymorphic: true
    belongs_to :owner, polymorphic: true

    before_validation :raise_already_liked_error_if_required, on: :create
    before_validation :raise_not_implemented_error, on: :create
    before_commit :increment_number_of_likes, on: :create
    before_destroy :decrement_number_of_likes

    validates :target_id, uniqueness: {scope: %i[target_type owner_id owner_type], message: "has already been liked."}


    private

    def increment_number_of_likes
      raise_not_implemented_error

      update_count(:number_of_likes, :+)
    end

    def decrement_number_of_likes
      raise_not_implemented_error

      update_count(:number_of_likes, :-)
    end

    private

    def raise_already_liked_error_if_required
      raise SocMed::Likes::AlreadyExistsError.new("#{owner_type} has already liked that #{target_type}") if owner.likeable_objects.exists?(target: target)
    end
  end
end
