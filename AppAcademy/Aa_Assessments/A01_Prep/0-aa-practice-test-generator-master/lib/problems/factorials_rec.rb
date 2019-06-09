# Write a recursive method that returns the first "num" factorial numbers.
# Note that the 1st factorial number is 0!, which equals 1. The 2nd factorial
# is 1!, the 3rd factorial is 2!, etc.

def factorials_rec(num)
    return [1] if num == 0
    return [1] if num == 1
    return [1, 1] if num == 2

    prev = factorials_rec(num - 1)
    
    prev << prev.last * (num - 1)
end
