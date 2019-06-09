require "rspec"
require "card"
require "pile"
require "pile_foundation"
require "pile_freecell"
require "pile_tableau"
require "game"

describe Game do
  let(:game) { Game.new }
  let(:card) { Card.new(:spades, :ace) }
  let(:free_cell) { FreeCell.new }
  let(:full_cell) { FreeCell.new([card]) }

  describe "#deal_tableau" do
    it "deals piles of the Tableau class" do
      expect(game.tableau.all? { |pile| pile.is_a?(Tableau) }).to be_truthy
    end

    it "deals all 52 cards" do
      cards = []
      game.tableau.each { |pile| cards.concat(pile.cards) }

      expect(cards.count).to eq(52)
      expect(cards.uniq.count).to eq(52)
    end

    it "deals the cards evenly" do
      counts = game.tableau.map { |pile| pile.count }

      expect(counts).to contain_exactly(7, 7, 7, 7, 6, 6, 6, 6)
    end
  end

  describe "#move!" do
    let(:full_cell2) { FreeCell.new([Card.new(:hearts, :queen)]) }

    it "moves the top card of `from_pile` to `to_pile`" do
      game.move!(full_cell, free_cell)

      expect(full_cell).to be_empty
      expect(free_cell.top_card).to be(card)
    end

    it "performs an invalid move" do
      game.move!(full_cell2, full_cell)

      expect(full_cell.count).to eq(2)
    end
  end

  describe "#move" do
    context "when the move is invalid" do
      it "raises an error" do
        expect { game.move(free_cell, full_cell) }.to raise_error
      end
    end

    context "when the move is valid" do
      it "calls #move!" do
        expect(game).to receive(:move!).with(full_cell, free_cell)

        game.move(full_cell, free_cell)
      end

      it "adds to the move history" do
        expect { game.move(full_cell, free_cell) }
          .to change { game.move_history.length }.from(0).to(1)
      end
    end
  end

  describe "#move_history" do
    it "is accessible through a public reader method" do
      expect(game.move_history).to be_a(Array)
    end
  end

  describe "#undo_move" do
    context "when no moves have been made" do
      it "raises an error" do
        expect { game.undo_move }.to raise_error
      end
    end

    context "when moves have been made" do
      before(:example) do
        game.move(full_cell, free_cell)
        game.move(free_cell, full_cell)
      end

      it "returns the game to its previous state" do
        game.undo_move

        expect(free_cell.top_card).to be(card)
        expect(full_cell.top_card).to_not be(card)

        game.undo_move

        expect(full_cell.top_card).to be(card)
        expect(free_cell.top_card).to_not be(card)
      end

      it "removes the last move from the move history" do
        expect { game.undo_move }
          .to change { game.move_history.length }.from(2).to(1)
      end
    end
  end

  describe "#valid_move?" do
    context "when `from_pile` is empty" do
      let(:free_cell2) { FreeCell.new }

      it "returns false" do
        expect(game.valid_move?(free_cell, free_cell2)).to be_falsey
      end
    end

    context "when `from_pile` is not empty" do
      it "delegates to the `to_pile`'s #valid_move? method" do
        expect(free_cell).to receive(:valid_move?).with(full_cell.top_card)

        game.valid_move?(full_cell, free_cell)
      end
    end
  end

  describe "#won?" do
    it "returns false if the foundations are empty" do
      expect(game.won?).to be_falsey
    end

    it "returns false if any foundation is incomplete" do
      foundation = game.foundations.first
      foundation.cards.concat(Card.by_suit(foundation.suit))

      expect(game.won?).to be_falsey
    end

    it "returns true if all foundations are complete" do
      game.foundations.each do |foundation|
        foundation.cards.concat(Card.by_suit(foundation.suit))
      end

      expect(game.won?).to be_truthy
    end
  end
end
