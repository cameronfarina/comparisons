class Array

  def my_zip(*arrays)
    self.length.times.map { |i| [self[i]] + arrays.map { |sub_arr| sub_arr[i] } }
  end

end

