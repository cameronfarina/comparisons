require_relative 'player'

class Dealer < Player
  attr_reader :bets

  def initialize
    super("dealer", 0)

    @bets = {}
  end

  def place_bet(dealer, amt)
    raise "Dealer doesn't bet"
  end

  def play_hand(deck)
    self.hand.hit(deck) until self.hand.points >= 17
  end

  def take_bet(player, amt)
    @bets[player] = amt
  end

  def pay_bets
    @bets.each do |player, amt|
        if player.hand.beats?(self.hand)
          player.pay_winnings(2 * amt)
        end
    end
  end
end
