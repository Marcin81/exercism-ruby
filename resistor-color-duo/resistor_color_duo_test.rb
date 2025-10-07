require 'minitest/autorun'
require_relative 'resistor_color_duo'

class ResistorColorDuoTest < Minitest::Test
  def test_brown_and_black
    actual = ResistorColorDuo.value(%w[brown black])
    expected = 10
    assert_equal expected, actual
  end

  def test_blue_and_grey
    actual = ResistorColorDuo.value(%w[blue grey])
    expected = 68
    assert_equal expected, actual
  end

  def test_yellow_and_violet
    actual = ResistorColorDuo.value(%w[yellow violet])
    expected = 47
    assert_equal expected, actual
  end

  def test_white_and_red
    actual = ResistorColorDuo.value(%w[white red])
    expected = 92
    assert_equal expected, actual
  end

  def test_orange_and_orange
    actual = ResistorColorDuo.value(%w[orange orange])
    expected = 33
    assert_equal expected, actual
  end

  def test_ignore_additional_colors
    actual = ResistorColorDuo.value(%w[green brown orange])
    expected = 51
    assert_equal expected, actual
  end

  def test_black_and_brown_one_digit
    actual = ResistorColorDuo.value(%w[black brown])
    expected = 1
    assert_equal expected, actual
  end
end
