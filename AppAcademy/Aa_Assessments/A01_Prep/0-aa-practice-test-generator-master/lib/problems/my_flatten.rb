class Array

  # Takes a multi-dimentional array and returns a single array of all the elements
  # [1,[2,3], [4,[5]]].my_controlled_flatten(1) => [1,2,3,4,5]
  def my_flatten
    flattened = []

    self.each do |ele|
      if ele.is_a?(Array)
        flattened += ele.my_flatten
      else
        flattened << ele
      end
    end
      flattened
  end

  # Write a version of flatten that only flattens n levels of an array.
  # E.g. If you have an array with 3 levels of nested arrays, and run
  # my_flatten(1), you should return an array with 2 levels of nested
  # arrays
  #
  # [1,[2,3], [4,[5]]].my_controlled_flatten(1) => [1,2,3,4,[5]]
  def my_controlled_flatten(n)
      arr = self.dup
      flattened = []

      n.times do
        p n
        arr.each do |ele|
          p arr
          p ele 
          if ele.is_a?(Array)
          flattened += ele
          p flattened
          else
          flattened << ele
          p flattened
          end
        end
      end
      p flattened
      flattened
  end
end
