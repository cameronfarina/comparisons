# return b^n recursively. Your solution should accept negative values
# for n
def exponent(b, n)
    return b if n == 1
    return 1 if n == 0
    if n > 0
     b * exponent(b, n - 1)
    else 
     1.0/b * exponent(b, n + 1)
    end
end

# exponent(2, -3)


# 2 ** 2 = 4
# 2 ** 3 = 8
# 2 ** 4 = 16