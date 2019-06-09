require_relative 'player'
require_relative 'hand'
require_relative 'card'
require_relative 'deck'
require 'byebug'

class Game

  def set_up_players(num_players)
    @players = []
    num_players.times do |i|
      @players << Player.new("Player#{i}")
    end
    @players
  end

  def initialize(num_players)
    @players = set_up_players(num_players)
    @num_players = num_players
    @deck = Deck.new
    @current_player = @players.first
    welcome
    run_game
  end

  def welcome
    system 'clear'
    puts "Welcome to Eihcir0's GO FISH!"
    puts
    puts "This was designed to practice making specs so interface, er, sucks!"
    puts "Also, the game is pretty stupid without any computer players!!! :("
    puts
  end

  def run_game
    @deck.shuffle!
    deal
    play_round until game_over?
  end

  def play_round
    lucky_fisher = true  #set this true to start the round
    while lucky_fisher
      next if @current_player.hand.empty?
      prompt_player
      target_player, value_asked = player_guess
      #good_guess == player correctly guesses a card in opponents hand
      good_guess = @current_player.asks_for_card(target_player, value_asked)
      @current_player.gimme_da_cards(target_player, value_asked) if good_guess
      check_for_books
      return if game_over?
      lucky_fisher = false if round_over?(good_guess, value_asked)
    end
    switch_current_player
  end

  def check_for_books
    @current_player.lays_down_book while @current_player.has_book
  end

  def round_over?(good_guess, value_asked)
    if good_guess
      puts "GOOD GUESS!  You've got skill."  #should update #gimme_da_cards to display cards received
      puts
      true
    elsif go_fish_get_lucky?(value_asked)
      puts "#{@current_player.name} went fishin' and got lucky!"
      puts
      false
    else
      true
    end
  end

  def go_fish_get_lucky?(value_asked)
    puts "GO FISH!!"
    puts
    go_fish_card_value = @current_player.go_fish(@deck) unless @deck.empty?
    puts "Went fishing and got a #{"%02d" % go_fish_card_value}."
    puts
    check_for_books
    go_fish_card_value == value_asked
  end

  def prompt_player
    puts "#{@current_player.name}'s turn.  Now holding: "
    puts @current_player.hand.display
    puts
    puts "Books: #{@current_player.books.size}"
    puts
  end

  def player_guess
    valid_guess = false
    until valid_guess
      puts "Ask which player?  0 - #{@players.count - 1}?"
      guess = gets.chomp.to_i
      who = @players[guess]
      valid_guess = true if guess.between?(0, @num_players) && who != @current_player
    end
    puts "For which card value (1-13)?"
    what = gets.chomp.to_i
    [who, what]
  end


  def deal
    @players.size > 4 ? deal_size = 5 : deal_size = 7
    @players.each do |player|
      deal_size.times do
        player.hand.add(@deck.get_card)
      end
    end
  end

  def game_over?
    its_over = @deck.empty? && @players.all?{|player| player.hand.empty?}
    puts "GAME OVER!" if its_over #update to show winner
    its_over
  end

  def switch_current_player
    if @current_player == @players.last
      @current_player = @players.first
    else
      @current_player = @players[@players.index(@current_player)+1]
    end
  end
end#class

Game.new(3)
