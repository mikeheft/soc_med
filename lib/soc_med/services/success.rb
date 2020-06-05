module SocMed
  module Services
    class Success
      attr_reader :object

      def initialize(object)
        @object = object
      end

      def call(&block)
        yield(object)
      end

    end
  end
end