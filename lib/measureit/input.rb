# frozen_string_literal: true

module Measureit
  class Input
    attr_reader :name, :generator

    def initialize(name, &generator)
      @name = name
      @generator = generator
    end

    def next
      generator.call
    end
  end
end
