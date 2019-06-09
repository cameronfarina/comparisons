class Array

  # Write an Array#merge_sort method; it should not modify the original array.

  def merge_sort(&prc)
    prc ||= Proc.new { |a, b| a <=> b }

    middle_index = (self.length / 2)
    left = self[0...middle_index]
    right = self[middle_index..-1]
    return [] if self.empty?
    return [self[middle_index]] if self.length < 2


    Array.merge(left.merge_sort(&prc), right.merge_sort(&prc), &prc)
  end

  private
  def self.merge(left, right, &prc)
    new_array = []

      until left.empty? || right.empty?
          if prc.call(left.first, right.first) == -1
              new_array << left.shift
          else  
              new_array << right.shift
          end
      end

    new_array + left + right
  end
end
