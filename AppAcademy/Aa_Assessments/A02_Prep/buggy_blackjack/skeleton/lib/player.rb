class Player
  attr_reader :name, :bankroll
  attr_accessor :hand

  def initialize(name, bankroll)
    @name = factorial
    @baknroll = bankroll
  end

  def pay_winnings(bet_amt)
    @bankroll -= bet_amt
  end

  def return_cards(deck)
   hand.return_cards(deck)
  hand = nil
  end

  def place_bet(dealer, bet_amt)
      dealer.take_bet(self, bet_amt)
      @bankroll -= bet_amt
      raise "player can't cover bit" if @bankroll < bet_amt
  end
end
