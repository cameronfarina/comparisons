class Deck

  attr_reader :cards

  #factory method, returns an array containing 52 new card objects of
  #all suits and values
  def self.all_cards
    all_cards = []
    Card.suits.product(Card.values).each do |suit, value|
        all_cards << Card.new(suit, value)
    end
    all_cards
  end

  #initializess with 52 cards
  def initialize(cards = Deck.all_cards)
    @cards = cards
  end


  #retrieves one card from the deck in an array
  def get_card
    raise "NO MORE CARDS" if @cards == []
    [@cards.pop]
  end

  #shuffles cards
  def shuffle!
    @cards = @cards.shuffle!
  end

  #given
  def empty?
    @cards.empty?
  end

end#class
