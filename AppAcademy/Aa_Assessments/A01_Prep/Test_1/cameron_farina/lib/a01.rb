# Write a method that binary searches an array for a target and returns its
# index if found. Assume a sorted array.

# NB: YOU MUST WRITE THIS RECURSIVELY (searching half of the array every time).
# We will not give you points if you visit every element in the array every time
# you search.

# For example, given the array [1, 2, 3, 4], you should NOT be checking
# 1 first, then 2, then 3, then 4.

def binary_search(arr, target)
    middle_index = (arr.length / 2)
    return middle_index if arr[middle_index] == target
    return nil if arr.length == 0 || !arr.include?(target)
    if target > arr[middle_index]
        binary_search(arr[middle_index + 1..-1], target) + middle_index + 1
    else
        binary_search(arr[0...middle_index], target)
    end
end


class Array
  # Write a new `Array#pair_sum(target)` method that finds all pairs of
  # positions where the elements at those positions sum to the target.

  # NB: ordering matters. I want each of the pairs to be sorted
  # smaller index before bigger index. I want the array of pairs to be
  # sorted "dictionary-wise":
  #   [0, 2] before [1, 2] (smaller first elements come first)
  #   [0, 1] before [0, 2] (then smaller second elements come first)

  def pair_sum(target)
    new_array = []

    (0...self.length).each do |i|
      (i + 1...self.length).each do |j|
        new_array << [i, j] if self[i] + self[j] == target
      end
    end
    new_array
  end
end

# Write a method called 'sum_rec' that
# recursively calculates the sum of an array of values
def sum_rec(nums)
  return 0 if nums.empty?
  return nums[0] if nums.length == 1

  nums[-1] + sum_rec(nums[0...-1])
end

# [1, 2, 3, 4] = 10
# [-10, 10, 5, 4] = 9


class String
  # Write a method that finds all the unique substrings for a word

  def uniq_subs
    subs = []
    (0...self.length).each do |i|
      (i...self.length).each do |j|
          sub = self[i..j]
          subs << sub if !subs.include?(sub)
      end
    end


    subs 
  end
end

def prime?(num)
  return false if num < 2

  (2...num).each do |factor|
    return false if num % factor == 0
  end

  true
end

# Write a method that sums the first n prime numbers starting with 2.
def sum_n_primes(n)
  return 0 if n == 0
  nums = []

  i = 2
  until nums.length == n
      nums << i if prime?(i)
    i += 1
  end
  nums.sum
end

class Array
  # Write a method that calls a passed block for each element of the array
  def my_each(&prc)

    i = 0
    until i == self.length
      prc.call(self[i])
      i += 1
    end
    self
  end
end

class Array
  # Write a method that calls a block for each element of the array
  # and returns a new array made up of the results
  def my_map(&prc)
      new_array = []

    self.each do |i|
        new_array << prc.call(i)
    end

    new_array
  end
end
