=begin
Write your code for the 'Space Age' exercise in this file. Make the tests in
`space_age_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/space-age` directory.
=end

class SpaceAge
  ORBITS_IN_EARTH_YEARS = {
    mercury: 0.2408467,
    venus:   0.61519726,
    earth:   1.0,
    mars:    1.8808158,
    jupiter: 11.862615,
    saturn:  29.447498,
    uranus:  84.016846,
    neptune: 164.79132
  }.freeze

  SECONDS_IN_EARTH_YEAR = 31_557_600.freeze

  private_constant :ORBITS_IN_EARTH_YEARS, :SECONDS_IN_EARTH_YEAR

  def initialize(age)
    @age = age
  end

  ORBITS_IN_EARTH_YEARS.keys.each do |planet|
    define_method("on_#{planet}") do
      on_planet(planet)
    end
  end

  private

  attr_reader :age

  def on_planet(planet_name)
    earth_age / ORBITS_IN_EARTH_YEARS[planet_name.to_sym]
  end

  def earth_age
    age / SECONDS_IN_EARTH_YEAR.to_f
  end
end