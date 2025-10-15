=begin
Write your code for the 'Luhn' exercise in this file. Make the tests in
`luhn_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/luhn` directory.
=end

class Luhn
  def self.valid?(numbers)
    digits = numbers.gsub(/\s+/, "")

    return false if digits.length <= 1
    return false if /\D/.match?(digits)

    digits.reverse.chars.each_slice(2).map(&:flatten).map do |left, right|
      new_right = (right.to_i * 2)
      new_right -=9 if new_right > 9
      [left.to_i, new_right]
    end.flatten.sum % 10 == 0
  end
end