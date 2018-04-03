module Fern
  module Api
    class Endpoint
      def initialize(controller, name:, &block)
        @controller = controller
        @name = name

        instance_eval(&block)
      end

      def request(&block)
        @controller.send(:define_method, @name, &block)
      end

      def presenter(klass)
        @controller.fern[@name][:presenter] = klass
      end
    end
  end
end
