# Kings Corners

**Do not share this repo or post it publicly. We will take violations
very seriously.**

## Rules

* Rename this directory `#{first_name}_#{last_name}`.
* Do not use the Internet or any prior notes.

* You have **1 hour** for the assessment. Do not worry if you do not
  complete the entire assessment; finish as much as you can.
* Descriptions of each method to implement are written into the `lib/`
  files. For each `lib/` file, there is a corresponding `spec/` file.
* Run the specs as you solve the assessment. Solve the assessment in
  this order:

```
bundle exec rspec spec/card_spec.rb
bundle exec rspec spec/deck_spec.rb
bundle exec rspec spec/pile_spec.rb
bundle exec rspec spec/player_spec.rb
bundle exec rspec spec
```

* Wait until you finish to run `bundle exec rspec spec`, which will
  run all the tests. Do this as a final check that you have them all
  passing.
* To run one specific spec, add `:line_number` at the end.  For example,
  `bundle exec rspec spec/card_spec.rb:30`.
* If a failing spec confuses you, look at the spec file to see if you
  can discern what it is asking of you. There are sometimes comments
  in the spec files to help you.
* Please ask your TAs any questions. If you get stuck or don't know
  why something is failing; ask. TAs will let you know whether they
  can answer your question, so ask anything.
* To submit:
  * Rename the directory `#{first_name}_#{last_name}`.
  * ZIP it (you can use OS X's built in zip functionality)
  * Use `.zip`; no boutique formats please :-)
  * Upload to progress tracker (http://progress.appacademy.io/).

## Game Rules

* The gameplay area starts with four foundation piles arranged on each
  side of the draw deck.
* In addition, there are four corner piles that start empty.  
  * These can only be built upon by placing a king in that pile first
  * Hence: "Kings Corners"
* The goal is to be the first player to empty your hand.
* Cards can be played/moved onto any other card in a solitaire-like pattern:
  * Descending by rank, alternating colors
  * e.g., Jack of Diamonds can be played on Queen of Spades
* During a turn, a player can take four actions:
  * Play a correct card from their hand onto any non-empty pile
  * Play any card onto an empty foundation pile
  * Move a full pile onto another pile
    * Must maintain the solitaire pattern
  * Play a King onto an empty corner pile
* A player takes as many actions as they can on their turn
* They end their turn by drawing a card from the top of the draw deck.

Further game rules are described [here][kings-corner-rules], but the
above is the limit of what you need to implement.

[kings-corner-rules]: https://www.pagat.com/layout/kingscorners.html

**Copyright App Academy, please do not post online**

KINGS CORNER is a multiplayer, card-shedding game with logic similar to Solitaire and FreeCell.

  [Corner]  [Regular] [Corner]
  [Regular] [Deck]    [Regular]
  [Corner]  [Regular] [Corner]

There are four regular piles, and four corner piles.  Players can play cards onto other cards in descending, alternating-color order.  For example, a player can play the eight of spades (a black eight) on the nine of diamonds (a red nine), but not on the nine of clubs (a black nine).

Players can also move entire piles onto other piles, as long as this order is maintained: when the bottom card of one pile can be placed on the top card of another pile.

When a regular pile is empty, any card can be placed on that pile.  When a corner pile is empty, only a king can be placed there.  In all other ways, corner piles and regular piles are identical.

The game starts by dealing seven cards to each player, and then dealing one card from the top of the deck onto each of the regular piles.  On their turn, a player can make as many moves as they can.  They end their turn by drawing one card from the top of the deck.

The first player to empty their hand wins.
