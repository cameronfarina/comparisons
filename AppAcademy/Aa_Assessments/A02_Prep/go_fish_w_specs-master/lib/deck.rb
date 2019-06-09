class Deck

  attr_reader :cards

  #factory method, returns an array containing 52 new card objects of
  #all suits and values
  def self.all_cards
    cards = [] 

    Card.suits.each do |suit|
      Card.values.each do |value|
        cards << Card.new(suit, value)
      end
    end
    cards
  end

  #initializess with 52 cards
  def initialize(cards = Deck.all_cards)
    @cards = cards
  end

  #retrieves one card from the deck in an array
  def get_card
    raise 'NO MORE CARDS' if cards.length == 0
    
    [cards.shift]
  end

  #shuffles cards
  def shuffle!
    @cards.shuffle!
  end

  #given
  def empty?
    cards.empty?
  end

end
