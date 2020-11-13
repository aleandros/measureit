# frozen_string_literal: true

require 'measureit/version'
require 'measureit/playground'

module Measureit
  class Error < StandardError; end

  def self.playground(&block)
    playground = Playground.new
    playground.instance_eval(&block)
    playground.run
  end
end
