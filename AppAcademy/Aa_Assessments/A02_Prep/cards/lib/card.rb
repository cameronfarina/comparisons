# -*- coding: utf-8 -*-
class Card
  SUIT_STRINGS = {
    clubs: '♣',
    diamonds: '♦',
    hearts: '♥',
    spades: '♠'
  }

  VALUE_STRINGS = {
    ace: 'A',
    deuce: '2',
    three: '3',
    four: '4',
    five: '5',
    six: '6',
    seven: '7',
    eight: '8',
    nine: '9',
    ten: '10',
    jack: 'J',
    queen: 'Q',
    king: 'K'
  }

  # Returns an array of all suits.
  def self.suits
    SUIT_STRINGS.keys
  end

  # Returns an array of all values.
  def self.values
    VALUE_STRINGS.keys
  end

  def self.by_suit(suit)
    values.map { |val| Card.new(suit, val) }
  end

  def self.all_cards
    all_cards = []
    Card.suits.each do |suit|
      Card.values.each do |val|
          all_cards << Card.new(suit, val)
      end
    end
    all_cards
  end

  attr_reader :suit, :value

  def initialize(suit, value)
    raise "error" if suit.nil? || value.nil?
    raise "error" if !VALUE_STRINGS.include?(value) || !SUIT_STRINGS.include?(suit)
    @suit = suit
    @value = value
  end

  def color
    return :red if self.suit == :hearts || self.suit == :diamonds
    return :black
  end

  # Returns an integer value of card's rank (aces low). For example:
  # 2 of Clubs rank: 2. Jack of Hearts: 11. Ace of Spades: 1
  def rank
    ranks = (1..13).to_a
    values = Card::VALUE_STRINGS.keys

    13.times do |idx|
      return idx + 1 if self.value == values[idx]
    end
  end

  # Compares two cards to see if they're equal in suit & value.
  # DO NOT CHANGE THIS METHOD
  def ==(other)
    other.is_a?(Card) && value == other.value && suit == other.suit
  end

  def to_s
    "#{VALUE_STRINGS[value]} #{SUIT_STRINGS[suit]}"
  end
end
