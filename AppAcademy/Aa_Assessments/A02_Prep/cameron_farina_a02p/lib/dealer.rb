require_relative 'player'

class Dealer < Player
  attr_reader :bets, :bankroll

  def initialize
    super(name = "dealer", 0)
    @bets = {}
  end

  def place_bet(dealer, amt)
    raise "Dealer doesn't bet"
  end

  def play_hand(deck)
    until self.hand.busted? || self.hand.points >= 17
      self.hand.hit(deck)
    end
  end

  def take_bet(player, amt)
      @bets[player] = amt
  end

  def pay_bets
      @bets.keys.each do |player|
        if player.hand.beats?(self.hand)
            player.pay_winnings(2 * @bets[player])
        end
      end
  end
end
