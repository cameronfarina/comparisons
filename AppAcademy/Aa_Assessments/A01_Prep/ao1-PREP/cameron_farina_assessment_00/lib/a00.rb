# Back in the good old days, you used to be able to write a darn near
# uncrackable code by simply taking each letter of a message and incrementing it
# by a fixed number, so "abc" by 2 would look like "cde", wrapping around back
# to "a" when you pass "z".  Write a function, `caesar_cipher(str, shift)` which
# will take a message and an increment amount and outputs the encoded message.
# Assume lowercase and no punctuation. Preserve spaces.
#
# To get an array of letters "a" to "z", you may use `("a".."z").to_a`. To find
# the position of a letter in the array, you may use `Array#find_index`.

def caesar_cipher(str, shift)
    alpha = ("a".."z").to_a
    new_str = ""

    str.each_char do |char|
        current_index = alpha.index(char)
        if alpha.include?(char)
          new_index = (current_index + shift) % 26
          new_char = alpha[new_index]
          new_str += new_char
        else 
          new_str += char
        end
    end

    new_str
end

# Write a method, `digital_root(num)`. It should Sum the digits of a positive
# integer. If it is greater than 10, sum the digits of the resulting number.
# Keep repeating until there is only one digit in the result, called the
# "digital root". **Do not use string conversion within your method.**
#
# You may wish to use a helper function, `digital_root_step(num)` which performs
# one step of the process.

# Example:
# digital_root(4322) => digital_root(11) => (2)
def digital_root(num)
    while num > 10
      num = digital_root_step(num)
    end
    num
end

def digital_root_step(num)
  remainders = 0
    while num > 0
      remainders += num % 10
          num /= 10
    end
    remainders

end


# def digital_root(num)
#     remainder = (num % 10)

#     return num if num < 10


#      (digital_root(num / 10) + remainder)
    
# end


# Jumble sort takes a string and an alphabet. It returns a copy of the string
# with the letters re-ordered according to their positions in the alphabet. If
# no alphabet is passed in, it defaults to normal alphabetical order (a-z).

# Example:
# jumble_sort("hello") => "ehllo"
# jumble_sort("hello", ['o', 'l', 'h', 'e']) => 'ollhe'

def jumble_sort(str, alphabet = nil)
  alphabet ||= ("a".."z").to_a

  sorted = false

  while !sorted 
    sorted = true

    (0...str.length - 1).each do |i|
      current_letters_index = alphabet.index(str[i])
      next_letters_index = alphabet.index(str[i + 1])
      if current_letters_index > next_letters_index
          str[i], str[i+1] = str[i+1], str[i]
          sorted = false
      end

    end

  end
    str
end


# def jumble_sort(str, alphabet = nil)
#     new_str = str.dup
#     alphabet ||= ("a".."z").to_a


#     sorted = false

#     while !sorted
#       sorted = true

#         (0...new_str.length - 1).each do |i|
#             current_letters_index = alphabet.index(new_str[i])
#             next_letters_index = alphabet.index(new_str[i + 1])
#           if current_letters_index > next_letters_index
#             new_str[i], new_str[i + 1] = new_str[i + 1], new_str[i]
#             sorted = false
#           end
#       end
#     end

#     new_str
# end 





class Array
  # Write a method, `Array#two_sum`, that finds all pairs of positions where the
  # elements at those positions sum to zero.

  # NB: ordering matters. I want each of the pairs to be sorted smaller index
  # before bigger index. I want the array of pairs to be sorted
  # "dictionary-wise":
  #   [0, 2] before [1, 2] (smaller first elements come first)
  #   [0, 1] before [0, 2] (then smaller second elements come first)

  def two_sum
    new_array = []
      
    (0...self.length).each do |start_idx|
        (start_idx + 1...self.length).each do |end_idx|
      
          if self[start_idx] + self[end_idx] == 0
            new_array << [start_idx, end_idx]
          end
      
        end
    end

    new_array
  end
end

class String
  # Returns an array of all the subwords of the string that appear in the
  # dictionary argument. The method does NOT return any duplicates.

  def real_words_in_string(dictionary)
    new_array = []
    subs = []

      (0...self.length).each do |start_idx|
        (start_idx...self.length).each do |end_idx|
            subs << self[start_idx..end_idx]
          end
      end

        i = 0
        while i < subs.length
            if dictionary.include?(subs[i]) && !new_array.include?(subs[i])
              new_array << subs[i]
            end

        i += 1
        end
      new_array
  end
end

# Write a method that returns the factors of a number in ascending order.

def factors(num)
    new_array = []
    return [1, num] if prime?(num)

    (1..num).each do |factor|
        if num % factor == 0
          new_array << factor
        end
    end
    new_array
end

def prime?(num)

  (2...num).each do |factor|
    if num % factor == 0
      return false
    end
  end
  true
end
