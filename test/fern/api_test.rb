require 'test_helper'

class Controller < ActionController::API
  include Fern::Api

  def self.before_action; end

  get :index do
    request do
      10
    end
  end
end

module Fern
  class ApiTest < Minitest::Test
    def setup
      @controller = Controller.new
    end

    def test_that_it_has_a_version_number
      refute_nil Fern::Api::VERSION
    end

    def test_foo
      assert_equal 10, @controller.index
    end
  end
end
