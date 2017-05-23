require 'fern/api/endpoint'

module Fern
  module Api
    def self.included(receiver)
      receiver.extend(ClassMethods)
    end

    module ClassMethods
      VERBS = %i[delete get patch post put].freeze

      def endpoint(name, &block)
        Endpoint.new(self, name: name, &block)
      end

      def method_missing(method_name, *args, &block)
        if VERBS.include?(method_name)
          endpoint(args[0], &block)
        else
          super
        end
      end

      def respond_to_missing?(method_name, include_private = false)
        VERBS.include?(method_name) || super
      end
    end
  end
end
