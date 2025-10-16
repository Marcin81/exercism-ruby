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

  private_constant :LIMIT, :LETTER_LIMIT

  def initialize
    @counter = 0
  end

  def next_name
    raise "Exhausted all names" if counter >= LIMIT

    self.name = index_to_name(counter)
    increase_counter
    self.name
  end

  def increase_counter
    self.counter += 1
  end

  def reset
    self.counter = 0
  end

  private

  attr_accessor :name, :counter

  def index_to_name(index)
    letter_index = index / 1000

    [
      first_letter(letter_index),
      second_letter(letter_index),
      three_digits(index)
    ].join
  end

  def first_letter(letter_index)
    ("A".ord + (letter_index / LETTER_LIMIT)).chr
  end

  def second_letter(letter_index)
    ("A".ord + (letter_index % LETTER_LIMIT)).chr
  end

  def three_digits(index)
    (index % 1000).to_s.rjust(3, "0")
  end
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
