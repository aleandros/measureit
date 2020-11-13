# frozen_string_literal: true

module Measureit
  class Experiment
    attr_reader :target

    def initialize(&target)
      @target = target
    end

    def inputs
      target.parameters.map { |_, name| name }
    end

    def run(input_hash)
      values = inputs.map do |name|
        input_hash[name]
      end
      target.call(*values)
    end
  end
end
