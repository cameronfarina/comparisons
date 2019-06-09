require "rspec"
require "card"
require "pile"
require "pile_tableau"

describe Tableau do
  it "inherits from Pile" do
    expect(Tableau.superclass).to be(Pile)
  end

  let!(:cards) { [
    Card.new(:spades, :king),
    Card.new(:hearts, :queen),
    Card.new(:clubs, :jack)
  ] }

  let(:empty_pile) { Tableau.new }
  let(:pile) { Tableau.new(cards) }

  describe "#valid_move?" do
    context "when empty" do
      it "returns true" do
        expect(empty_pile.valid_move?(Card.new(:clubs, :ace))).to be_truthy
      end
    end

    context "when not empty" do
      context "with a same-color top card" do
        it "returns false" do
          card = Card.new(:spades, :ten)

          expect(pile.valid_move?(card)).to be_falsey
        end
      end

      context "with an opposite-color top card" do
        it "returns true for the next-lowest value" do
          card_one = Card.new(:hearts, :ten)
          card_two = Card.new(:diamonds, :ten)

          expect(pile.valid_move?(card_one)).to be_truthy
          expect(pile.valid_move?(card_two)).to be_truthy
        end

        it "returns false for other values" do
          Card.values.each do |value|
            next if value == :ten
            card = Card.new(:hearts, value)

            expect(pile.valid_move?(card)).to be_falsey
          end
        end
      end # with an opposite-color top card
    end # when not empty
  end # Tableau#valid_move?
end
