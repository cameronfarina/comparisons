require 'rspec'
require 'spec_helper'
require 'a01'

describe "#merge_sort" do
  # write a new `Array#merge_sort` method; it should not modify the
  # array it is called on, but create a new sorted array.
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

  it "sorts arrays with duplicates" do
    expect([5, 4, 3, 3, 2, 1].merge_sort).to eq([1, 2, 3, 3, 4, 5])
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

describe "#pair_sum" do
  # Write a new `Array#pair_sum(target)` method that finds all pairs of
  # positions where the elements at those positions sum to the target.

  # NB: ordering matters. I want each of the pairs to be sorted
  # smaller index before bigger index. I want the array of pairs to be
  # sorted "dictionary-wise":
  #   [0, 2] before [1, 2] (smaller first elements come first)
  #   [0, 1] before [0, 2] (then smaller second elements come first)

  it "returns positions of pairs of numbers that add to zero" do
    expect([5, 1, -7, -5].pair_sum(0)).to eq([[0, 3]])
  end

  it "returns positions of pairs that add to other targets" do
    expect([2, 1, 4, -2].pair_sum(5)).to eq([[1, 2]])
  end

  it "finds multiple pairs" do
    expect([5, -1, -5, 1].pair_sum(0)).to eq([[0, 2], [1, 3]])
  end

  it "finds pairs with same element" do
    expect([5, -5, -5].pair_sum(0)).to eq([[0, 1], [0, 2]])
  end

  it "returns [] when no pair is found" do
    expect([5, 5, 3, 1].pair_sum(7)).to eq([])
  end

  it "won't find spurious target pairs" do
    expect([0, 1, 2, 3].pair_sum(0)).to eq([])
  end
end

describe "Array#my_flatten" do
  let(:array) { ["a", "b", ["c", "d", ["e"]]] }

  it "does not modify the original array" do
    array.my_flatten

    expect(array).to eq(["a", "b", ["c", "d", ["e"]]])
  end

  it "does not call Array#flatten" do
    expect(array).not_to receive(:flatten)
    expect(array).not_to receive(:flatten!)

    array.my_flatten
  end

  context "when called with no level specified" do
    it "recursively flattens all nested arrays" do
      expect(array.my_flatten).to eq(["a", "b", "c", "d", "e"])
    end
  end

  context "when called with level = 0" do
    it "does not flatten the array" do
      expect(array.my_flatten(0)).to eq(["a", "b", ["c", "d", ["e"]]])
    end
  end

  context "when called with level = 1" do
    it "flattens arrays nested one level deep" do
      expect(array.my_flatten(1)).to eq(["a", "b", "c", "d", ["e"]])
    end
  end
end

# This method returns true if the sentence passed as an argument
# can be created by rearranging the receiver.
describe "shuffled_sentence_detector" do
  it "can detect a shuffled sentence" do
    sentence1 = "the cat ate the rat"
    sentence2 = "the rat ate the cat"
    expect(sentence1.shuffled_sentence_detector(sentence2)).to eq(true)
  end

  it "doesn't return false positives" do
    sentence1 = "het act tea eth tar"
    sentence2 = "the cat ate the rat"
    expect(sentence1.shuffled_sentence_detector(sentence2)).to eq(false)
  end

  it "anagrams don't cause a false positive" do
    sentence1 = "the cat ate the rat"
    sentence2 = "tcatr hatha eteet"
    expect(sentence1.shuffled_sentence_detector(sentence2)).to eq(false)
  end

  it "partial matches don't cause a false positive" do
    sentence1 = "the cat ate the rat"
    sentence2 = "the rat ate cat"
    expect(sentence1.shuffled_sentence_detector(sentence2)).to eq(false)
  end
end

describe "#nth_prime" do
  # `nth_prime(n)` returns the nth prime number
  it "returns the first prime number" do
    expect(nth_prime(1)).to eq(2)
  end

  it "returns the fifth prime number" do
    expect(nth_prime(5)).to eq(11)
  end

  it "returns nil when asked for the zeroth prime" do
    expect(nth_prime(0)).to be_nil
  end
end

describe 'Array#my_each' do
  it 'calls the block passed to it' do
    expect do |block|
      ["test array"].my_each(&block)
    end.to yield_control.once
  end

  it 'yields each element to the block' do
    expect do |block|
      ["el1", "el2"].my_each(&block)
    end.to yield_successive_args("el1", "el2")
  end

  it 'does NOT call the Array#each or Array#map! method' do
    original_array = ["original array"]
    expect(original_array).not_to receive(:each)
    expect(original_array).not_to receive(:map!)
    original_array.my_each {}
  end

  it 'is chainable and returns the original array' do
    original_array = ["original array"]
    expect(original_array.my_each {}).to be(original_array)
  end
end

describe "Array#my_find" do
  it "calls the block passed to it" do
    expect do |block|
      ["test element"].my_find(&block)
    end.to yield_control
  end

  it "yields each element to the block" do
    test_array = ["el1", "el2", "el3"]
    expect do |block|
      test_array.my_find(&block)
    end.to yield_successive_args("el1", "el2", "el3")
  end

  it "returns nil if no element is found" do
    expect([2].my_find { |el| el.odd? }).to eq(nil)
  end

  it "returns the first element for which the block evaluates to true" do
    test_array = [1, 2, 3, 4, 5]
    expect(test_array.my_find(&:even?)).to eq(2)
    expect(test_array.my_find { |el| el > 3 }).to eq(4)
  end

  it "does NOT call the built in Array#find" do
    test_array = ["el1", "el2", "el3"]
    expect(test_array).not_to receive(:find)
    expect(test_array).not_to receive(:detect)
    test_array.my_find {}
  end
end

