# Write a recursive method that takes in a string to search and a key string.
# Return true if the string contains all of the characters in the key
# in the same order that they appear in the key.
#
# string_include_key?("cadbpc", "abc") => true
# string_include_key("cba", "abc") => false
def string_include_key?(string, key)
    return true if key.length == 0    
    first_char = key.chars.first
    key_index = string.index(first_char)

    return false if key_index.nil?
    string_include_key?(string[key_index + 1..-1], key[1..-1])

end
#string = cadbpc 
#string.index(key.chars.first)
# first_found_index = (cadbpc).index(a) = 1
#string[first_found_index + 1..-1]




# key = abc
# key.chars = ["a", "b", "c"]
# key.chars.first = "a"



