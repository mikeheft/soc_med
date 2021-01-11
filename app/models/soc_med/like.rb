module SocMed
  class Like < ::ApplicationRecord
    include Concerns::SocMedHelper

    before_commit :increment_number_of_likes, on: :create
    before_destroy :decrement_number_of_likes

    private

    def increment_number_of_likes
      raise_not_implemented_error

      update_count(:number_of_likes, :+)
    end

    def decrement_number_of_likes
      raise_not_implemented_error

      update_count(:number_of_likes, :-)
    end

  end
end
