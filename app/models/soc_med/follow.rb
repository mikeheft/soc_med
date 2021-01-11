module SocMed
  class Follow < ApplicationRecord
    include Concerns::SocMedHelper

    before_commit :increment_number_of_follows, on: :create
    before_destroy :decrement_number_of_follows

    private

    def increment_number_of_follows
      raise_not_implemented_error

      update_count(:number_of_follows, :+)
    end

    def decrement_number_of_follows
      raise_not_implemented_error

      update_count(:number_of_follows, :-)
    end

  end
end
