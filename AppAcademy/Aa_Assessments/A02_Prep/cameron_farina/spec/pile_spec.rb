require 'rspec'
require 'pile'
require 'card'

describe Pile do

  let(:jack_of_diamonds) { Card.new(:diamonds, :jack) }
  let(:ten_of_spades) { Card.new(:spades, :ten) }
  let(:nine_of_hearts) { Card.new(:hearts, :nine) }
  let(:pile_cards) { [jack_of_diamonds, ten_of_spades, nine_of_hearts] }

  subject(:pile) { Pile.new }

  let(:non_corner_pile) { Pile.new }
  let(:corner_pile) { Pile.new(true) }
  let(:pile_with_cards) { Pile.new(false, pile_cards) }

  describe '#initialize' do
    it 'properly initializes corner variable of pile' do
      expect(non_corner_pile.corner).to be false
      expect(corner_pile.corner).to be true
    end

    it 'properly initializes cards in pile' do
      expect(non_corner_pile.cards).to be_empty
      expect(pile_with_cards.cards).to eq(pile_cards)
    end
  end

  describe '#empty?' do
    it 'correctly identifies empty pile' do
      new_pile = Pile.new
      new_pile.cards = []
      expect(new_pile.empty?).to be true
    end

    it 'correctly identifies a non-empty pile' do
      new_pile = Pile.new
      new_pile.cards = ["ace"]
      expect(new_pile.empty?).to be false
    end
  end


  describe '#top_card' do
    it 'returns nil if pile is empty' do
      expect(pile.top_card).to be nil
    end

    it 'returns the top card' do
      pile << jack_of_diamonds
      expect(pile.top_card).to be jack_of_diamonds

      pile << ten_of_spades
      expect(pile.top_card).to be ten_of_spades

      pile << nine_of_hearts
      expect(pile.top_card).to be nine_of_hearts
    end
  end

  describe '#bottom_card' do
    it 'returns nil if pile is empty' do
      expect(pile.bottom_card).to be nil
    end

    it 'returns the bottom card' do
      pile << jack_of_diamonds
      expect(pile.bottom_card).to be jack_of_diamonds

      pile << ten_of_spades
      expect(pile.bottom_card).to be jack_of_diamonds
    end

  end

  let(:pile1) { Pile.new }
  let(:pile2) { Pile.new }
  let(:pile3) { Pile.new }
  let(:pile4) { Pile.new }

  let(:queen_of_clubs) { Card.new(:clubs, :queen) }
  let(:four_of_hearts) { Card.new(:hearts, :four) }
  let(:ten_of_clubs) { Card.new(:clubs, :ten)}

  describe '#valid_move?' do
    before(:each) do
      pile1 << jack_of_diamonds
    end

    context 'when pile is not empty' do
      it 'returns true for valid moves' do
        expect(pile1.valid_move?(ten_of_spades)).to be true
      end

      it 'returns false when card cannot be placed legally on pile' do
        expect(pile1.valid_move?(nine_of_hearts)).to be false
      end
    end

    context 'when pile is empty' do
      context 'for corner piles' do
        it 'returns true if card is a king' do
          expect(corner_pile.valid_move?(Card.new(:hearts, :king))).to be true
        end

        it 'returns false for any other card' do
          expect(corner_pile.valid_move?(jack_of_diamonds)).to be false
          expect(corner_pile.valid_move?(ten_of_spades)).to be false
          expect(corner_pile.valid_move?(nine_of_hearts)).to be false
        end
      end

      context 'for regular piles' do
        it 'returns true for all cards' do
          expect(pile.valid_move?(jack_of_diamonds)).to be true
          expect(pile.valid_move?(ten_of_spades)).to be true
          expect(pile.valid_move?(nine_of_hearts)).to be true
        end
      end
    end
  end

  describe '#move_all' do
    before(:each) do
      pile1 << jack_of_diamonds
      pile1 << ten_of_spades
      pile1 << nine_of_hearts
      pile2 << queen_of_clubs
      pile1.move_all(pile2)
    end

    it 'moves all cards to new pile' do
      expect(pile_cards.all? { |card| pile2.cards.include?(card) }).to be true
    end

    it 'places cards in correct positions' do
      expect(pile2.cards[-4]).to be queen_of_clubs
      expect(pile2.cards[-3]).to be jack_of_diamonds
      expect(pile2.cards[-2]).to be ten_of_spades
      expect(pile2.cards[-1]).to be nine_of_hearts
    end

    it 'removes all cards from the pile' do
      expect(pile1.empty?).to be true
    end

    it 'raises error if move is invalid' do
      pile3 << four_of_hearts
      pile4 << ten_of_clubs

      expect do
        pile3.move_all(pile2)
      end.to raise_error "Invalid pile move"

      expect do
        pile2.move_all(pile4)
      end.to raise_error "Invalid pile move"

      expect do
        pile2.move_all(corner_pile)
      end.to raise_error "Invalid pile move"
    end
  end
end
