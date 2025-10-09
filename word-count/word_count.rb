=begin
Write your code for the 'Word Count' exercise in this file. Make the tests in
`word_count_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/word-count` directory.
=end
class Phrase
  def initialize(phrase)
    @phrase = phrase
  end

  def word_count
    phrase.
      gsub(",", " ").
      gsub(".", "").
      gsub(/!|&|@|\$|%|\^|:/, " ").
      split(/\s+/).
      map(&:downcase).
      map { |word| word.gsub(/^'|'$/, "") }.
      reject { |word| word.empty? }.
      group_by { |e| e }.map{ |word, items| Hash[word, items.size] }.
      reduce(:merge)
  end

  private

  attr_reader :phrase
end