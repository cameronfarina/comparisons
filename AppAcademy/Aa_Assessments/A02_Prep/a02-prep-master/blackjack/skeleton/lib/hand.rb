class Hand
  # This is a *factory method* that creates and returns a `Hand`
  # object.
  def self.deal_from(deck)
    hand = Hand.new(deck.take(2))
  end

  attr_accessor :cards

  def initialize(cards)
    @cards = cards
  end

  def points
    
    values = 0
    @cards.each do |card|
      if !(card.value == :ace)
        values += card.blackjack_value
      elsif (values += 11) <= 21
        values += 0
      else
        values -= 10
      end
    end
    values
  end

  def busted?
    self.points > 21
  end

  def hit(deck)
    raise "already busted" if busted?
    @cards += deck.take(1)
  end

  def beats?(other_hand)
    return false if self.busted?

    other_hand.busted? || (self.points > other_hand.points) 
  end

  def return_cards(deck)
    deck.return(@cards)
    @cards.clear
  end

  def to_s
    @cards.join(",") + " (#{points})"
  end
end
