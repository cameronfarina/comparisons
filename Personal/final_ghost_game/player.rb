require "set"

class Player

    ALPHABET = ("a".."z").to_a

    attr_reader :name

    def initialize(name)
        @name = name
        @dictionary = Set.new(File.readlines("dictionary.txt").map(&:chomp))

    end

    # def is_valid_letter?(letter, fragment)
    #     @dictionary.any? { |word| word.start_with?(fragment + letter) }
    # end

    def get_guess(fragment, num_players)    
        puts "enter a letter"
        guess = gets.chomp.downcase

        until self.is_valid_letter?(guess)
          puts "please enter a valid letter"
          guess = gets.chomp.downcase
        end

        guess
    end

end


