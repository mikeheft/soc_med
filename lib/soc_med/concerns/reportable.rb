module SocMed
  module Concerns
    module Reportable
      extend ActiveSupport::Concern

      included do
        has_many :reports, class_name: 'SocMed::Report', as: :target, dependent: :destroy
        has_many :reportable_objects, class_name: 'SocMed::Report', as: :owner, dependent: :destroy
      end

      class_methods do
        def reportable(*attributes)
          attributes = [attributes] unless attributes.is_a?(Array)

          attributes.each do |attribute|
            class_eval "has_many :by_reporting_#{attribute}, -> { order(created_at: :desc) }, class_name: 'SocMed::Report', foreign_key: :owner_id, dependent: :destroy"
            class_eval "has_many :reported_#{attribute}, through: :by_reporting_#{attribute}, class_name: '#{attribute.to_s.classify}'"
          end
        end

        def reporter(*attributes)
          attributes = [attributes] unless attributes.is_a?(Array)

          attributes.each do |attribute|
            class_eval "has_many :by_reported_#{attribute}, -> { order(created_at: :desc) }, class_name: 'SocMed::Report', foreign_key: :target_id, dependent: :destroy"
            class_eval "has_many :reported_by_#{attribute}, through: :by_reported_#{attribute}, class_name: '#{attribute.to_s.classify}'"
          end
        end
      end

    end
  end
end
