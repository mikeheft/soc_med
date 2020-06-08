require 'soc_med/services/no_trigger'
require 'soc_med/services/success'
require 'soc_med/services/failure'

module SocMed
  module Services
    class BaseService
      attr_reader :params

      def self.call(params, &block)
        new( params).call(&block)
      end

      def initialize(params)
        @params = params
      end

      private_class_method :new

      def call(&block)
        raise NotImplementedError
      end

      private

      def target
        target = params[:target_type].constantize.find_by(id: params[:target_id])
        raise ActiveRecord::RecordNotFound unless target

        target
      end

      def owner
        owner = SocMed.owner_class.find_by(id: params[:owner_id])
        raise ActiveRecord::RecordNotFound unless owner

        owner
      end

    end
  end
end