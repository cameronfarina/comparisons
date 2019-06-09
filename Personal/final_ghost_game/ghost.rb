#Write the game for only 2 players, don't keep track of wins / losses
#instantiate a new Game object, passing in both of the players
# -- the game maintains a fragment instance variable - which represents the word as it has been built up by the players
# The Players take turns adding a letter to the fragment. The Game should ensure that a play is valid before actually changing the fragment.
# The Game checks the fragment against a dictionary; if the fragment is a word contained in the dictionary, then the previous player loses.
require_relative "player"
require_relative "ai_player"
require "set"

class Ghost

    def initialize(*players)
        @fragment = ""
        @dictionary = Set.new(File.readlines("dictionary.txt").map(&:chomp))
        @players = players
        @losers = []
        rand(0...@players.length).times { @players.rotate! }
        @lose_word = "GHOST"
        @losses = {}
        @players.each { |player| @losses[player] = "" }
    end

    def start_game
        until self.game_over?
            self.play_round
        end
        puts "The game is over, #{current_player.name} has won the game!"
    end

    def play_round
        self.reset_fragment

        until self.fragment_is_complete?
            self.take_turn(self.current_player)
        end

        self.update_score(self.previous_player)
        if @losses[self.previous_player] == @lose_word
            @losers << self.previous_player
            @players.delete(self.previous_player)
        end  
        self.round_is_over    
        self.display_standings    
    end

    def reset_fragment
        @fragment = ""
        puts "We're starting a new round! #{self.current_player.name}, please start the round by choosing the first letter of the new fragment!", ""
    end
    
    def round_is_over
        if @losers.empty?
            puts "#{self.previous_player.name} has lost the round", ""
        else
            puts "#{self.losing_player.name} has lost the round", ""
        end
    end

    def take_turn(player)
        p @players.map { |player| player.name }
        p @losers.map { |loser| loser.name }
        puts "#{player.name} please make a guess", ""
        puts "The current fragment is: " + @fragment, ""

        guess = player.get_guess(@fragment, @players.length)

        @fragment += guess
        puts "#{player.name} has guessed " + guess
        puts "The fragment is now: " + @fragment, ""
      
        self.next_player!
    
        puts "\n\n\n\n\n"
    end

    def update_score(player)
        @losses[player] += @lose_word[@losses[player].length] if !@losers.include?(player)
    end

    def fragment_is_complete?
        @dictionary.include?(@fragment)
    end

    def valid_guess?(guess)
        @dictionary.any? { |word| word.start_with?(@fragment+guess) }
    end

    def current_player
        @players.first
    end

    def previous_player
       @players.last
    end

    def losing_player
        @losers.last
    end

    def next_player!
        @players.rotate!
    end

    def game_over?
        loss_values = @losses.values
        loss_values.count(@lose_word) == loss_values.length - 1
    end

    def display_standings
        standings = {}
        @losses.each { |player, score| standings[player.name] = score }
        puts standings, ""
    end

end