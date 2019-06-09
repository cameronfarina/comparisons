Rules:
The game is played with 4 players, each being dealt 7 cards
The rest of the deck is placed in the middle. 4 cards are taken from the
top of the deck and each carad is placed on one side of the deck. 
If one of the 4 taken cards is a king, that king is placed in a corner position
between two sides, and another card is taken from the top of the deck to ensure
that all 4 sides have cards.

Player one starts and draws one card from the deck in the middle. In order for 
a move to be valid, you must play like solitaire (descending order, opposite color).
Any NON-CORNER pile can be moved, again like solitaire, if the bottom card can 
be placed on the top card of a different pile.

Moving a pile opens a new "side location" and can now be filled by the current
player (whoever is up, and they can play any card they want in the empty spot).

The game is over when someone's hand is completely empty.
You cannot move corner piles
Corner piles can only be started with kings
You can play red queens on black king corners, and black queens on red king corners
You can move any piles to the king corners as long as they follow the rules of
solitaire. 

Classes:
Card
Deck
Pile
Player

-----------------------------------
CARD CLASS:

# class methods: suits / values (taken from blackjack)

# initialize(suit, value)
-- create a new card with a suit and value (rank)

# color
-- will need to establish the color of each card at some point to make sure its a valid move

# ranking
-- will need to stablish the ranking of each card to ensure its a valid move (can just use numbers 1 - 13)

-----------------------------------
DECK CLASS:

# class methods: all_cards (taken from blackjack)
-- returns an array of all 52 cards, no duplicates

# initialize (cards = Deck.all_cards)
-- create a new deck with 52 cards by default, unless prompted otherwise

# count
-- count method like in blackjack so that we can ensure cards aren't being dealt that don't exist

# take(n)
-- taking cards off the deck

# deal_hand
-- taking cards off the deck and putting them into a player's hand

# empty?
checking to see if the deck is empty

-----------------------------------
PILE CLASS:

# initialize
-- create new piles
-- need to keep track of whether the pile is a corner pile or not
-- piles must be empty to start = []

# legal_move?
-- legal moves:
* * * A king placed in a corner pile
* * * Any card value placed in any empty, non-king pile
* * * A card of the next descending value and opposite color being placed on the top card of another pile (can play a black jack on a red queen, but cannot play a black 10 on a red queen)

# move_pile
-- cannot be a corner pile
-- must result in legal_move? being true

-----------------------------------
PLAYER CLASS:

# initialize with an empty hand
-- []

# start_turn
-- will have to move a card from the deck to the player's hand (may need a #take helper method like in blackjack)
-- 
# 