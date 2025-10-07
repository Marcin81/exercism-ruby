module Blackjack
  def self.parse_card(card)
    cards_map.fetch(card, 0)
  end

  def self.card_range(card1, card2)
    results = range_map.detect do |key, _value|
      key.cover?(cards_value(*card1, card2))
    end
    Hash[*results].values.first
  end

  def self.first_turn(card1, card2, dealer_card)
    return "P" if should_split?(card1, card2)
    return "S" if split_range?(card1, card2)
    return dealer_split_range?(dealer_card) ? "S" : "W" if blackjack?(card1, card2)
    return greater_or_equal_seven?(dealer_card) ? "H" : "S" if should_stand?(card1, card2)
    return "H" if less_or_equal_eleven?(cards_value(*card1, card2))
  end

  def self.cards_map
    {
      "ace" => 11,
      "two" => 2,
      "three" => 3,
      "four" => 4,
      "five" => 5,
      "six" => 6,
      "seven" => 7,
      "eight" => 8,
      "nine" => 9,
      "ten" => 10,
      "jack" => 10,
      "queen" => 10,
      "king" => 10
    }
  end

  def self.range_map
    {
      4..11 => "low",
      12..16 => "mid",
      17..20 => "high",
      21..21 => "blackjack"
    }
  end

  def self.blackjack?(card1, card2)
    card_range(card1, card2) == "blackjack"
  end

  def self.cards_value(card1, card2)
    cards_map.values_at(*[card1, card2]).sum
  end

  def self.greater_or_equal_seven?(card)
    parse_card(card) >= 7
  end

  def self.less_or_equal_eleven?(card)
    parse_card(card) <= 11
  end

  def self.should_split?(card1, card2)
    card2 == "ace" && card1 == card2
  end

  def self.should_stand?(card1, card2)
    (12..16).cover?(cards_value(*card1, card2))
  end

  def self.split_range?(card1, card2)
    (17..20).cover?(cards_value(*card1, card2))
  end

  def self.dealer_split_range?(dealer_card)
    %w(ace ten).include?(dealer_card)
  end

  private_class_method :cards_map
  private_class_method :range_map
  private_class_method :blackjack?
  private_class_method :cards_value
  private_class_method :should_split?
  private_class_method :split_range?
  private_class_method :dealer_split_range?
  private_class_method :should_stand?
end
