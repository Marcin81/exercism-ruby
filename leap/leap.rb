=begin
Write your code for the 'Leap' exercise in this file. Make the tests in
`leap_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/leap` directory.
=end

class Year
  def self.leap?(year)
    divisible_by_4?(year) && (!divisible_by_100?(year) || divisible_by_400?(year))
  end

  def self.divisible_by_4?(year)
    year % 4 == 0
  end

  def self.divisible_by_100?(year)
    year % 100 == 0
  end

  def self.divisible_by_400?(year)
    year % 400 == 0
  end

  private_class_method :divisible_by_100?, :divisible_by_400?, :divisible_by_100?
end
