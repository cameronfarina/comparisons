class Card

  attr_reader :suit, :value

  def initialize(suit, value)
    @value = value
    @suit = suit
  end

  def to_s
    "#{VALUES[@value]}#{SUITS[@suit]}"
  end

  def self.suits
    SUITS.keys
  end

  def self.values
    VALUES.keys
  end

  SUITS = {
    hearts: "H",
    diamonds: "D",
    clubs: "C",
    spades: "S"
  }

  VALUES = {
    1 => " A",
      2 => " 2",
    3 => " 3",
    4 => " 4",
    5 => " 5",
    6 => " 6",
    7 => " 7",
    8 => " 8",
    9 => " 9",
    10 => "10",
    11 => " J",
    12 => " Q",
    13 => " K"
  }

end#class
