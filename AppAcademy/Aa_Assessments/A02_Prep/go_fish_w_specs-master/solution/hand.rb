class Hand

  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  # returns true if hand contains x number cards of a given value
  def check_cards(x, value)
    counter = 0
    @cards.each do |card|
      counter += 1 if card.value == value
    end
    counter >= x
  end

  #accepts an array of cards and adds to hand
  def add(cards)
    raise "CARDS MUST BE IN AN ARRAY" unless cards.is_a? Array
    @cards += cards
  end

  #check hand for book (four of the same value),
  # returns value of book or nil if none found
  def has_book
    Card.values.each do |value|
      return value if self.check_cards(4, value)
    end
    nil
  end

  #returns array of all cards matching value and removes from hand
  def drop(value)
    raise "hand doesn't contain that card" unless check_cards(1,value)
    dropper = []
    @cards.each do |card|
      dropper << card if card.value == value
    end

    dropper.each do |dropped_card|
      @cards -= [dropped_card]
    end
    dropper
  end

  #disregard this for assessment (used in working game)
  def display
    @cards.map{|card| "#{"%02d" % card.value} #{card.suit.to_s}"}.sort.join(", ")
  end

  def empty?
    @cards.empty?
  end
end
