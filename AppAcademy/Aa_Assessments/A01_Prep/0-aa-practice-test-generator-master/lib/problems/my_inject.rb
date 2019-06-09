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


  def

  end
  
end
