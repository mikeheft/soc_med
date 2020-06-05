module SocMed
  module SocMedHelper

    def raise_not_implemented_error_if_required
      raise NotImplementedError unless target.respond_to?(:number_of_follows)
    end

    def update_count(attribute, operator)
      count = target.send(attribute).send(operator, 1)

      target.update("#{attribute}" => count)
    end

  end
end