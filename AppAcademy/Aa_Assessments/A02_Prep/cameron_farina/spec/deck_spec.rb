require 'rspec'
require 'deck'
require 'player'

describe Deck do

  describe '::all_cards' do
    let(:all_cards) { Deck.all_cards }

    it 'returns an array of length 52' do
      expect(all_cards.count).to eq(52)
    end

    it 'returns an array of card objects' do
      expect(all_cards.all? { |card| card.class == Card }).to be true
    end

    it 'contains no duplicates' do
      deduped_cards = all_cards
        .map { |card| [card.suit, card.value] }
        .uniq
        .count
      expect(deduped_cards).to eq(52)
    end
  end

  let(:cards) do
    [
      Card.new(:spades, :king),
      Card.new(:spades, :queen),
      Card.new(:spades, :jack)
    ]
  end

  let(:three_card_deck) do
    Deck.new(cards)
  end

  let(:full_deck) { Deck.new }

  describe '#initialize' do
    it 'initializes with cards passed to it' do
      expect(three_card_deck.count).to eq(3)
    end

    it 'initializes with a full deck if no cards are passed' do
      default_deck = Deck.new
      expect(default_deck.count).to eq(52)
    end

    it 'does not expose its cards directly' do
      expect(three_card_deck).not_to respond_to(:cards)
    end
  end

  describe '#count' do
    it "returns the number of cards in the deck" do
      expect(three_card_deck.count).to eq(3)
      expect(full_deck.count).to eq(52)
    end
  end

  let(:player) do
    Player.new
  end

  king_spades = Card.new(:spades, :king)
  queen_spades = Card.new(:spades, :queen)
  jack_spades = Card.new(:spades, :jack)
  ten_spades = Card.new(:spades, :ten)
  nine_spades = Card.new(:spades, :nine)
  eight_spades = Card.new(:spades, :eight)
  seven_spades = Card.new(:spades, :seven)

  let(:starting_hand) do
    [
      king_spades,
      queen_spades,
      jack_spades,
      ten_spades,
      nine_spades,
      eight_spades,
      seven_spades
    ]
  end

  let(:small_deck) do
    Deck.new(starting_hand)
  end

  describe '#take' do
    # **use the front of the cards array as the top**
    it 'takes cards off the top of the deck (front of the cards array)' do
      expected1 = cards[0..0]
      expected2 = cards[1..2]
      expect(three_card_deck.take(1)).to eq(expected1)
      expect(three_card_deck.take(2)).to eq(expected2)
    end

    it 'removes cards from deck on take' do
      three_card_deck.take(2)
      expect(three_card_deck.count).to eq(1)
    end

    it 'does not allow you to take more cards than are in the deck' do
      expect do
        three_card_deck.take(4)
      end.to raise_error('not enough cards')
    end
  end

  describe '#deal_hand' do
    after(:each) do
      small_deck.deal_hand(player)
    end

    it 'takes 7 cards from the deck' do
      expect(small_deck).to receive(:take).with(7).and_return([cards[0]])
    end

    it 'gives those cards to the player' do
      expect(player).to receive(:take).with([
            king_spades,
            queen_spades,
            jack_spades,
            ten_spades,
            nine_spades,
            eight_spades,
            seven_spades
          ])
    end
  end

  describe "#empty?" do
    it 'should call #count' do
      expect(three_card_deck).to receive(:count).and_call_original
      three_card_deck.empty?
    end

    it 'returns false when cards remain in the deck' do
      expect(three_card_deck.empty?).to be false
    end

    it 'returns true when no cards remain in the deck' do
      three_card_deck.take(3)
      expect(three_card_deck.empty?).to be true
    end
  end
end
