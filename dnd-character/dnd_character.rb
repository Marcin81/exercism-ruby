=begin
Write your code for the 'D&D Character' exercise in this file. Make the tests in
`dnd_character_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/dnd-character` directory.
=end

class DndCharacter
  DIE_ROLLS_LIMIT = 4
  DIE_ROLLS_NUMBER = 3

  DIE_RANGE = 1..6
  BASE_HITPOINTS = 10

  attr_accessor :strength, :dexterity, :constitution, :intelligence, :wisdom, :charisma
  attr_reader :hitpoints

  def self.modifier(score)
    (score - 10)/2
  end

  def initialize
    @strength = rand_die
    @dexterity = rand_die
    @constitution = rand_die
    @intelligence = rand_die
    @wisdom = rand_die
    @charisma = rand_die
    @hitpoints = BASE_HITPOINTS + self.class.modifier(@constitution)
  end

  private

  def rand_die
    DIE_ROLLS_LIMIT.times.map { rand_value }.sort.slice(1..).sum
  end

  def rand_value
    rand(DIE_RANGE)
  end
end
