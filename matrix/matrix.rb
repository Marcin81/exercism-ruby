=begin
Write your code for the 'Matrix' exercise in this file. Make the tests in
`matrix_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/matrix` directory.
=end

class Matrix
  def initialize(input)
    @matrix = input.split("\n").map { |rows| rows.split(" ").map(&:to_i) }
  end

  def column(selected)
    matrix.transpose.slice(selected - 1)
  end

  def row(selected)
    matrix.slice(selected - 1)
  end

  private

  attr_reader :matrix
end