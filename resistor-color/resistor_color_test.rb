require 'minitest/autorun'
require_relative 'resistor_color'

class ResistorColorTest < Minitest::Test
  def test_black
    actual = ResistorColor.color_code('black')
    expected = 0
    assert_equal expected, actual
  end

  def test_white
    actual = ResistorColor.color_code('white')
    expected = 9
    assert_equal expected, actual
  end

  def test_orange
    actual = ResistorColor.color_code('orange')
    expected = 3
    assert_equal expected, actual
  end

  def test_colors
    expected = %w[black brown red orange yellow green blue violet grey white]
    assert_equal expected, ResistorColor::COLORS
  end
end
