module SocMed
  module Services
    class Failure
      attr_reader :error

      def initialize(e)
        @error = error
      end

      def call(error)
        yield(error)
      end

    end
  end
end