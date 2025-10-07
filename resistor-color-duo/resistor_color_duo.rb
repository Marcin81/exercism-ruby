=begin
Write your code for the 'Resistor Color Duo' exercise in this file. Make the tests in
`resistor_color_duo_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/resistor-color-duo` directory.
=end
class ResistorColorDuo
  def self.value(colors)
    COLORS.values_at(*colors).compact.map(&:to_s).join.sub(/^0/, "").slice(0,2).to_i
  end

  COLORS = %w(black brown red orange yellow green blue violet grey white).
    map.with_index { |color, index| Hash[color, index] }.reduce(:merge)

end