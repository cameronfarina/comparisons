# Write a method that translates a sentence into pig latin. 
# You may want a helper method.
# 'apple' => 'appleay'
# 'pearl' => 'earlpay'
# 'quick' => 'ickquay'
def pig_latinify(sentence)
    vowels = ["a", "e", "i", "o", "u"]
    alpha = ("a".."z").to_a
    new_word = ""

    
    (0...sentence.length).each do |i|
        if alpha.include?(sentence[i])
            if vowels.include?(sentence[0])
                new_word += sentence + "ay"
                return new_word
            elsif vowels.include?(sentence[i])
                new_word += sentence[i..-1] + sentence[0...i] + "ay"
                return new_word
            end
        else
            new_word += word[i]
        end
    end
    new_word
end

def pig_latin(word)
    vowels = ["a", "e", "i", "o", "u"]
    alpha = ("a".."z").to_a
    new_word = ""

    
    (0...word.length).each do |i|
        if alpha.include?(word[i])
            if vowels.include?(word[0])
                new_word += word + "ay"
            elsif vowels.include?(word[i])
                new_word += word[i..-1] + word[0...i] + "ay"
            end
        else
            new_word += word[i]
        end
    end
    new_word
end