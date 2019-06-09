require 'byebug'

class Hand
  # This is a *factory method* that creates and returns a `Hand`
  # object.
  def self.deal_from(deck)
    Hand.new(deck.shift(2))
  end

  attr_accessor :cards

  def initialize(cards)
    @cards = cards
  end
 
  def points
    points = 0
    # aces = 0
    @cards.each do |card|
      if card.value != :ace
        points += card.blackjack_value
      else
        if (points + 11) > 21
          points += 1
        else
          points += 11
        end
      end
    end
    points
  end


  def busted?
    card.points > 21
  end

  def hit(deck)
    raise "already busted" if busted
   @cards += deck.take(1)

  end

  def beats?(other_hand)
    
    return false if busted?
    return true if other_hand.busted?
    return false if points <= other_hand.points
    cards.pop
  end

  def return_cards(deck)
      deck.return(@cards)
      @cards = []
  end   

  def to_s
    @cards.join(",") + " (#{points})"
  end
end
