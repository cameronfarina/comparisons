require 'rspec'
require 'card'
require 'player'
require 'hand'
require 'deck'


describe Player do
  let(:deck) { double("deck") }
  player1 = Player.new("Richie")
  player2 = Player.new("Eichir")
  let(:card1) { double('card1', :value => 4, :suit => :diamonds)}
  let(:card2) { double('card2', :value => 4, :suit => :spades)}
  let(:card3) { double('card3', :value => 4, :suit => :clubs)}
  let(:card4) { double('card4', :value => 1, :suit => :hearts)}
  let(:card5) { double('card5', :value => 3, :suit => :hearts)}
  let(:card6) { double('card6', :value => 4, :suit => :hearts)}
  let(:hand1) { Hand.new([card1, card2, card3, card4, card5]) }
  let(:hand2) { Hand.new([card1, card2, card3, card4, card6]) }

  describe '#go_fish' do

    it 'adds card from deck to hand' do
      new_card = [Card.new(:spades, 2)]
      expect(deck).to receive(:get_card).and_return(new_card)
      player1.go_fish(deck)
      expect(player1.hand.cards).to match_array(new_card)
    end

    it 'returns the value of the card drawn' do
      new_card = [Card.new(:spades, 2)]
      expect(deck).to receive(:get_card).and_return(new_card)

      expect(player1.go_fish(deck)).to eq(2)
    end


  end

  describe '#lays_down_book' do

    it 'raises error if there are no books in hand' do

      expect{player1.lays_down_book}.to raise_error("NO BOOK DUMMY!")
    end

    it 'correctly lays down book' do
      book_in_hand = [card1,card2,card3,card6]
      player1.hand = hand2
      player1.lays_down_book
      expect(player1.books).to match_array(book_in_hand)
    end
  end

  describe '#asks_for_card' do
    let(:carda) { double('carda', :value => 8, :suit => :hearts)}
    let(:cardb) { double('cardb', :value => 12, :suit => :hearts)}
    let(:cardc) { double('cardc', :value => 11, :suit => :hearts)}
    let(:cardd) { double('cardc', :value => 11, :suit => :spades)}

    it 'must hold at least one of the card for which you ask' do
      player1.hand = Hand.new([carda])
      expect{player1.asks_for_card(player2, 7)}.to raise_error("Can't ask for something you don't have in hand")
    end

    it 'handles asks for card' do
      player1.hand = Hand.new([cardb, cardd])
      player2.hand = Hand.new([cardc])
      expect(player1.asks_for_card(player2, 11)).to be(true)
    end
  end

  describe '#gimme_da_cards' do
    let(:carde) { double('carde', :value => 6, :suit => :hearts)}
    let(:cardf) { double('cardf', :value => 6, :suit => :spades)}
    let(:cardg) { double('cardg', :value => 7, :suit => :clubs)}
    let(:cardh) { double('cardh', :value => 6, :suit => :clubs)}

    it 'raises error if the other player is not holding that card' do
      player2.hand = Hand.new([carde])
      expect{player1.gimme_da_cards(player2, 2)}.to raise_error("missing from other hand")
    end

    it 'handles getting a card from another player' do
      player1.hand = Hand.new([])
      player2.hand = Hand.new([cardf])
      player1.gimme_da_cards(player2, 6)
      expect(player1.hand.cards).to eq([cardf])
    end


  end



end


#
