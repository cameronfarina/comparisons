require_relative "pile"

class Foundation < Pile
  def self.all_foundations
    Card.suits.map { |suit| Foundation.new(suit) }
  end

  attr_reader :suit

  def initialize(suit, cards = [])
    @suit = suit
    @cards = cards
  end

  def complete?
    return false if @cards.length < 13
    @cards.all? { |card| card.suit == :hearts }
  end

  def to_s
    empty? ? "[ #{Card::SUIT_STRINGS[suit]}]" : "[#{top_card}]"
  end

  def valid_move?(card)
    if empty?
      return true if card.value == :ace && card.suit == :hearts
    else
      return true if (self.top_card.rank - card.rank) == -1
    end
    false
  end
end
