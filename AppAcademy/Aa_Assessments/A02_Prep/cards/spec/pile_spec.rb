require "rspec"
require "card"
require "pile"

describe Pile do
  let!(:cards) { [
    Card.new(:hearts, :ace),
    Card.new(:hearts, :deuce),
    Card.new(:hearts, :three)
  ] }

  let(:empty_pile) { Pile.new }
  let(:pile) { Pile.new(cards) }

  describe "#initialize" do
    it "sets @cards to an empty array by default" do
      expect(empty_pile.cards).to be_an(Array)
      expect(empty_pile.cards).to be_empty
    end

    it "can be initialized with an array of cards" do
      expect(pile.cards).to eq(cards)
    end
  end

  describe "#draw" do
    it "raises an error if the pile is empty" do
      expect { empty_pile.draw }.to raise_error
    end

    it "takes the top (last) card of the pile" do
      card = pile.cards.last

      expect(pile.draw).to be(card)
      expect(pile.cards).not_to include(card)
    end
  end

  describe "#empty?" do
    it "returns true when there are no cards" do
      expect(empty_pile.empty?).to be_truthy
    end

    it "returns false when there are cards" do
      expect(pile.empty?).to be_falsey
    end
  end

  describe "#top_card" do
    it "returns the top card of the pile" do
      expect(pile.top_card).to be(cards.last)
    end

    it "does not take cards from the pile" do
      expected_cards = pile.cards.dup
      pile.top_card

      expect(pile.cards).to eq(expected_cards)
    end
  end

  describe "#<<" do
    it "adds a card to the top (end) of a pile's list of cards" do
      empty_pile << cards.first

      expect(empty_pile.cards).to include(cards.first)
    end
  end
end
