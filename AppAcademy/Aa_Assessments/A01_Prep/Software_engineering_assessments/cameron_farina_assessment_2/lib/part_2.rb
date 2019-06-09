def proper_factors(num)
    numbers = []

    (1...num).each do |factor|
        if num % factor == 0
            numbers << factor
        end
    end
    numbers
end


def aliquot_sum(n)

   return proper_factors(n).sum

end

def perfect_number?(n)
  return true if n == aliquot_sum(n)
  false
end

def ideal_numbers(n)
    new_array = []

    until new_array.length == n
        (1...new_array.length).each do |num|
            if  perfect_number?(num) == true
                new_array << num
            end
        end        
    end
    new_array
end