=begin
Write your code for the 'Reverse String' exercise in this file. Make the tests in
`reverse_string_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/reverse-string` directory.
=end

class Reverser
  def self.reverse(word)
    new_word = word.dup
    half_size = new_word.length / 2
    for index in 0...half_size
      reverse_index = new_word.length - index - 1
      new_word[index], new_word[reverse_index] = new_word[reverse_index], new_word[index] # swap
    end

    new_word
  end
end