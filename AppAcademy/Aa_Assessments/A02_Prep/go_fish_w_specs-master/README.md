# Go Fish!


* Descriptions of each method to implement are written into the `lib/`
  files. There is NOT a corresponding `spec` file for game.rb or card.rb.
* Run the specs as you solve the assessment. Solve the assessment in
  this order:

```
bundle exec rspec spec/deck_spec.rb
bundle exec rspec spec/hand_spec.rb
bundle exec rspec spec/player_spec.rb
```

* To run one specific spec, add `:line_number` at the end.  For example, `bundle exec rspec spec/deck_spec.rb:30`

* Wait until you finish to run `rspec spec`, which will run all the
  tests. Do this as a final check that you have them all passing.

## Game Rules (https://en.wikipedia.org/wiki/Go_Fish)

1. Five cards are dealt from a standard 52-card deck to each player, or seven cards if there are four or fewer players.  The remaining cards are shared between the players, usually spread out in a disorderly pile referred to as the "ocean" or "pool".

2. The player whose turn it is to play asks another player for his or her cards of a particular face value. For example Alice may ask, "Bob, do you have any threes?" Alice must have at least one card of the rank she requested.
3. Bob must hand over all cards of that rank if possible. If he has none, Bob tells Alice to "go fish" (or simply "fish"), and Alice draws a card from the pool and places it in her own hand. Then it is the next player's turn – unless the card Alice drew is the card she asked for, in which case she shows it to the other players, and she gets another turn.
4. When any player at any time has all four cards of one face value, it forms a book, and the cards must be placed face up in front of that player.

5. When all sets of cards have been laid down in books, the game ends. The player with the most books wins.
