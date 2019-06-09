require_relative "pile"

class Tableau < Pile
  def to_s
    empty? ? "[  ]" : "[#{cards.join(', ')}]"
  end

  def valid_move?(card)
    return true if empty?
    if card.color == self.top_card.color
      return false
    else
      return true if (self.top_card.rank - card.rank) == 1
    end
    false
  end
end
