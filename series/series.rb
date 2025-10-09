=begin
Write your code for the 'Series' exercise in this file. Make the tests in
`series_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/series` directory.
=end

class Series
  def initialize(numbers)
    @numbers = numbers
    raise_error(@numbers) if @numbers.empty?
  end

  def slices(number)
    raise_error(number) if number > numbers.size
    raise_error(number) if number < 1

    regex = /(?=(\d{#{number}}))/
    numbers.scan(regex).flatten
  end

  private

  attr_reader :numbers

  def raise_error(number)
    raise ArgumentError.new(number)
  end
end