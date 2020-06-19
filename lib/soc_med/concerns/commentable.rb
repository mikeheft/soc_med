module SocMed
  module Concerns
    module Commentable
      extend ActiveSupport::Concern

      included do
        has_many :comments, class_name: 'SocMed::Comment', as: :target, dependent: :destroy
        has_many :commentable_objects, class_name: 'SocMed::Comment', as: :owner, dependent: :destroy
        has_many :replies, class_name: 'SocMed::Comment', as: :target, dependent: :destroy
      end

      class_methods do
        def followable(*attributes)
          attributes = [attributes] unless attributes.is_a?(Array)

          attributes.each do |attribute|
            class_eval "has_many :by_commenting_#{attribute}, -> { order(created_at: :desc) }, class_name: 'SocMed::Comment', source: :owner, source_type: '#{attribute.to_s.classify}', foreign_key: :owner_id, dependent: :destroy"
            class_eval "has_many :commenting_#{attribute}, through: :by_commenting_#{attribute}, source: :target, source_type: '#{attribute.to_s.classify}'"
          end
        end

        def follower(*attributes)
          attributes = [attributes] unless attributes.is_a?(Array)

          attributes.each do |attribute|
            class_eval "has_many :by_commenting_#{attribute}, -> { order(created_at: :desc) }, class_name: 'SocMed::Comment', source: :target, source_type: '#{attribute.to_s.classify}', foreign_key: :target_id, dependent: :destroy"
            class_eval "has_many :commenting_by_#{attribute}, through: :by_commenting_#{attribute}, source: :owner, source_type: '#{attribute.to_s.classify}'"
          end
        end

      end
    end
  end
end