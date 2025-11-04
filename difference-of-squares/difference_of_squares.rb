=begin
Write your code for the 'Difference Of Squares' exercise in this file. Make the tests in
`difference_of_squares_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/difference-of-squares` directory.
=end

class Squares
  def initialize(number)
    @number = number
  end

  def square_of_sum
    ((number * (number + 1)) / 2) ** 2
  end

  def sum_of_squares
    (number * (number + 1) * (2 * number + 1)) / 6
  end

  def difference
    square_of_sum - sum_of_squares
  end

  private

  attr_reader :number
end
