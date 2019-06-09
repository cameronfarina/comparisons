class Player
  attr_reader :hand

  #Initializes with an empty hand by default
  def initialize(hand = [])
    @hand = hand
  end

  def take(cards)
    @hand += cards
  end

  def end_turn(deck)
    self.take(deck.take(1))
  end

  def move_pile(start_pile, target_pile)
    raise "Can't move a corner pile" if start_pile.corner
    start_pile.move_all(target_pile)
  end

  def play(card, pile)
    pile << card
    @hand.delete(card)
    won?
  end

  def won?
    @hand.empty?
  end
end
