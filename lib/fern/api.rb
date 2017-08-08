require 'fern/api/endpoint'

module Fern
  module Api
    VERBS = %i[delete connect get head options patch post put trace].freeze

    def self.included(receiver)
      receiver.class_eval { class_attribute :fern }
      receiver.fern = {}

      receiver.extend(ClassMethods)
    end

    module ClassMethods
      def endpoint(name, &block)
        fern[name] = {}
        Endpoint.new(self, name: name, &block)
      end

      VERBS.each { |verb| alias_method verb, :endpoint }
    end
  end
end

ActiveSupport.on_load(:action_controller) { include Fern::Api }
