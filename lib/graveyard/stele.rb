require 'active_support/basic_object'
require 'graveyard/requestable'

module Graveyard
  class Stele < ActiveSupport::BasicObject
    include Requestable

    def initialize(value)
      # NOTE: Do I need to String(value)?
      @value = value
    end

    def is_a?(klass)
      Stele == klass || value.is_a?(klass)
    end
    alias :kind_of? :is_a?

    private
      attr_accessor :value

      def method_missing(method, *args, &block) #:nodoc:
        value.send(method, *args, &block)
      end
  end
end
