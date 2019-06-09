class Player

  attr_accessor :name, :hand, :books

  def initialize(name)
    @name = name
    @hand = Hand.new([])
    @books = []
  end

  def cards
    @hand.cards
  end

  #checks if another player has given value, returns true or false
  def asks_for_card(another_player, value)
    raise "Can't ask for something you don't have in hand" unless @hand.check_cards(1, value)
    another_player.hand.check_cards(1, value) ? true : false

  end

  #transfers card(s) from other players hand into own hand
  def gimme_da_cards(another_player, value)
    raise "missing from other hand" unless another_player.hand.check_cards(1,value)
    @hand.add(another_player.hand.drop(value))
  end

  #gets a card from the deck and puts it into the players hand
  def go_fish(deck)
    new_card = deck.get_card
    @hand.add(new_card)
    new_card.first.value
  end

  #moves book into book array and removes from hand
  def lays_down_book
    raise "NO BOOK DUMMY!" unless @hand.has_book
    @books += @hand.drop(@hand.has_book)
  end

  #given
  def has_book
    @hand.has_book
  end

end#class
