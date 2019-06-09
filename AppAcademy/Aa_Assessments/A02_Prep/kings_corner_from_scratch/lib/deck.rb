class Deck

    def self.all_cards
        cards = []
        Card.suits.each do |suit|
            Card.values.each do |value|
                cards << Card.new(suit, value)
            end
        end
        cards
    end

    def initialize(cards = Deck.all_cards)
        @cards = cards
    end
end