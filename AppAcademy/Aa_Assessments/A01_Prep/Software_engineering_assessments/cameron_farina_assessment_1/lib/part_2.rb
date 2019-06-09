def element_count(array)
    count = Hash.new(0)

    array.each { |el| count[el] += 1 }
    return count
end

def char_replace!(str, hash)
    chars = str.split("")

    i = 0

   while i < chars.length
        current_chars = chars[i]
        if hash.has_key?(chars[i])
            current_val = hash[chars[i]]
            str[i] = current_val
        end

        i += 1
    end
    return str
end

def product_inject(array)
    array.inject { |acc, el| acc * el}
end