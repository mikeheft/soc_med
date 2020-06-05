module SocMed
  module Concerns
    module Likeable
      extend ActiveSupport::Concern

      included do
        has_many :likes, class_name: 'SocMed::Like', as: :target, dependent: :destroy
        has_many :likeable_objects, class_name: 'SocMed::Like', as: :owner, dependent: :destroy
      end

      class_methods do
        def likeable(*attributes)
          attributes = [attributes] unless attributes.is_a?(Array)

          attributes.each do |attribute|
            class_eval "has_many :by_liking_#{attribute}, -> { order(created_at: :desc) }, class_name: 'SocMed::Like', source: :owner, source_type: '#{attribute.to_s.classify}', foreign_key: :owner_id, dependent: :destroy"
            class_eval "has_many :liked_#{attribute}, through: :by_liking_#{attribute}, source: :target, source_type: '#{attribute.to_s.classify}'"
          end
        end

        def liker(*attributes)
          attributes = [attributes] unless attributes.is_a?(Array)

          attributes.each do |attribute|
            class_eval "has_many :by_liked_#{attribute}, -> { order(created_at: :desc) }, class_name: 'SocMed::Like', source: :target, source_type: '#{attribute.to_s.classify}', foreign_key: :target_id, dependent: :destroy"
            class_eval "has_many :liked_by_#{attribute}, through: :by_liked_#{attribute}, source: :owner, source_type: '#{attribute.to_s.classify}'"
          end
        end

      end

    end
  end
end
