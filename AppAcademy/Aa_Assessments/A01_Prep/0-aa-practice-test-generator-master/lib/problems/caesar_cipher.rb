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

    (0...str.length).each do |i|
        if alpha.include?(str[i])
            current_index = alpha.index(str[i])
            new_index = (current_index + shift) % 26
            new_str += alpha[new_index]
        else
            new_str += str[i]
        end
    end
    new_str
end
