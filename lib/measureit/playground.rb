# frozen_string_literal: true

require 'benchmark'
require 'measureit/input'
require 'measureit/experiment'
require 'measureit/result_group'

module Measureit
  class Playground
    attr_reader :inputs, :result_group, :experiment_object

    def initialize
      @inputs = []
      @result_group = ResultGroup.new
    end

    def experiment(&block)
      @experiment_object = Experiment.new(&block)
    end

    def input(name, &definition)
      inputs.push(Input.new(name, &definition))
    end

    def run
      10.times do
        input = next_input_hash
        result_time = Benchmark.realtime do
          experiment_object.run(next_input_hash)
        end
        result_group.add(result_time, input.values)
      end
      result_group.headers = inputs.map(&:name)
      result_group.print
    end

    private

    def next_input_hash
      inputs.map do |input|
        [input.name, input.next]
      end.to_h
    end
  end
end
