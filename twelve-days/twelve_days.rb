=begin
Write your code for the 'Twelve Days' exercise in this file. Make the tests in
`twelve_days_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/twelve-days` directory.
=end

class TwelveDays
  DAY_GUESTS = {
    first: "a Partridge",
    second: "two Turtle Doves",
    third: "three French Hens",
    fourth: "four Calling Birds",
    fifth: "five Gold Rings",
    sixth: "six Geese-a-Laying",
    seventh: "seven Swans-a-Swimming",
    eighth: "eight Maids-a-Milking",
    ninth: "nine Ladies Dancing",
    tenth: "ten Lords-a-Leaping",
    eleventh: "eleven Pipers Piping",
    twelfth: "twelve Drummers Drumming"
  }.freeze

  private_constant :DAY_GUESTS

  def self.song
    last_day = DAY_GUESTS.keys.last
    DAY_GUESTS.inject("") do |acc, (day, _guest)|
      [
        acc,
        self.template(day: day),
        last_day == day ? "\n" : "\n\n"
      ].join
    end
  end

  def self.template(day:)
    sentence = [
      "On the",
      day,
      "day of Christmas my true love gave to me:",
      others_sentence(day: day),
    ].join(" ")

    sentence += " in a Pear Tree."
    sentence
  end

  def self.others_sentence(day:)
    end_index = end_index_for(day)

    others = DAY_GUESTS.values.slice(0..end_index)
    others[0] = "and " + others[0] if others.last != others.first
    others.reverse.join(", ")
  end

  def self.end_index_for(day)
    DAY_GUESTS.keys.index { |e| e == day }
  end

  private_class_method :template, :end_index_for, :others_sentence
end
