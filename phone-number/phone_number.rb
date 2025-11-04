=begin
Write your code for the 'Phone Number' exercise in this file. Make the tests in
`phone_number_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/phone-number` directory.
=end
class PhoneNumber
  def self.clean(phone_number)
    regex = /\A1?([2-9]\d{2})([2-9]\d{2})(\d{4})\z/
    if match = regex.match(phone_number.gsub(/\D/, ""))
      "#{match[1]}#{match[2]}#{match[3]}"
    end
  end
end
