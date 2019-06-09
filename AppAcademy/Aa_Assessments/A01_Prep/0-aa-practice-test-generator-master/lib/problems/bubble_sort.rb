class Array
  def bubble_sort!(&prc)
    prc ||= Proc.new { |a,b| a <=> b }
      return [] if self.empty?

      sorted = false
      until sorted
        sorted = true

        (0...self.length - 1).each do |i|
            if prc.call(self[i], self[i + 1]) == 1
                self[i + 1], self[i] = self[i], self[i + 1]
                sorted = false
            end
          end

      end
      self
  end

  def bubble_sort
      new = self.dup
      new.bubble_sort!
  end
  
end

