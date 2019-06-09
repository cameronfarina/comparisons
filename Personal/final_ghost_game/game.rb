require "set"
# require_relative "player"
# require_relative "ai_player"

class Game
    
    def initialize(*players)
        @dictionary = Set.new(File.readlines("dictionary.txt").map(&:chomp))
        @losing_word = "GHOST"
        @fragment = ""     
        @players = players
        @losses = {}
        @players_who_have_been_eliminated = []
    end

    def randomize_players
        rand(0...@players.length).times { @players.rotate! }
    end

    def create_player_standings
        @players.each { |player| @losses[player] = "" }  
    end

    def start_game
        self.randomize_players
        self.create_player_standings
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
        if @losses[self.previous_player] == @losing_word
            @players_who_have_been_eliminated << self.previous_player
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
        if @players_who_have_been_eliminated.empty?
            puts "#{self.previous_player.name} has lost the round", ""
        else
            puts "#{self.losing_player.name} has lost the round", ""
        end
    end
    
    def take_turn(player)
        self.display_players
        self.display_eliminated_players

        puts "#{player.name} please make a guess", ""
        puts "The current fragment is: " + @fragment, ""

        guess = player.get_guess(@fragment, @players.length)

        @fragment += guess

        puts "#{player.name} has guessed " + guess
        puts "The fragment is now: " + @fragment, ""
      
        self.next_player!
    
        puts "\n\n\n"
    end

    def display_players
        p @players.map { |player| player.name }
    end

    def display_eliminated_players
        p @players_who_have_been_eliminated.map { |loser| loser.name }

    end

    def update_score(player)
        @losses[player] += @losing_word[@losses[player].length] if !@players_who_have_been_eliminated.include?(player)
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
        @players_who_have_been_eliminated.last
    end

    def next_player!
        @players.rotate!
    end

    def game_over?
        loss_values = @losses.values
        loss_values.count(@losing_word) == loss_values.length - 1
    end

    def display_standings
        standings = {}
        @losses.each { |player, score| standings[player.name] = score }
        puts standings, ""
    end

    def num_players
        @players.length
    end
    
    def is_valid_letter?(letter)
        new_fragment = @fragment + letter
        @dictionary.any? { |word| word.start_with?(new_fragment) }
    end

    def is_winning_letter?(letter)
      new_fragment = @fragment + letter
      @dictionary.all? { |word| word.start_with?(new_fragment) && (word.length - new_fragment.length) <= @players.length }
    end

    def is_losing_letter?(letter)
        new_fragment = @fragment + letter
        @dictionary.include?(new_fragment)
    end


    # take turn --> if its a normal player, ask them for a guess. if its not valid, make them guess again until its valid./
    # if its not a normal player, as in , its an ai, we need to have them compute every possible letter to see if theres a winning letter.
    # if there isnt a winning letter, make sure we choose a letter that isnt a losing letter. 
    # if theres none, then return the losing letter to end the round.
end