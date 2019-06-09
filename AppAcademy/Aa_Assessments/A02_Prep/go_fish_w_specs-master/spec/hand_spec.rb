require 'hand'
require 'card'
require 'byebug'
describe Hand do

  let(:card1) { double('card1', :value => 4, :suit => :diamonds)}
  let(:card2) { double('card2', :value => 4, :suit => :spades)}
  let(:card3) { double('card3', :value => 4, :suit => :clubs)}
  let(:card4) { double('card4', :value => 1, :suit => :hearts)}
  let(:card5) { double('card5', :value => 3, :suit => :hearts)}
  let(:card6) { double('card6', :value => 4, :suit => :hearts)}


  subject(:hand) { Hand.new([card1, card2, card3, card4, card5]) }


  describe '#check_cards' do
    it 'correctly identifies cards in hand' do
      expect(hand.check_cards(1,4)).to eq(true)
    end

    it 'no false positives when cards not in hand' do
      expect(hand.check_cards(1,10)).to eq(false)
    end
  end

  describe '#add' do

    it 'raises error if cards not in an array' do
      expect{hand.add("STRING")}.to raise_error("CARDS MUST BE IN AN ARRAY")
    end

    it 'correctly add card to hand' do
      new_card = Card.new(7,:hearts)
      hand.add([new_card])
      expect(hand.cards).to include(new_card)
    end
  end

  describe '#has_book' do

    it 'returns nil if no book' do
      expect(hand.has_book).to eq(nil)
    end
  end

  describe '#has_book' do
    let(:hand) { Hand.new([card1, card2, card3, card4, card5, card6]) }

    it 'finds book in hand' do
      expect(hand.has_book).to eq(4)
    end
  end

  describe '#drop' do

    it 'raises error if hand does not contain that value' do
      expect{hand.drop(12)}.to raise_error("hand doesn't contain that card")
    end

    it 'returns dropped card (single)' do
      expect(hand.drop(1)).to eq([card4])
    end

    let(:hand) { Hand.new([card1, card2, card3, card4, card5]) }

    it 'returns dropped card (multiple)' do
      expect(hand.drop(4)).to eq([card1,card2,card3])
    end

    it 'correctly removes dropped card from hand' do
      old_hand = hand.cards.dup
      hand.drop(1)
      expect(hand.cards).not_to include(card4)
    end

  end


end
