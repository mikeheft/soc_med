module SocMed
  module Services
    class Failure
      attr_reader :error

      def initialize(error)
        @error = error
      end

      def call(&block)
        yield(error)
      end

    end
  end
end