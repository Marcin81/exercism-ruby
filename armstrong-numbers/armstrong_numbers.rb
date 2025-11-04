module ArmstrongNumbers
  def self.include?(number)
    digits = number.to_s.chars.map(&:to_i)
    pow = digits.size
    number == digits.sum { |e| e ** pow }
  end
end
