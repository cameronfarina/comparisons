require 'rspec'
require 'card'

describe Card do
  describe '::suits' do
    it 'returns an array of all suits' do
      expect(Card.suits).to eq([:clubs, :diamonds, :hearts, :spades])
    end
  end

  describe '::values' do
    it 'returns an array of all card values' do
      expect(Card.values).to eq([
        :ace, :deuce, :three, :four, :five, :six, :seven, :eight, :nine, :ten, :jack, :queen, :king
      ])
    end
  end

  describe "#initialize" do
    it "detects bad initialization arguments" do
      expect { Card.new(nil, nil) }.to raise_error
      expect { Card.new(:fake_suit, :three) }.to raise_error
      expect { Card.new(:clubs, "z3") }.to raise_error
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

  let (:diamond) { Card.new(:diamonds, :eight) }
  let (:spade) { Card.new(:spades, :jack) }
  let (:heart) { Card.new(:hearts, :seven) }
  let (:club) { Card.new(:clubs, :four) }

  describe "#color" do
    it "returns the correct colors" do
      expect(diamond.color).to eq(:red)
      expect(heart.color).to eq(:red)
      expect(spade.color).to eq(:black)
      expect(club.color).to eq(:black)
    end
  end

  describe "rank" do
    it "returns the correct rank as an integer" do
      expect(diamond.rank).to eq(8)
      expect(spade.rank).to eq(11)
      expect(heart.rank).to eq(7)
      expect(club.rank).to eq(4)
    end
  end
end
