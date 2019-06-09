require 'byebug'
class Array

  # Monkey patch the Array class and add a my_inject method. If my_inject receives
  # no argument, then use the first element of the array as the default accumulator.

  def my_inject(accumulator = nil, &prc)
    if accumulator.nil?
      accumulator = self.first
      self[1..-1].each { |el| accumulator = prc.call(accumulator, el) }
    else
      self[0..-1].each { |el| accumulator = prc.call(accumulator, el) }
    end
    accumulator
  end
end

# primes(num) returns an array of the first "num" primes.
# You may wish to use an is_prime? helper method.

def is_prime?(num)
  return false if num < 2

  (2...num).each do |factor|
      return false if num % factor == 0
  end
  true
end

def primes(num)
  prime_array = []

  i = 2
  until prime_array.length == num
     prime_array << i if is_prime?(i)

    i += 1
  end
  prime_array
end

# Write a recursive method that returns the first "num" factorial numbers.
# Note that the 1st factorial number is 0!, which equals 1. The 2nd factorial
# is 1!, the 3rd factorial is 2!, etc.

def factorials_rec(num)

    return [1] if num == 0
    return [1] if num == 1
    return [1, 1] if num == 2
   # [1, 1, 2, 6, 24, 120]
   # [0, 1, 2, 3,  4,  5]
    # num == 6
    # 5 * 24 = 120
    # 4 * 6 = 24
    previous_stack = factorials_rec(num - 1)

   previous_stack << previous_stack[-1] * (num - 1)
    # [1, 1, 2, 6, 24]                         24       *      5 == 120

end

class Array

  # Write an Array#dups method that will return a hash containing the indices of all
  # duplicate elements. The keys are the duplicate elements; the values are
  # arrays of their indices in ascending order, e.g.
  # [1, 3, 4, 3, 0, 3, 0].dups => { 3 => [1, 3, 5], 0 => [4, 6] }

  def dups
    new_hash = Hash.new { |h, k| h[k] = [] }

      self.each_with_index do |num, index|
            new_hash[num] << index
      end

      duplicate_hash = new_hash.select { |key, value| value.length > 1 }

    duplicate_hash
  end
end

class String

  # Write a String#symmetric_substrings method that returns an array of substrings
  # that are palindromes, e.g. "cool".symmetric_substrings => ["oo"]
  # Only include substrings of length > 1.

  def symmetric_substrings
    subs = []
      (0...self.length).each do |i|
        (i + 1...self.length).each do |j|
          substring = self[i..j]
          if substring == substring.reverse && substring.length > 2
            subs << substring
          end
        end
      end

      subs
  end
end

class Array

  # Write an Array#merge_sort method; it should not modify the original array.

  def merge_sort(&prc)
    prc ||= Proc.new { |a, b| a <=> b }

    middle = self.length / 2
    left = self[0...middle]
    right = self[middle..-1]
    return [self[middle]] if self.length == 1 
    return [] if self.length == 0
    


    Array.merge(left.merge_sort(&prc), right.merge_sort(&prc), &prc)
  end

  private
  def self.merge(left, right, &prc)
      merged = []

      until left.empty? || right.empty?
        if prc.call(left.first, right.first) == - 1
          merged << left.shift
        else
          merged << right.shift
        end
      end


      merged + left + right
  end
end
