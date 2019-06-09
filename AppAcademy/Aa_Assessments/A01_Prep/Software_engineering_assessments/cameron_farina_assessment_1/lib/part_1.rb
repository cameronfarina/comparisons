def is_prime?(number)
   return false if number < 2

   (2...number).each do |factor|
        if number % factor == 0
            return false
        end
   end

   true
end

def nth_prime(n)
    i = 0

    ans = []

    while ans.length < n
        if is_prime?(i)
            ans << i
        end

        i = i + 1
    end
    ans[n-1]
end


def prime_range(min, max)
    new_array = []
    i = min

    while i <= max && i >= min
        if is_prime?(i)
            new_array << i
        end
        i += 1
    end

    new_array
end

