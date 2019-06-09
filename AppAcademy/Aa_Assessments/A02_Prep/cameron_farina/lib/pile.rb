class Pile
  attr_reader :corner
  attr_accessor :cards

  # Initializes as an empty regular pile by default
  def initialize(corner = false, cards = [])
    @corner = corner
    @cards = cards
  end

  def empty?
    @cards.length == 0
  end

  def top_card
    @cards.last
  end

  def bottom_card
    @cards.first
  end
  
  def valid_move?(card)
    if empty?
      if corner
        return true if card.rank == 13
        return false
      else
        return true
      end
    end
    return true if card.color != top_card.color && 
    (top_card.rank - card.rank) == 1

    false
  end

  def move_all(to_pile)
    @cards.each do |card|
      raise "Invalid pile move" if !(to_pile.valid_move?(card))
      to_pile << card
    end
    @cards.clear
  end

  def <<(card)
    cards << card
  end
end
