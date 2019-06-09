class Array

  # Write a monkey patch of binary search:
  # E.g. [1, 2, 3, 4, 5, 7].my_bsearch(5) => 4
  def my_bsearch(target)
    
    middle_index = self.length / 2
    return middle_index if self[middle_index] == target
    return nil if self.empty? || !self.include?(target)
    
    if target > self[middle_index]
        self[middle_index + 1..-1].my_bsearch(target) + middle_index + 1
    else
        self[0...middle_index].my_bsearch(target)
    end
  end

end
