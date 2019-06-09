require 'rspec'
require_relative 'practice_test'

describe "#factorials_rec" do
  it "returns first factorial number" do
    expect(factorials_rec(1)).to eq([1])
  end

  it "returns first two factorial numbers" do
    expect(factorials_rec(2)).to eq([1, 1]) # = [0!, 1!]
  end

  it "returns many factorials numbers" do
    expect(factorials_rec(6)).to eq([1, 1, 2, 6, 24, 120])
    # == [0!, 1!, 2!, 3!, 4!, 5!]
  end

  it "calls itself recursively" do
    # this should enforce you calling your method recursively.

    expect(self).to receive(:factorials_rec).at_least(:twice).and_call_original
    factorials_rec(6)
  end
end

describe "#base_converter" do
  it "converts a small number in binary" do
    expect(base_converter(5, 2)).to eq("101")
  end

  it "converts a large number into base 16" do
    expect(base_converter(1239449, 16)).to eq("12e999" || "12E999" )
  end
end

describe "#digital_root" do
  it "calculates the digital root of a single-digit number" do
    expect(digital_root(9)).to eq(9)
  end

  it "calculates the digital root of a larger number" do
    expect(digital_root(4322)).to eq(2)
  end

  it "does not call #to_s on the argument" do
    expect_any_instance_of(Fixnum).to_not receive(:to_s)
    digital_root(4322)
  end
end

describe "Make better change" do
  it "Returns the smallest possible array of coins: case 1" do
    expect(make_better_change(24, [10,7,1])).to match_array([10,7,7])
  end

  it "Returns the smallest possible array of coins: case 2" do
    expect(make_better_change(25, [10,7,1])).to match_array([10,7,7,1])
  end

  it "Returns the smallest possible array of coins: case 3" do
    expect(make_better_change(25, [10,8,7,1])).to match_array([10,8,7])
  end
end

describe "#permutations" do
  it "returns all permutations of an array" do
    expect(permutations([1, 2, 3])).to match_array([[1, 2, 3], [1, 3, 2], [2, 1, 3], [2, 3, 1], [3, 1, 2], [3, 2, 1]])
  end
end

describe "exponent" do
  it "correctly handles positive powers" do
    expect(exponent(5,3)).to eq(125)
  end

  it "correctly handles negative powers" do
    expect(exponent(2, -3)).to eq(1/8.0)
  end

  it "correctly handles 0" do
    expect(exponent(2, 0)).to eq(1)
  end
end

describe "#rec_sum" do
  it "returns the sums of all elements in an array" do
    arr = [1,2,3,4]
    expect(rec_sum(arr)).to eq(10)
  end

  it "returns 0 if the array is empty" do
    expect(rec_sum([])).to eq(0)
  end
end

describe "string_include_key" do
  it "returns true for the same string" do
    expect(string_include_key?("adblfci", "abc")).to eq(true)
  end

  it "handles keys with duplicate characters: case 1" do
    expect(string_include_key?("adbblfci", "abbc")).to eq(true)
  end

  it "handles keys with duplicate characters: case 2" do
    expect(string_include_key?("adbclfci", "abbc")).to eq(false)
  end

  it "returns false if the key characters are in the wrong order" do
    expect(string_include_key?("dblfcia", "abc")).to eq(false)
  end

  it "returns false if the string doesn't contain the key" do
    expect(string_include_key?("db", "abc")).to eq(false)
  end

end

require 'yaml'

describe "eight_queens_possibilities" do
  sol = YAML.load_file("./possible_boards.yml").sort
  pos = eight_queens_possibilities(0, [], nil)

  it "Returns an array of the correct_size" do
    expect(pos.length).to eq(sol.length)
  end

  it "Returns the correct positions" do
    expect(pos.sort).to eq(sol)
  end
end

describe "prime_factorization" do
  it "handles an input of 2" do
    expect(prime_factorization(2)).to eq([2])
  end

  it "Test case: 12" do
    expect(prime_factorization(12).sort).to eq([2,2,3])
  end

  it "Test case: 600851475143" do
    expect(prime_factorization(600851475143).sort).to eq([71,839,1471,6857])
  end
end

describe 'fibs_sum' do

  it 'It correctly gets the answer for the 1st fibonacci number' do
    expect(fibs_sum(1)).to eq(1)
  end

  it 'It correctly gets the answer for the first 2 fibonacci numbers' do
    expect(fibs_sum(2)).to eq(2)
  end

  it 'It correctly gets the answer for the first 6 fibonacci numbers' do
    expect(fibs_sum(6)).to eq(20)
  end

end

describe "deep_dup" do
  robot_parts = [
  ["nuts", "bolts", "washers"],
  ["capacitors", "resistors", "inductors"]
  ]

  copy = deep_dup(robot_parts)

  it "makes a copy of the original array" do
    expect(copy).to eq(robot_parts)
  end

  it "deeply copies arrays" do
    copy[1] << "LEDs"
    expect(robot_parts[1]).to eq(["capacitors", "resistors", "inductors"])
  end
end

describe 'first_even_numbers_sum' do

  it "Correctly returns the sum of the first even number" do
    expect(first_even_numbers_sum(1)).to eq(2)
  end

  it "Returns the sum of the first n even numbers" do
    expect(first_even_numbers_sum(6)).to eq(42)
  end

end

describe 'subsets' do

  it "Correctly returns all subsets of an array" do
    expect(subsets([1, 2, 3])).to match_array([[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]])
  end

end

describe "my_flatten" do
  it 'Flattens arrays correctly' do
    expect([1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten).to eq([1, 2, 3, 4, 5, 6, 7, 8])
  end
end

describe "my_controlled_flatten" do
  it "Flattens an array the specified number of levels" do
    expect([1,[2,3], [4,[5]], [[6,[7]]]].my_controlled_flatten(1)).to eq([1,2,3,4,[5], [6, [7]]])
  end
end

describe "#dups" do
  it "solves a simple example" do
    expect([1, 3, 0, 1].dups).to eq({ 1 => [0, 3] })
  end

  it "finds two dups" do
    expect([1, 3, 0, 3, 1].dups).to eq({ 1 => [0, 4], 3 => [1, 3] })
  end

  it "finds multi-dups" do
    expect([1, 3, 4, 3, 0, 3].dups).to eq({ 3 => [1, 3, 5] })
  end

  it "returns {} when no dups found" do
    expect([1, 3, 4, 5].dups).to eq({})
  end
end

describe "my_bsearch" do

  it "finds the first element in the array" do
    expect([1, 2, 3].my_bsearch(1)).to eq(0)
  end

  it "finds an element for an array with an even number of elements" do
    expect([2, 3, 4, 5].my_bsearch(3)).to eq(1)
  end

  it "finds an element for an array with an odd number of elements" do
    expect([2, 4, 6, 8, 10].my_bsearch(6)).to eq(2)
  end

  it "finds an element in the second half of the array (even)" do
    expect([1, 3, 4, 5, 9].my_bsearch(5)).to eq(3)
  end

  it "finds an element in the second half of the array (odd)" do
    expect([1, 2, 3, 4, 5, 6].my_bsearch(6)).to eq(5)
  end

  it "Returns nil if the element is not in the array (smaller)" do
    expect([1, 2, 3, 4, 5, 6].my_bsearch(0)).to eq(nil)
  end

  it "Returns nil if the element is not in the array (bigger)" do
    expect([1, 2, 3, 4, 5, 7].my_bsearch(6)).to eq(nil)
  end

end

describe "#factors" do
  it "returns the factors of 10 in order" do
    expect(factors(10)).to eq([1, 2, 5, 10])
  end

  it "returns just two factors for primes" do
    expect(factors(13)).to eq([1, 13])
  end
end

describe "#median" do
  let(:even_array) { [3, 2, 6, 7] }
  let(:odd_array) { [3, 2, 6, 7, 1] }

  it "returns nil for the empty array" do
    expect([].median).to be_nil
  end

  it "returns the element for an array of length 1" do
    expect([1].median).to eq(1)
  end

  it "returns the median of an odd-length array" do
    expect(odd_array.median).to eq(3)
  end

  it "returns the median of an even-length array" do
    expect(even_array.median).to eq(4.5)
  end
end

describe "my_join" do
  a = [ "a", "b", "c", "d" ]

  it "Joins an array if no argument is passed" do
    expect(a.my_join).to eq("abcd")
  end

  it "Joins an array if an argument is passed" do
    expect(a.my_join("$")).to eq("a$b$c$d")
  end
end

describe "my_merge" do
  a = {a: 1, b: 2, c: 3}
  b = {d: 4, e: 5}
  c = {c: 33, d: 4, e: 5}

  it "Merges 2 hashes and returns a hash" do
      expect(a.my_merge(b)).to eq(a.merge(b))
  end

  it "Priortizes values from the hash being merged in" do
      expect(a.my_merge(c)).to eq(a.merge(c))
  end
end

describe "#two_sum" do
  it "returns positions of pairs of numbers that add to zero" do
    expect([5, 1, -7, -5].two_sum).to eq([[0, 3]])
  end

  it "finds multiple pairs" do
    expect([5, -1, -5, 1].two_sum).to eq([[0, 2], [1, 3]])
  end

  it "finds pairs with same element" do
    expect([5, -5, -5].two_sum).to eq([[0, 1], [0, 2]])
  end

  it "returns [] when no pair is found" do
    expect([5, 5, 3, 1].two_sum).to eq([])
  end

  it "won't find spurious zero pairs" do
    expect([0, 1, 2, 3].two_sum).to eq([])
  end

  it "will find real zero pairs" do
    expect([0, 1, 2, 0].two_sum).to eq([[0, 3]])
  end
end


describe "#primes" do

  it "returns first five primes in order" do
    expect(primes(5)).to eq([2, 3, 5, 7, 11])
  end

  it "returns an empty array when asked for zero primes" do
    expect(primes(0)).to eq([])
  end
end

describe "my_rotate" do
  a = [ "a", "b", "c", "d" ]

  it "Rotates the elements 1 position if no argument is passed in" do
    expect(a.my_rotate).to eq(["b", "c", "d", "a"])
  end

  it "Rotates the elements correctly if an argument is passed in" do
    expect(a.my_rotate(2)).to eq(["c", "d", "a", "b"])
  end

  it "Rotates the elements correctly if a negative argument is passed in" do
    expect(a.my_rotate(-3)).to eq(["b", "c", "d", "a"])
  end

  it "Rotates the elements correctly for a large argument" do
    expect(a.my_rotate(15)).to eq(["d", "a", "b", "c"])
  end

end

describe "my_reverse" do
  a = [ "a", "b", "c", "d" ]

  it "Reverses an array" do
    expect(a.my_reverse).to eq(a.reverse)
  end
end

describe "real_words_in_string" do
  it "finds a simple word" do
    words = "asdfcatqwer".real_words_in_string(["cat", "car"])
    expect(words).to eq(["cat"])
  end

  it "doesn't find words not in the dictionary" do
    words = "batcabtarbrat".real_words_in_string(["cat", "car"])
    expect(words).to be_empty
  end

  it "finds words within words" do
    dictionary = ["bears", "ear", "a", "army"]
    words = "erbearsweatmyajs".real_words_in_string(dictionary)
    expect(words).to match_array(["bears", "ear", "a"])
  end
end

describe "#caesar_cipher" do
  it "encodes a simple word" do
    expect(caesar_cipher("aaa", 11)).to eq("lll")
  end

  it "wraps around the alphabet" do
    expect(caesar_cipher("zzz", 1)).to eq("aaa")
  end

  it "encodes multiple words" do
    expect(caesar_cipher("catz hatz", 2)).to eq("ecvb jcvb")
  end
end

describe "titleize" do
  it "capitalizes a word" do
    expect(titleize("jaws")).to eq("Jaws")
  end

  it "capitalizes every word (aka title case)" do
    expect(titleize("david copperfield")).to eq("David Copperfield")
  end

  it "doesn't capitalize 'little words' in a title" do
    expect(titleize("war and peace")).to eq("War and Peace")
  end

  it "does capitalize 'little words' at the start of a title" do
    expect(titleize("the bridge over the river kwai")).to eq("The Bridge over the River Kwai")
  end
end

describe "#pig_latinify" do
  it "translates a word beginning with a vowel" do
    s = pig_latinify("apple")
    expect(s).to eq("appleay")
  end

  it "translates a word beginning with a consonant" do
    s = pig_latinify("banana")
    expect(s).to eq("ananabay")
  end

  it "translates a word beginning with two consonants" do
    s = pig_latinify("cherry")
    expect(s).to eq("errychay")
  end

  it "translates two words" do
    s = pig_latinify("eat pie")
    expect(s).to eq("eatay iepay")
  end

  it "translates a word beginning with three consonants" do
    expect(pig_latinify("three")).to eq("eethray")
  end

  it "counts 'sch' as a single phoneme" do
    s = pig_latinify("school")
    expect(s).to eq("oolschay")
  end

  it "counts 'qu' as a single phoneme" do
    s = pig_latinify("quiet")
    expect(s).to eq("ietquay")
  end

  it "counts 'qu' as a consonant even when it's preceded by a consonant" do
    s = pig_latinify("square")
    expect(s).to eq("aresquay")
  end

  it "translates many words" do
    s = pig_latinify("the quick brown fox")
    expect(s).to eq("ethay ickquay ownbray oxfay")
  end
end

describe "#symmetric_substrings" do

  it "handles a simple example" do
    expect("aba".symmetric_substrings).to match_array(["aba"])
  end

  it "handles two substrings" do
    expect("aba1cdc".symmetric_substrings).to match_array(["aba", "cdc"])
  end

  it "handles nested substrings" do
    expect("xabax".symmetric_substrings).to match_array(["aba", "xabax"])
  end
end

describe 'my_any' do
  a= [1,2,3]
  it "returns true if any number matches the block" do
    expect(a.my_any? { |num| num > 1 }).to eq(true)
  end

  it "returns false if no elementes match the block" do
    expect(a.my_any? { |num| num == 4 }).to eq(false)
  end
end

describe "my_each" do
  a = {"a"=> 1, "b" => 2, "c" => 3}
  res = ""
  a.my_each{|key, v| v.times{res << key}}

  it "Calls the proc on each key value pair" do
    expect(res.chars.sort).to eq(["a","b","b","c","c","c"])
  end
end

describe 'my_all' do
  a= [1,2,3]

  it "returns true if all elements match the block" do
    expect(a.my_all? { |num| num > 0 }).to eq(true)
  end

  it "returns false if not all elementes match the block" do
    expect(a.my_all? { |num| num > 1 }).to eq(false)
  end
end

describe 'my_select' do

  a = [1, 2, 3]

  it 'It correctly selects elements according to the passed in block' do
    expect(a.my_select { |num| num > 1 }).to eq([2, 3])
  end

  it 'It returns an empty array if there are no matches' do
    expect(a.my_select { |num| num == 4 }).to eq([])
  end

end

describe "my_each" do
  res = []
  [1,2,3].my_each{|el| res << 2*el}

  it "It works for blocks" do
    expect(res).to eq([2,4,6])
  end
end

describe "my_each_with_index" do
  res = []
  [1,2,3].my_each_with_index{|el, i| res << 2*el + i}

  it "It works for blocks that use both the index and element" do
    expect(res).to eq([2,5,8])
  end
end

describe "#doubler" do
  let(:array) { [1, 2, 3] }

  it "doubles the elements of the array" do
    expect(doubler(array)).to eq([2, 4, 6])
  end

  it "does not modify the original array" do
    duped_array = array.dup

    doubler(array)

    expect(array).to eq(duped_array)
  end
end

describe 'Array#my_inject' do

  it 'calls the block passed to it' do
    expect do |block|
      ["test array"].my_inject(:dummy, &block)
    end.to yield_control.once
  end

  it 'makes the first element the accumulator if no default is given' do
    expect do |block|
      ["el1", "el2", "el3"].my_inject(&block)
    end.to yield_successive_args(["el1", "el2"], [nil, "el3"])
  end

  it 'yields the accumulator and each element to the block' do
    expect do |block|
      [1, 2, 3].my_inject(100, &block)
    end.to yield_successive_args([100, 1], [nil, 2], [nil, 3])
  end

  it 'does NOT call the built in Array#inject or Array#reduce method' do
    original_array = ["original array"]
    expect(original_array).not_to receive(:inject)
    expect(original_array).not_to receive(:reduce)
    original_array.my_inject {}
  end

  it 'with accumulator, it correctly injects and returns answer' do
    expect([1, 2, 3].my_inject(1) { |acc, x| acc + x }).to eq(7)
    expect([3, 3].my_inject(3) { |acc, x| acc * x }).to eq(27)
  end

  it 'without accumulator, it correctly injects and returns answer' do
    expect([1, 2, 3].my_inject { |acc, x| acc + x }).to eq(6)
    expect([3, 3].my_inject { |acc, x| acc * x }).to eq(9)
  end
end

describe 'my_reject' do

  a = [1, 2, 3]

  it 'It correctly selects elements that do not match the passed in block' do
    expect(a.my_reject { |num| num > 1 }).to eq([1])
  end

  it 'It returns all elements if no elements match the block' do
    expect(a.my_reject { |num| num == 4 }).to eq([1,2,3])
  end

end

describe "my_zip" do
  a = [ 4, 5, 6 ]
  b = [ 7, 8, 9 ]

  it 'Zips arrays of the same size' do
    expect([1, 2, 3].my_zip(a, b)).to eq([[1, 4, 7], [2, 5, 8], [3, 6, 9]])
  end

  it 'Zips arrays of differnet sizes and adds nil appropriately' do
    expect(a.my_zip([1,2], [8])).to eq([[4, 1, 8], [5, 2, nil], [6, nil, nil]])
  end

  c = [10, 11, 12]
  d = [13, 14, 15]

  it "Zips arrays with more elements than the original" do
    expect([1, 2].my_zip(a, b, c, d)).to eq([[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]])
  end

end

describe "#jumble_sort" do
  it "defaults to alphabetical order" do
    expect(jumble_sort("hello")).to eq("ehllo")
  end

  it "takes an alphabet array and sorts by that order" do
    alph = ("a".."z").to_a
    hello = "hello".chars.uniq
    alph -= hello
    alphabet = (hello += alph)

    expect(jumble_sort("hello", alphabet)).to eq("hello")
  end

  it "sorts by a reversed alphabet" do
    reverse = ("a".."z").to_a.reverse
    expect(jumble_sort("hello", reverse)).to eq("ollhe")
  end
end

describe "#merge_sort" do
  let(:array) { [1, 2, 3, 4, 5].shuffle }

  it "works with an empty array" do
    expect([].merge_sort).to eq([])
  end

  it "works with an array of one item" do
    expect([1].merge_sort).to eq([1])
  end

  it "sorts numbers" do
    expect(array.merge_sort).to eq(array.sort)
  end

  it "will use block if given" do
    reversed = array.merge_sort do |num1, num2|
      # reverse order
      num2 <=> num1
    end
    expect(reversed).to eq([5, 4, 3, 2, 1])
  end

  it "does not modify original" do
    duped_array = array.dup
    duped_array.merge_sort
    expect(duped_array).to eq(array)
  end

  it "calls the merge helper method" do
    expect(Array).to receive(:merge).at_least(:once).and_call_original
    array.merge_sort
  end
end

describe "my_quick_sort" do

  a = (0..8).to_a

  it "Sorts an array of numbers with no duplicates" do
    expect(a.shuffle.my_quick_sort).to eq(a)
  end

  it "Sorts an array of numbers with duplicates" do
    expect([1,2,3,3,9,10,10,17,432].shuffle.my_quick_sort).to eq([1,2,3,3,9,10,10,17,432])
  end

  it "Sorts according to the block passed in" do
    expect(a.shuffle.my_quick_sort{|a,b| b<=>a}).to eq(a.reverse)
  end
end

describe "#bubble_sort!" do
  let(:array) { [1, 2, 3, 4, 5].shuffle }

  it "works with an empty array" do
    expect([].bubble_sort!).to eq([])
  end

  it "works with an array of one item" do
    expect([1].bubble_sort!).to eq([1])
  end

  it "sorts numbers" do
    expect(array.bubble_sort!).to eq(array.sort)
  end

  it "modifies the original array" do
    duped_array = array.dup
    array.bubble_sort!
    expect(duped_array).not_to eq(array)
  end

  it "will use a block if given" do
    sorted = array.bubble_sort! do |num1, num2|
      # order numbers based on descending sort of their squares
      num2**2 <=> num1**2
    end

    expect(sorted).to eq([5, 4, 3, 2, 1])
  end
end

describe "#bubble_sort" do
  let(:array) { [1, 2, 3, 4, 5].shuffle }

  it "delegates to #bubble_sort!" do
    expect_any_instance_of(Array).to receive(:bubble_sort!)

    array.bubble_sort
  end

  it "does not modify the original array" do
    duped_array = array.dup
    array.bubble_sort
    expect(duped_array).to eq(array)
  end
end

