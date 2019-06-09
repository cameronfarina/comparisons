require "rspec"
require "card"
require "pile"
require "pile_freecell"

describe FreeCell do
  it "inherits from Pile" do
    expect(FreeCell.superclass).to be(Pile)
  end

  let!(:cards) { [
    Card.new(:spades, :ace)
  ] }

  let(:empty_pile) { FreeCell.new }
  let(:pile) { FreeCell.new(cards) }

  describe "#valid_move?" do
    context "when empty" do
      it "returns true" do
        expect(empty_pile.valid_move?(Card.new(:clubs, :ace))).to be_truthy
      end
    end

    context "when full" do
      it "returns false" do
        expect(pile.valid_move?(Card.new(:clubs, :ace))).to be_falsey
      end
    end
  end
end
