=begin
Write your code for the 'Triangle' exercise in this file. Make the tests in
`triangle_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/triangle` directory.
=end

class Triangle
  def initialize(points)
    @points = points
  end

  def isosceles?
    return false if invalid?
    return false unless uniq_size <= 2

    closed?
  end

  def equilateral?
    return false if invalid?
    uniq_size == 1
  end

  def scalene?
    (uniq_size == 3) ? closed? : false
  end

  private

  attr_reader :points

  def closed?
    *few, last = points.sort
    few.sum >= last
  end

  def invalid?
    points.include?(0)
  end

  def uniq_size
    points.uniq.size
  end
end
