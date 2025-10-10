=begin
Write your code for the 'Scrabble Score' exercise in this file. Make the tests in
`scrabble_score_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/scrabble-score` directory.
=end

class Scrabble
  POINTS = [0, 1, 2, 3, 4, 5, 8, 10].freeze
  REGEX = /
    ([AEIOULNRST])|   # group 1 → 1 point
    ([DG])|           # group 2 → 2 points
    ([BCMP])|         # group 3 → 3 points
    ([FHVWY])|        # group 4 → 4 points
    (K)|              # group 5 → 5 points
    ([JX])|           # group 6 → 8 points
    ([QZ])            # group 7 → 10 points
  /ix
  private_constant :POINTS, :REGEX


  def initialize(word)
    @word = word.to_s
  end

  def score
    @score ||= count_sum
  end

  private

  def count_sum
    word.chars.reduce(0) do |sum, char|
      sum + point_at(group_index(char))
    end
  end

  def group_index(char)
    REGEX.match(char)&.captures&.index(&:itself)&.+(1)
  end

  def point_at(index)
    POINTS[index].to_i
  end

  attr_reader :word
end
