require "set"


dictionary = Set.new(File.readlines("dictionary.txt").map(&:chomp))

p dictionary.any? { |word| word.start_with?(@fragment) }
