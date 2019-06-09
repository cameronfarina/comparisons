require_relative "player"
require_relative "game"
require_relative "ai_player"

# players = [new Player(), new Player()];
# game = new game(players)
# _dict = new Dict()
#  _fragment = '';
#  - isWinningGuess
#  - isLosingGuess
#  - isValidGuess
# takeTurn -> Player.getGuess -> 

# if (isAI) {
#  // loop through Alphabet, call getGuess for each letter
#} else {
#  // guess =  Player.getGuess() -> z

# (until isValidLetter Player.getGuess)
#}



ghost = Game.new(Ai_Player.new("AI_BOB"), Player.new("Cameron"), Player.new("John"), Player.new("Robert"))


ghost.start_game