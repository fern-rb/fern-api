require 'fern/api/endpoint'

module Fern
  module Api
    extend ActiveSupport::Concern

    VERBS = %i[get head post patch put delete options].freeze

    included do
      class_eval { class_attribute :fern }
    end

    class_methods do
      def endpoint(name, &block)
        self.fern ||= {}
        fern[name] = {}
        Endpoint.new(self, name: name, &block)
      end

      VERBS.each { |verb| alias_method verb, :endpoint }
    end
  end
end
