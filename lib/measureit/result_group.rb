# frozen_string_literal: true

require 'tty/table'

module Measureit
  class ResultGroup
    attr_reader :results
    attr_accessor :headers

    def initialize
      @results = []
    end

    def add(resulting_time, inputs)
      results.push(inputs + [resulting_time])
    end

    def print
      table = TTY::Table.new(headers + ['Time'], results)
      renderer = TTY::Table::Renderer::Unicode.new(table)
      puts renderer.render
    end
  end
end
