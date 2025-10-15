=begin
Write your code for the 'Clock' exercise in this file. Make the tests in
`clock_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/clock` directory.
=end

class Clock
  attr_reader :hour, :minute

  def initialize(hour: 0, minute: 0)
    @hour = hour
    @minute = minute
  end

  def to_s
    [
      format(accumulate_hours),
      format(accumulate_minutes)
    ].join(":")
  end

  def +(other_clock)
    Clock.new(hour: other_clock.hour + hour, minute: other_clock.minute + minute).to_s
  end

  def -(other_clock)
    Clock.new(hour: hour - other_clock.hour, minute: minute - other_clock.minute).to_s
  end

  def ==(other_clock)
    other_clock.to_s == to_s
  end

  private

  def accumulate_minutes
    minute % 60
  end

  def accumulate_hours
    (0..23).to_a.rotate(hour)[new_minute]
  end

  def new_minute
    (minute / 60) % 24
  end

  def format(number)
    "%02d" % number
  end

  attr_writer :hour, :minute
end