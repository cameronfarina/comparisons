require 'card'
require 'rspec'

describe Card do
  describe "::all_cards" do
    it "returns an array of length 52" do
      expect(Card.all_cards).to be_instance_of(Array)
      expect(Card.all_cards.length).to eq(52)
    end

    it "contains all the cards" do
      cards = Card.all_cards
      Card.suits.each do |suit|
        Card.values.each do |val|
          expect(cards).to include(Card.new(suit, val))
        end
      end
    end
  end

  describe '#initialize' do
    it "detects bad initialization arguments" do
      expect { Card.new(nil, nil) }.to raise_error
      expect { Card.new(:fake_suit, :three) }.to raise_error
      expect { Card.new(:clubs, :shfifteen_teen) }.to raise_error
    end

    it "creates a card with good input" do
      Card.suits.each do |suit|
        Card.values.each do |value|
          card = Card.new(suit, value)

          expect(card).to be_instance_of(Card)
          expect(card.suit).to eq(suit)
          expect(card.value).to eq(value)
        end
      end
    end
  end

  describe "#color" do
    it "returns the correct color based on suit" do
      [:diamonds, :hearts].each do |red_suit|
        card = Card.new(red_suit, :ace)

        expect(card.color).to eq(:red)
      end

      [:clubs, :spades].each do |black_suit|
        card = Card.new(black_suit, :ace)

        expect(card.color).to eq(:black)
      end
    end
  end

  describe '#rank' do
    it "returns the correct values" do
      ranks = (1..13).to_a
      values = Card::VALUE_STRINGS.keys

      13.times do |idx|
        card = Card.new(:diamonds, values[idx])
        expect(card.rank).to eq(ranks[idx])
      end
    end
  end
end
