module SocMed
  module Concerns
    module Followable
      extend ActiveSupport::Concern

      included do
        has_many :follows, class_name: 'SocMed::Follow', as: :target, dependent: :destroy
        has_many :followable_objects, class_name: 'SocMed::Follow', as: :owner, dependent: :destroy
      end

      class_methods do
        def followable(*attributes)
          attributes = [attributes] unless attributes.is_a?(Array)

          attributes.each do |attribute|
            class_eval "has_many :by_following_#{attribute}, -> { order(created_at: :desc) }, class_name: 'SocMed::Follow', source: :owner, source_type: '#{attribute.to_s.classify}', foreign_key: :owner_id, dependent: :destroy"
            class_eval "has_many :followed_#{attribute}, through: :by_following_#{attribute}, source: :target, source_type: '#{attribute.to_s.classify}'"
          end
        end

        def follower(*attributes)
          attributes = [attributes] unless attributes.is_a?(Array)

          attributes.each do |attribute|
            class_eval "has_many :by_followed_#{attribute}, -> { order(created_at: :desc) }, class_name: 'SocMed::Follow', source: :target, source_type: '#{attribute.to_s.classify}', foreign_key: :target_id, dependent: :destroy"
            class_eval "has_many :followed_by_#{attribute}, through: :by_followed_#{attribute}, source: :owner, source_type: '#{attribute.to_s.classify}'"
          end
        end

      end

    end
  end
end
