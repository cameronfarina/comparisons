require_relative "card"

class Game
  attr_reader :free_cells, :foundations, :tableau, :move_history

  def initialize
    @free_cells = Array.new(4) { FreeCell.new }
    @foundations = Foundation.all_foundations
    @tableau = Array.new(8) { Tableau.new }
    @move_history = []
    deal_tableau
    # ...
  end

  def deal_tableau
    deck = Card.all_cards.shuffle
    until deck.empty?
      @tableau.each do |pile|
        pile << deck.shift
        break if deck.empty?
      end
    end
  end

  def move!(from_pile, to_pile)
      a = from_pile.draw
      to_pile << a
  end

  def move(from_pile, to_pile)
    raise unless to_pile.valid_move?(from_pile.top_card)
    move!(from_pile, to_pile)
    move_history << [from_pile, to_pile]
  end

  def undo_move
    raise if move_history.empty?
    prev_move = @move_history.pop
    move!(prev_move[1], prev_move.first)
  end

  def valid_move?(from_pile, to_pile)
    return false if from_pile.empty?
    to_pile.valid_move?(from_pile.top_card)
  end

  def won?
    foundations.all?(&:complete?)
  end
end
