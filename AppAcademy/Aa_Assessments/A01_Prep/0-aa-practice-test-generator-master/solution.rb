# The "calls itself recursively" spec may say that there is no method
# named "and_call_original" if you are using an older version of
# rspec. You may ignore this failure.
# Also, be aware that the first factorial number is 0!, which is defined
# to equal 1. So the 2nd factorial is 1!, the 3rd factorial is 2!, etc.
def factorials_rec(num)
  if num == 1
    [1]
  else
    facs = factorials_rec(num - 1)
    facs << facs.last * (num - 1)
    facs
  end
end

def base_converter(num, b)
  return "" if num == 0

  digits = %w(0 1 2 3 4 5 6 7 8 9 a b c d e f)
  base_converter(num/b, b) + digits[num % b]
end


def digital_root(num)
  while num > 10
    num = digital_root_step(num)
  end

  num
end

def digital_root_step(num)
  root = 0
  while num > 0
    root += (num % 10)

    num /= 10
  end

  root
end

# Alternate Solution
# def digital_root(num)
#   digits = []
#
#   while num > 0
#     digits << num % 10
#     num /= 10
#   end
# 
#   digit_sum = digits.inject(&:+)
#
#   digit_sum > 10 ? digital_root(digit_sum) : digit_sum
# end

def make_better_change(value, coins)
  coins_to_check = coins.select{|coin| coin <= value}
  return nil if coins_to_check.empty?

  solutions = []

  coins_to_check.sort.reverse.each do |coin|
    remainder = value - coin

    if remainder > 0
      remainder_solution = make_better_change(remainder, coins_to_check)
      solutions << [coin] + remainder_solution unless remainder_solution.nil?
    else
      solutions << [coin]
    end
  end

  solutions.sort_by!{|arr| arr.size}.first
end

def permutations(array)
  return [array] if array.length <= 1


  # Similar to the subsets problem, we observe that to get the permutations
  # of [1, 2, 3] we can look at the permutations of [1, 2] which are
  # [1, 2] and [2, 1] and add the last element to every possible index getting
  # [3, 1, 2], [1, 3, 2], [1, 2, 3], [3, 2, 1], [2, 3, 1]

  # pop off the last element
  first = array.shift
  # make the recursive call
  perms = permutations(array)
  # we will need an array to store all our different permutations
  total_permutations = []


  # Now we iterate over the result of our recusive call say [[1, 2], [2, 1]]
  # and for each permutation add first into every index. This new subarray
  # gets added to total_permutations.
  perms.each do |perm|
    (0..perm.length).each do |i|
      total_permutations << perm[0 ... i] + [first] + perm[i .. -1]
    end
  end
  total_permutations.sort
end

def exponent(b, n)
  return 1 if n == 0

  if n > 0
    b * exponent(b, n - 1)
  else
    1.0/b * exponent(b, n + 1)
  end
end

def rec_sum(nums)
  return 0 if nums.empty?
  nums[0] + rec_sum(nums.drop(1))
end

def string_include_key?(string, key)
  return true if key.length == 0

  next_key_char = key.chars.first
  key_index = string.index(next_key_char)

  return false if key_index.nil?
  string_include_key?(string[key_index+1..-1], key[1..-1])
end

def eight_queens_possibilities(row_num, taken_columns, positions)
  positions ||= []
  return [positions] if row_num == 8

  all_positions = []
  columns_left = (0..7).to_a - taken_columns

  columns_left.each do |col|
    positions_dup = positions.dup
    positions_dup << [row_num, col]

    all_positions += eight_queens_possibilities(row_num + 1,
      taken_columns + [col], positions_dup)
  end

  all_positions
end

def prime_factorization(num)
  return [] if num == 1

  (2..Math.sqrt(num).ceil).each do |i|
    if num % i == 0
      return [i] + prime_factorization(num/i)
    end
  end

  return [num]
end

def fibs_sum(n)
  return 0 if n == 0
  return 1 if n == 1

  fibs_sum(n-1) + fibs_sum(n-2) + 1
end

def deep_dup(arr)
  arr.map{|el| el.is_a?(Array) ? deep_dup(el) : el}
end

def first_even_numbers_sum(n)
  return 2 if n == 1

  2 * n + first_even_numbers_sum(n-1)
end

def subsets(arr)
  return [[]] if arr.empty?

  subs = subsets(arr[0..-2])
  subs.concat(subs.map{|el| el += [arr.last]})
end

class Array

  def my_flatten
    flattened = []
    self.my_each do |el|
      el.is_a?(Array) ? flattened += el.my_flatten : flattened << el
    end
    flattened
  end

  def my_controlled_flatten(n)
    return self if n < 1
    result = []

    each do |el|
      if el.is_a?(Array)
        result += el.my_controlled_flatten(n-1)
      else
        result << el
      end
    end

    result
  end

end

class Array
  def dups
    positions = Hash.new { |h, k| h[k] = [] }

    each_with_index do |item, index|
      positions[item] << index
    end

    positions.select { |key, val| val.count > 1 }
  end
end

class Array

  def my_bsearch(target)
    return nil if size == 0
    mid = size/2

    case self[mid] <=> target
    when 0
      return mid
    when 1
      return self.dup.take(mid).my_bsearch(target)
    else
      search_res = self.dup.drop(mid+1).my_bsearch(target)
      search_res.nil? ? nil : mid + 1 + search_res
    end
  end

end


def factors(num)
  (1..num).select { |i| (num % i) == 0 }
end

def median
  return nil if empty?
  sorted = self.sort
  if length.odd?
    sorted[length / 2]
  else
    (sorted[length / 2] + sorted[length / 2 - 1]).fdiv(2)
  end
end

class Array

  def my_join(str = "")
    res = ""
    my_each_with_index do |el, i|
      res << el.to_s
      res << str unless i == size - 1
    end

    res
  end

end

class Hash

  def my_merge(hash2)
    self_dup = dup

    hash2.each do |k, v|
      self_dup[k] = v
    end

    self_dup
  end

end


class Array
  def two_sum
    pairs = []
    (0...length).each do |i|
      ((i + 1)...length).each do |j|
        pairs << [i, j] if self[i] + self[j] == 0
      end
    end

    pairs
  end
end

def is_prime?(num)
  (2...num).none? { |factor| num % factor == 0 }
end

def primes(count)
  primes = []

  i = 2
  until primes.count >= count
    primes << i if is_prime?(i)

    i += 1
  end

  primes
end

class Array

  def my_rotate(num=1)
    rotations = num % size
    rotated_arr = self.dup

    rotations.times do
      rotated_arr << rotated_arr.shift
    end

    rotated_arr
  end

end

class Array

  def my_reverse
    reversed = []
    my_each{|el| reversed.unshift(el)}
    reversed
  end

end


class String
  def real_words_in_string(dictionary)
    real_words = []
    (1...self.length - 1).each do |first|
      (first + 1...self.length).each do |last|
        word = self[first...last]
        if dictionary.include?(word)
          real_words << word unless real_words.include?(word)
        end
      end
    end
    real_words
  end
end

def caesar_cipher(str, shift)
  letters = ("a".."z").to_a

  encoded_str = ""
  str.each_char do |char|
    if char == " "
      encoded_str << " "
      next
    end

    old_idx = letters.find_index(char)
    new_idx = (old_idx + shift) % letters.count

    encoded_str << letters[new_idx]
  end

  encoded_str
end

LITTLE_WORDS = [
  "and",
  "the",
  "over"
]

def titleize(title)
  words = title.split(" ")
  titleized_words = words.map.with_index do |word, i|
    if i != 0 && LITTLE_WORDS.include?(word)
      word.downcase
    else
      word.capitalize
    end
  end

  titleized_words.join(" ")
end

def pig_latinify(sentence)
  translated_words = sentence.split(" ").map do |word|
    translate_word(word)
  end
  translated_words.join(" ")
end

def translate_word(word)
  vowels = %w(a e i o u)
  if vowels.include?(word[0])
    "#{word}ay"
  else
    phoneme_end = 0
    until vowels.include?(word[phoneme_end])
      phoneme_end += 1
    end
    phoneme_end += 1 if word[phoneme_end - 1] == "q"
    "#{word[phoneme_end..-1]}#{word[0...phoneme_end]}ay"
  end
end

class String
  def symmetric_substrings
    symm_subs = []

    length.times do |start_pos|
      (2..(length - start_pos)).each do |len|
        substr = self[start_pos...(start_pos + len)]
        symm_subs << substr if substr == substr.reverse
      end
    end

    symm_subs
  end
end

class Array

  def my_any?(&prc)
    my_each{|el| return true if prc.call(el)}
    false
  end

end

class Hash

  def my_each(&prc)
    keys.each do |k|
      prc.call(k, self[k])
    end
  end

end

class Array

  def my_all?(&prc)
    my_each{|el| return false unless prc.call(el)}
    true
  end

end

class Array

  def my_select(&prc)
    select = []

    self.my_each{|el| select << el if prc.call(el)}
    select
  end

end

class Array

  def my_each(&prc)
    (0...size).each do |i|
      prc.call(self[i])
    end

    self
  end

  def my_each_with_index(&prc)
    (0...size).each do |idx|
      prc.call(self[idx], idx)
    end

    self
  end
end

def doubler(array)
  array.map { |num| num * 2 }
end

class Array
  def my_inject(accumulator = nil, &block)
    i = 0

    if accumulator.nil?
      accumulator = self.first
      i += 1
    end

    while i < length
      accumulator = block.call(accumulator, self[i])
      i += 1
    end

    accumulator
  end
end

class Array

  def my_reject(&prc)
    self.dup - my_select(&prc)
  end

end

class Array

  def my_zip(*arrs)
    result = []
    (0...size).each do |idx|
      result << [self[idx]]
      arrs.each do |arr|
        result[idx] << arr[idx]
      end
    end

    result
  end

end


def jumble_sort(str, alphabet = nil)
  alphabet ||= ('a'..'z').to_a

  sorted = false
  until sorted
    sorted = true

    str.length.times do |i|
      break if i == (str.length - 1)
      if alphabet.index(str[i]) > alphabet.index(str[i + 1])
        str[i], str[i + 1] = str[i + 1], str[i]
        sorted = false
      end
    end
  end

  str
end

# Alternately:
#
# def jumble_sort(str, alphabet = nil)
#   alphabet ||= ('a'..'z').to_a
#
#   sorted_chars = str.chars.sort do |chr1, chr2|
#     alphabet.index(chr1) <=> alphabet.index(chr2)
#   end
#
#   sorted_chars.join
# end

class Array
  def merge_sort(&prc)
    # See how I create a Proc if no block was given; this eliminates
    # having to later have two branches of logic, one for a block and
    # one for no block.
    prc ||= Proc.new { |x, y| x <=> y }

    return self if count <= 1

    midpoint = count / 2
    sorted_left = self.take(midpoint).merge_sort(&prc)
    sorted_right = self.drop(midpoint).merge_sort(&prc)

    Array.merge(sorted_left, sorted_right, &prc)

  end

  private
  def self.merge(left, right, &prc)
    merged = []

    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        merged << left.shift
      when 0
        merged << left.shift
      when 1
        merged << right.shift
      end
    end

    merged.concat(left)
    merged.concat(right)

    merged
  end
end

class Array

  def my_quick_sort(&prc)
    prc ||= proc {|a, b| a<=>b}
    return self if size < 2

    pivot = first
    left = self[1..-1].select{|el| prc.call(el, pivot) == -1}
    right = self[1..-1].select{|el| prc.call(el, pivot) != -1}

    left.my_quick_sort(&prc) + [pivot] + right.my_quick_sort(&prc)
  end

end

class Array
  def bubble_sort!
    # Without a proc
    sorted = false
    until sorted
      sorted = true

      each_index do |i|
        next if i + 1 == self.length
        j = i + 1
        if self[i] > self[j]
          sorted = false
          self[i], self[j] = self[j], self[i]
        end
      end
    end

    self
  end

  def bubble_sort!(&prc)
    # With a proc
    prc ||= Proc.new { |x, y| x <=> y }

    sorted = false
    until sorted
      sorted = true

      each_index do |i|
        next if i + 1 == self.length
        j = i + 1
        if prc.call(self[i], self[j]) == 1
          sorted = false
          self[i], self[j] = self[j], self[i]
        end
      end
    end

    self
  end

  def bubble_sort(&prc)
    self.dup.bubble_sort!(&prc)
  end
end

