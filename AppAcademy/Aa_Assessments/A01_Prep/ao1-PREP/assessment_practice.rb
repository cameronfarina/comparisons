def is_prime?(number)
    # this function helps find prime numbers
   return false if number < 2

   (2...number).each do |factor|
        if number % factor == 0
            return false
        end
   end

   true
end

def nth_prime(n)
    # find the nth prime number
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
    # find the prime numbers within this number range

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

def element_count(array)
    # should return a hash where each key is an element of the 
    # array and it's corresponding value is the number of times 
    # it appears in the array

    count = Hash.new(0)

    array.each { |el| count[el] += 1 }
    return count
end

def char_replace!(str, hash)
    # should mutate the original string by replacing chars of the 
    # string with their corresponding values in the hash, if the char 
    # is a key of the hash

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
    # should use #inject to return the total product of all elements multiplied together
    array.inject { |acc, el| acc * el}
end

def my_reject(array, &prc)
    new_array = []

    array.each { |ele| new_array << ele if prc.call(ele) == false }

    new_array
end

def my_one?(array, &prc)
    new_array = []
    array.each { |ele| new_array << ele if prc.call(ele) == true }

    return true if new_array.length == 1
    false
end

def hash_select(hash, &prc)
    selected = {}

    hash.each do |k, v| 
        if prc.call(k, v)
            selected[k] = v
        end
    end
    selected
end

def xor_select(array, prc_1, prc_2)
    new_array = []
    
    array.each do |el|
        if (prc_1.call(el) == true && prc_2.call(el) == false)  || (prc_2.call(el) == true && prc_1.call(el) == false)
            new_array << el
        end
    end 
    new_array
end

def proc_count(num, array)
    count = 0
    array.each { |proc_object| count += 1 if proc_object.call(num) == true }
    count
end

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

def greatest_common_factor(array)

     (array.min).downto(1) do |factor| 
          if array.all? { |el| el % factor == 0 }
               return factor
          end
     end
end

#return the initials of the student with the highest average score
def highest_score(students)
    new_hash = {}

    students.each do |student|
        avg = student["scores"].sum / (student["scores"].length * 1.0)
        name = student["name"] 
        new_hash[name] = avg
    end

    max = 0
    name = ""

    new_hash.each do |student_name, avg|
        if avg > max
            max = avg
            name = student_name
        end
    end
  
    return get_initials(name)
end

def get_initials(name)
    new_name = ""

    name.split.each do |el|
        new_name += el[0]
    end

    new_name
end



# Array enumerables monkey patching
def factors(n)
    all_factors = []
    (1..n).each do |factor|
       all_factors << factor if n % factor == 0
    end
    all_factors
end

def subwords(string, words)
    included_words = []
    words.each do |word|
        included_words << word if string.include?(word)
    end
    included_words
end

def doubler(array)
    doubled = []
    array.each do |n|
        doubled << (n * 2)
    end
    doubled
end

class Array
    def bubble_sort!(&prc)
        prc ||= Proc.new { |a, b| a <=> b }
        return self if self.empty?

        sorted = false
        while !sorted
            sorted = true

            (0...self.length - 1).each do |i|
                if prc.call(self[i], self[i + 1]) == 1
                    sorted = false
                    self[i], self[i+ 1] = self[i + 1], self[i]
                end
            end
        end
        self.flatten
    end

    def bubble_sort
        copy = self.dup
        copy.bubble_sort!
    end

    def my_each(&prc)
        
            i = 0
            while i < self.count
                prc.call(self[i])

            i += 1
            end
        
        self
    end

    def my_map(&prc)
        new_array = []

        self.each { |el| new_array << prc.call(el) }
        
        new_array
    end

    def my_select
        new_array = []

        self.each do |el|
            if yield(el)
                new_array << el
            end
        end
        new_array
    end

    def my_inject(&prc)
        sum = self[0]
        self[1..-1].my_each{ |el| sum = prc.call(sum, el)}
        sum
    end

end


def concatenate(strings)
    strings.inject("") {|k,v| k += v }
end

# creating flights and passengers 

class Flight

    attr_reader :passengers

    def initialize(flight_number, capacity)
        @flight_number = flight_number
        @capacity = capacity
        @passengers = []
    end

    def full?
        @passengers.length == @capacity
    end

    def board_passenger(passenger)
        if passenger.has_flight?(@flight_number) && !full?
            @passengers << passenger
        end
    end
    
    def list_passengers
        @passengers.map { |passenger| passenger.name }
    end

    def [](index)
        @passengers[index]
    end

    def <<(passenger)
        self.board_passenger(passenger)
    end

end

class Passenger

    attr_reader :name

    def initialize(name)
        @name = name
        @flight_numbers = []
    end

    def has_flight?(flight_number)
        @flight_numbers.include?(flight_number.upcase)
    end

    def add_flight(flight_number)
        if !has_flight?(flight_number)
            @flight_numbers << flight_number.upcase
        end
    end
end

# creating an instance of a class (Code) and using the Class constant
class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

    def self.random(length)
        pegs_array = []
        length.times { pegs_array << POSSIBLE_PEGS.keys.sample }
        Code.new(pegs_array)
    end
end
# describe "::random" do
#       it "should accept a length (number) as an arg" do
#         Code.random(5)
#       end

#       it "should call Code::new with an array of the given length containing random pegs" do
#         expect(Code).to receive(:new).with(instance_of(Array))
#         Code.random(5)
#       end

#       it "should return a Code instance with a randomized pegs array of the given length" do
#         random_code = Code.random(5)
#         expect(random_code).to be_instance_of(Code)
#         expect(random_code.pegs.length).to eq(5)
#       end
#     end


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

    str.each_char do |char|
        current_index = alpha.index(char)
        if alpha.include?(char)
          new_index = (current_index + shift) % 26
          new_char = alpha[new_index]
          new_str += new_char
        else 
          new_str += char
        end
    end

    new_str
end

# Write a method, `digital_root(num)`. It should Sum the digits of a positive
# integer. If it is greater than 10, sum the digits of the resulting number.
# Keep repeating until there is only one digit in the result, called the
# "digital root". **Do not use string conversion within your method.**
#
# You may wish to use a helper function, `digital_root_step(num)` which performs
# one step of the process.

# Example:
# digital_root(4322) => digital_root(11) => (2)
def digital_root(num)
  while num > 10
    num = digital_root_step(num)
  end
  num
end

def digital_root_step(num)
    var = 0
  
    while num > 0
        var += (num % 10)
        num /= 10
    end
    var
end

# Jumble sort takes a string and an alphabet. It returns a copy of the string
# with the letters re-ordered according to their positions in the alphabet. If
# no alphabet is passed in, it defaults to normal alphabetical order (a-z).

# Example:
# jumble_sort("hello") => "ehllo"
# jumble_sort("hello", ['o', 'l', 'h', 'e']) => 'ollhe'

def jumble_sort(str, alphabet = nil)
  alphabet ||= ("a".."z").to_a

  sorted = false

  while !sorted 
    sorted = true

    (0...str.length - 1).each do |i|
      current_letters_index = alphabet.index(str[i])
      next_letters_index = alphabet.index(str[i + 1])
      if current_letters_index > next_letters_index
          str[i], str[i+1] = str[i+1], str[i]
          sorted = false
      end

    end

  end
    str
end

class Array
  # Write a method, `Array#two_sum`, that finds all pairs of positions where the
  # elements at those positions sum to zero.

  # NB: ordering matters. I want each of the pairs to be sorted smaller index
  # before bigger index. I want the array of pairs to be sorted
  # "dictionary-wise":
  #   [0, 2] before [1, 2] (smaller first elements come first)
  #   [0, 1] before [0, 2] (then smaller second elements come first)

  def two_sum
    new_array = []
      
    (0...self.length).each do |start_idx|
        (start_idx + 1...self.length).each do |end_idx|
      
          if self[start_idx] + self[end_idx] == 0
            new_array << [start_idx, end_idx]
          end
      
        end
    end

    new_array
  end
end

class String
  # Returns an array of all the subwords of the string that appear in the
  # dictionary argument. The method does NOT return any duplicates.

  def real_words_in_string(dictionary)
    new_array = []
    subs = []

      (0...self.length).each do |start_idx|
        (start_idx...self.length).each do |end_idx|
            subs << self[start_idx..end_idx]
          end
      end

        i = 0
        while i < subs.length
            if dictionary.include?(subs[i]) && !new_array.include?(subs[i])
              new_array << subs[i]
            end

        i += 1
        end
      new_array
  end
end

# Write a method that returns the factors of a number in ascending order.

def factors(num)
    new_array = []
    return [1, num] if prime?(num)

    (1..num).each do |factor|
        if num % factor == 0
          new_array << factor
        end
    end
    new_array
end

def prime?(num)

  (2...num).each do |factor|
    if num % factor == 0
      return false
    end
  end
  true
end
