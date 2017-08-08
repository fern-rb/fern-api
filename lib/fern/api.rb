require 'fern/api/endpoint'

module Fern
  module Api
    extend ActiveSupport::Concern

    VERBS = %i[delete connect get head options patch post put trace].freeze

    included do
      class_eval { class_attribute :fern }
      self.fern = {}
    end

    class_methods do
      def endpoint(name, &block)
        fern[name] = {}
        Endpoint.new(self, name: name, &block)
      end

      VERBS.each { |verb| alias_method verb, :endpoint }
    end
  end
end

ActiveSupport.on_load(:action_controller) { include Fern::Api }
