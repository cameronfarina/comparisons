# Write a recursive method that takes in a base 10 number n and
# converts it to a base b number. Return the new number as a string
#
# E.g. base_converter(5, 2) == "101"
# base_converter(31, 16) == "1f"

def base_converter(num, b)
    
end

p base_converter(10, 2)

p display base_converter(num, b)
p display digits
p display base_converter(num/b, b)
p display digits[num % b]
p display base_converter(num/b, b) + digits[num % b]