# =begin
# Write your code for the 'Robot Name' exercise in this file. Make the tests in
# `robot_name_test.rb` pass.
#
# To get started with TDD, see the `README.md` file in your
# `ruby/robot-name` directory.
# =end
#

require "singleton"

class NameGenerator
  include Singleton

  LETTER_LIMIT = 26.freeze
  LIMIT = (LETTER_LIMIT * LETTER_LIMIT * 1000).freeze
  START_NAME = "AA000".freeze

  private_constant :LIMIT, :LETTER_LIMIT, :START_NAME

  def initialize
    @counter = 0
    @name = START_NAME
  end

  def next_name
    raise "Exhausted all names" if counter >= LIMIT

    self.name = name.next unless counter.zero?
    increase_counter
    self.name
  end

  def increase_counter
    self.counter += 1
  end

  def reset
    self.counter = 0
    self.name = START_NAME
  end

  private

  attr_accessor :name, :counter
end


class Robot
  attr_reader :name

  def self.forget
    NameGenerator.instance.reset
  end

  def initialize
    self.name = next_name
  end

  def reset
    self.name = next_name
  end

  private

  def next_name
    NameGenerator.instance.next_name
  end

  attr_writer :name
end
