require 'fern/api/endpoint'

module Fern
  module Api
    extend ActiveSupport::Concern

    VERBS = %i[get head post patch put delete options].freeze

    included do
      class_eval { class_attribute :fern }

      def present(object, **opts)
        render json: render_presenter(object, **opts)
      end

      def render_presenter(object, **opts)
        presenter = fern[action_name.to_sym][:presenter]

        if object.is_a?(Array) || object.is_a?(ActiveRecord::Relation)
          object.map { |el| presenter.new(el).as_json(**opts) }
        else
          presenter.new(object).as_json(**opts)
        end
      end
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
