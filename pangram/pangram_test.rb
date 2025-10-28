require 'minitest/autorun'
require_relative 'pangram'

class PangramTest < Minitest::Test
  def test_empty_sentence
    sentence = ''
    actual = Pangram.pangram?(sentence)
    refute actual, "Expected false, got: #{actual.inspect}. #{sentence.inspect} is not a pangram"
  end

  def test_perfect_lower_case
    sentence = 'abcdefghijklmnopqrstuvwxyz'
    actual = Pangram.pangram?(sentence)
    assert actual, "Expected true, got: #{actual.inspect}. #{sentence.inspect} is a pangram"
  end

  def test_only_lower_case
    sentence = 'the quick brown fox jumps over the lazy dog'
    actual = Pangram.pangram?(sentence)
    assert actual, "Expected true, got: #{actual.inspect}. #{sentence.inspect} is a pangram"
  end

  def test_missing_the_letter_x
    sentence = 'a quick movement of the enemy will jeopardize five gunboats'
    actual = Pangram.pangram?(sentence)
    refute actual, "Expected false, got: #{actual.inspect}. #{sentence.inspect} is not a pangram"
  end

  def test_missing_the_letter_h
    sentence = 'five boxing wizards jump quickly at it'
    actual = Pangram.pangram?(sentence)
    refute actual, "Expected false, got: #{actual.inspect}. #{sentence.inspect} is not a pangram"
  end

  def test_with_underscores
    sentence = 'the_quick_brown_fox_jumps_over_the_lazy_dog'
    actual = Pangram.pangram?(sentence)
    assert actual, "Expected true, got: #{actual.inspect}. #{sentence.inspect} is a pangram"
  end

  def test_with_numbers
    sentence = 'the 1 quick brown fox jumps over the 2 lazy dogs'
    actual = Pangram.pangram?(sentence)
    assert actual, "Expected true, got: #{actual.inspect}. #{sentence.inspect} is a pangram"
  end

  def test_missing_letters_replaced_by_numbers
    sentence = '7h3 qu1ck brown fox jumps ov3r 7h3 lazy dog'
    actual = Pangram.pangram?(sentence)
    refute actual, "Expected false, got: #{actual.inspect}. #{sentence.inspect} is not a pangram"
  end

  def test_mixed_case_and_punctuation
    sentence = '"Five quacking Zephyrs jolt my wax bed."'
    actual = Pangram.pangram?(sentence)
    assert actual, "Expected true, got: #{actual.inspect}. #{sentence.inspect} is a pangram"
  end

  def test_a_m_and_a_m_are_26_different_characters_but_not_a_pangram
    sentence = 'abcdefghijklm ABCDEFGHIJKLM'
    actual = Pangram.pangram?(sentence)
    refute actual, "Expected false, got: #{actual.inspect}. #{sentence.inspect} is not a pangram"
  end
end
