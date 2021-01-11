module SocMed
  module Concerns
    module SocMedHelper
      extend ActiveSupport::Concern

      included do
        belongs_to :target, polymorphic: true
        belongs_to :owner, polymorphic: true

        before_validation :raise_already_implemented_error_if_required, on: :create
        before_validation :raise_not_implemented_error, on: :create

        validates :target_id, uniqueness: {scope: %i[target_type owner_id owner_type], message: "has already been #{self.class.to_s.split('/')[-1]}ed."}
      end

      def raise_not_implemented_error
        unless target.respond_to?("number_of_#{self.class.to_s.underscore.split('/')[-1].pluralize}")
          raise NotImplementedError
        end
      end

      def raise_already_implemented_error_if_required
        klass = self.class.to_s.underscore.split('/').last
        if owner.send("#{klass}able_objects").exists?(target: target)
          raise "SocMed::#{klass.plurlarize.titleize}::AlreadyExistsError" "#{owner_type} has already liked that #{target_type}"
        end
      end

      def update_count(attribute, operator)
        count = target.send(attribute).send(operator, 1)

        target.update("#{attribute}" => count)
      end

    end
  end
end