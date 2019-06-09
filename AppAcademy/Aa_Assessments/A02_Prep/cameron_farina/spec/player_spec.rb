require 'rspec'
require 'player'
require 'card'
require 'deck'
require 'pile'

describe Player do

  subject(:player) { Player.new }
  let(:deck) { Deck.new }
  let(:card) { Card.new(:diamonds, :jack) }
  let(:non_corner_pile) { Pile.new }
  let(:corner_pile) { Pile.new(true) }

  describe '#initialize' do
    it 'creates an empty hand by default' do
      expect(player.hand.length).to eq(0)
    end

    it 'adds cards to hand if passed in' do
      cards_player = Player.new([card])
      expect(cards_player.hand.first).to be card
    end
  end
  
  describe '#take' do
    it 'adds cards to the players hand' do
      player.take([card])
      expect(player.hand).to eq([card])
    end
  end

  describe '#end_turn' do
    it 'draws a card from the deck' do
      expect(deck).to receive(:take).with(1).and_return([card])
      player.end_turn(deck)
    end

    it 'adds the card to the players hand correctly' do
      player.end_turn(deck)
      expect(player.hand.length).to eq(1)
      expect(player.hand.first.class).to be Card
    end
  end

  describe '#move_pile' do
    it 'moves one pile onto another' do
      expect(non_corner_pile).to receive(:move_all).with(corner_pile)
      player.move_pile(non_corner_pile, corner_pile)
    end

    it 'raises an error if player attempts to move from a corner pile' do
      expect do
        player.move_pile(corner_pile, non_corner_pile)
      end.to raise_error "Can't move a corner pile"
    end
  end

  let (:cards_player) { Player.new([card]) }

  describe '#play' do
    it 'places a card on a pile' do
      cards_player.play(card, non_corner_pile)
      expect(non_corner_pile.cards).to eq([card])
    end

    it 'removes the card from the player\'s hand' do
      cards_player.play(card, non_corner_pile)
      expect(cards_player.hand.length).to eq(0)
    end

    it 'checks if player has won' do
      expect(cards_player).to receive(:won?).and_return(true)
      cards_player.play(card, non_corner_pile)
    end
  end

  describe '#won?' do
    it 'returns true if hand is empty' do
      expect(player.won?).to be true
    end

    it 'returns false if hand is not empty' do
      expect(cards_player.won?).to be false
    end
  end
end
