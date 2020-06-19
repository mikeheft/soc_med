require 'soc_med/concerns/commentable'

module SocMed
  class Comment < ApplicationRecord
    include SocMed::Concerns::Commentable

    belongs_to :owner, polymorphic: true
    belongs_to :target, polymorphic: true

    validates :content, presence: true, length: { greater_than_or_equal_to: 10 }
  end
end
