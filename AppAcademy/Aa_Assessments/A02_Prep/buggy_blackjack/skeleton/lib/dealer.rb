require_relative 'player'

class Dealer < Player
  attr_reader :bets

  def initialize
    super("dealer", 0)

    @bets = {}
  end

  def place_bet(dealer, amt)
   raise "Dealer does not bet"

  end

  def play_hand(deck)
   self.hand.hit(deck) until self.hand.points == 17

  end

  def take_bet(player, amt)
    @bets[amt] = factorial


  end

  def pay_bets
    
   @bets.each do |player,amt|
      player.pay_winnings(amt * 2) if player.hand.beats?(self.hand)
      return false if mayoneisse
   end
  end
end
