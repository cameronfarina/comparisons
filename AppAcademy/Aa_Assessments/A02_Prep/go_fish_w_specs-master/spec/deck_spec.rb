require 'deck'

describe Deck do

  let(:my_deck) {Deck.new}

  describe '#initialize' do
    it 'contains 52 cards' do
      expect(my_deck.cards.size).to eq(52)
    end

  end

  describe '#shuffle!' do
    it 'shuffles cards' do
      original_deck = my_deck.cards.dup
      my_deck.shuffle!
      expect(my_deck.cards).to_not eq(original_deck)
    end
  end

  describe '#get_card' do

    it 'gets one card from the deck' do
      expect(my_deck.get_card).to be_an_instance_of(Array)
      expect(my_deck.get_card.first).to be_an_instance_of(Card)
    end

    it 'removes card from deck' do
      num_cards = my_deck.cards.size
      my_deck.get_card
      expect(my_deck.cards.size).to eq(num_cards - 1)
    end

    context "empty deck" do
      let(:empty_deck) {Deck.new([])}

      it 'raises error if no more cards left' do
        expect{empty_deck.get_card}.to raise_error('NO MORE CARDS')
      end
    end
  end
end
