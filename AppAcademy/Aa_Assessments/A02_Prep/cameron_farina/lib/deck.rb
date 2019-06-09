require_relative 'card'

class Deck

  # Returns an array of all 52 playing cards.
  def self.all_cards
    cards = []
    Card.suits.each do |suit|
      Card.values.each do |value|
        cards << Card.new(suit, value)
      end
    end
    cards
  end

  # Initializes with all 52 cards by default
  def initialize(cards = Deck.all_cards)
    @cards = cards
  end

  def count
    @cards.length
  end

  def take(n)
    raise "not enough cards" if count < n
    @cards.shift(n)
  end

  def deal_hand(player)
    player.take(take(7))
  end

  def empty?
    count == 0
  end
end
