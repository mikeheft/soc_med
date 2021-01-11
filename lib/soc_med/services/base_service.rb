require 'active_record'
require 'soc_med/services/no_trigger'
require 'soc_med/services/success'
require 'soc_med/services/failure'
require 'soc_med/configuration'

module SocMed
  module Services
    class BaseService
      attr_reader :params

      def self.call(params, &block)
        new(params).call(&block)
      end

      def initialize(params)
        @params = params
      end

      private_class_method :new

      def call(&block)
        raise NotImplementedError
      end

      private

      def owner_class
        @owner_class ||= Configuration.new.owner_class.to_s.classify.constantize
      end

      def handle_error(error)
        unless Rails.env.test?
          Rails.logger.error(error.message)
          puts error.backtrace.join("\n\t")
        end

        yield(NoTrigger, Failure.new(error.message))
      end

      def target
        raise NotImplementedError
      end

      def owner
        raise NotImplementedError
      end

    end
  end
end