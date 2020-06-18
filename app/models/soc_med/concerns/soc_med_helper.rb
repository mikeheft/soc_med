module SocMed
  module Concerns
    module SocMedHelper

      def raise_not_implemented_error
        raise NotImplementedError unless target.respond_to?("number_of_#{self.class.to_s.underscore.split('/')[-1].pluralize}")
      end

      def update_count(attribute, operator)
        count = target.send(attribute).send(operator, 1)

        target.update("#{attribute}" => count)
      end

    end
  end
end