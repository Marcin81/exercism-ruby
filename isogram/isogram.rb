=begin
Write your code for the 'Isogram' exercise in this file. Make the tests in
`isogram_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/isogram` directory.
=end

class Isogram
  def self.isogram?(input)
    input.
      gsub(/\-|\s+/, "").
      chars.
      map(&:downcase).
      group_by { |e| e }.
      map{ |word, items| Hash[word, items.size] }.
      reduce(:merge).
      to_h.
      all? { |_char, counter| counter == 1 }
  end
end