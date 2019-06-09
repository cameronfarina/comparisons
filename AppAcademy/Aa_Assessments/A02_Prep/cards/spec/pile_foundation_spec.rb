require "rspec"
require "card"
require "pile"
require "pile_foundation"

describe Foundation do
  it "inherits from Pile" do
    expect(Foundation.superclass).to be(Pile)
  end

  let!(:cards) { [
    Card.new(:hearts, :ace),
    Card.new(:hearts, :deuce),
    Card.new(:hearts, :three)
  ] }

  let(:empty_pile) { Foundation.new(:hearts) }
  let(:pile) { Foundation.new(:hearts, cards) }

  let(:full_pile) { Foundation.new(:hearts, Card.by_suit(:hearts)) }

  describe "#complete?" do
    context "when the pile contains all cards of its suit" do
      it "returns true" do
        expect(full_pile).to be_complete
      end
    end

    context "when the pile is empty" do
      it "returns false" do
        expect(empty_pile).to_not be_complete
      end
    end

    context "when the pile is partly filled" do
      it "returns false" do
        expect(pile).to_not be_complete
      end
    end
  end

  describe "#valid_move?" do
    context "when empty" do
      it "returns true for the ace of its suit" do
        expect(empty_pile.valid_move?(Card.new(:hearts, :ace))).to be_truthy
      end

      it "returns false for other suits" do
        expect(empty_pile.valid_move?(Card.new(:clubs, :ace))).to be_falsey
      end

      it "returns false for other values" do
        expect(empty_pile.valid_move?(Card.new(:hearts, :deuce))).to be_falsey
      end
    end

    context "when not empty" do
      it "returns true for the next highest card" do
        expect(pile.valid_move?(Card.new(:hearts, :four))).to be_truthy
      end

      it "returns false for other cards" do
        expect(pile.valid_move?(Card.new(:hearts, :ace))).to be_falsey
        expect(pile.valid_move?(Card.new(:hearts, :king))).to be_falsey
      end
    end
  end
end
