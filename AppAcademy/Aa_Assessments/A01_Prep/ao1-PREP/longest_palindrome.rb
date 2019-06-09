def longest_palindrome(string)
    palindrome_length = 0
    (0...string.length - 1).each do |i|
        (i + 1...string.length).each do |j|
            current_str = string[i..j]
            current_str_length = current_str.length
            if palindrome?(current_str)
                palindrome_length = current_str_length if current_str_length > palindrome_length
            end
        end
    end

    if palindrome_length < 2
        return false
    else
        return palindrome_length
    end
end

def palindrome?(str)
    str == str.reverse
end

# p longest_palindrome("palindrome") #=> false
# p longest_palindrome("181847117432") #=> 6
# p longest_palindrome("noonminimum") #=> 5


def first_even_numbers_sum(n)
    return 0 if n == 0
    return 2 if n == 1

    2 * n + first_even_numbers_sum(n - 1)
end

p first_even_numbers_sum(0) #=> 0
p first_even_numbers_sum(1) #=> 2 #=> 2
p first_even_numbers_sum(2) #=> 2 + 4 #=> 6
p first_even_numbers_sum(3) #=> 2 + 4 + 6 #=> 12
p first_even_numbers_sum(4) #=> 2 + 4 + 6 + 8 #=> 20

def my_inject(accumulator = nil, &prc)
    if accumulator.nil?
        accumulator = self.first
        self[1..-1].each { |el| accumulator = prc.call(accumulator, el) }
    else
        self[0..-1].each { |el| accumulator = prc.call(accumulator, el) }
    end
    accumulator
end