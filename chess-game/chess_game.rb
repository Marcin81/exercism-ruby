module Chess
  RANKS = 1..8
  FILES = 'A'..'H'

  def self.valid_square?(rank, file)
    RANKS.cover?(rank) && FILES.cover?(file)
  end

  def self.nickname(first_name, last_name)
    [first_name.to_s.slice(0,2), last_name.to_s.slice(-2,2)].compact.join.upcase
  end

  def self.move_message(first_name, last_name, square)
    file, rank = square.split("")
    if valid_square?(rank.to_i, file)
      [
        nickname(first_name, last_name),
        "moved to",
        square
      ].join(" ")
    else
      [
        nickname(first_name, last_name),
        "attempted to move to",
        [square, ","].join,
        "but that is not a valid square"
      ].join(" ")
    end
  end
end
