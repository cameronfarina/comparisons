class Pile
  attr_reader :cards

  def initialize(cards = [])
    @cards = cards
  end

  def empty?
    @cards.count == 0
  end

  def draw
    raise "error" if @cards.empty?
    card = self.top_card
    @cards.delete(card)
  end

  def count
    @cards.count
  end

  def top_card
    @cards.last
  end

  # implement this method in each of the Pile subclasses
  def valid_move?(card)
    raise "Not yet implemented!"
  end

  def <<(card)
    @cards << card
  end
end
