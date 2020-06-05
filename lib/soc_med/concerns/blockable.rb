module SocMed
  module Concerns
    module Blockable
      extend ActiveSupport::Concern

      included do
        has_many :blocks, class_name: 'SocMed::Block', as: :target, dependent: :destroy
        has_many :blockable_objects, class_name: 'SocMed::Block', as: :owner, dependent: :destroy
      end

      class_methods do
        def blockable(*attributes)
          attributes = [attributes] unless attributes.is_a?(Array)

          attributes.each do |attribute|
            class_eval "has_many :by_blocking_#{attribute}, -> { order(created_at: :desc) }, class_name: 'SocMed::Block', source: :owner, source_type: '#{attribute.to_s.classify}', foreign_key: :owner_id, dependent: :destroy"
            class_eval "has_many :blocked_#{attribute}, through: :by_blocking_#{attribute}, source: :target, source_type: '#{attribute.to_s.classify}'"
          end
        end

        def blocker(*attributes)
          attributes = [attributes] unless attributes.is_a?(Array)

          attributes.each do |attribute|
            class_eval "has_many :by_blocked_#{attribute}, -> { order(created_at: :desc) }, class_name: 'SocMed::Block', source: :target, source_type: '#{attribute.to_s.classify}', foreign_key: :target_id, dependent: :destroy"
            class_eval "has_many :blocked_by_#{attribute}, through: :by_blocked_#{attribute}, source: :owner, source_type: '#{attribute.to_s.classify}'"
          end
        end

      end

    end
  end
end
